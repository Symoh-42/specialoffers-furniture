from audioop import reverse
from datetime import datetime
from django.shortcuts import render, redirect
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
import datetime, json
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.shortcuts import render, redirect
from django.contrib import messages
import requests
from accounts.models import Account

from carts.models import CartItem
from .models import Order, Payment, OrderProduct,Pay_on_delivery
from .forms import OrderForm
from store.models import Product
from order.models import WishList
# Create your views here.

def payments(request):
    body = json.loads(request.body)
    order = Order.objects.get(user=request.user, is_ordered=False, order_number=body['orderID'])

    # Store transaction details inside Payment model
    
    payment = Payment(
        user = request.user,
        payment_id = body['transID'],
        payment_method = body['payment_method'],
        amount_paid = order.order_total,
        status = body['status'],
    )
    payment.save()

    phone = order.phone
    if phone[0] is '+':
        phone = '0' + phone[4:-1]

    else:
        phone = phone

    order.payment = payment
    order.is_ordered = True
    order.save()

    # Move the cart items to Order Product table

    cart_items = CartItem.objects.filter(user=request.user)

    for item in cart_items:
        orderproduct = OrderProduct()
        orderproduct.order_id = order.id
        orderproduct.payment = payment
        orderproduct.user_id = request.user.id
        orderproduct.product_id = item.product_id
        orderproduct.quantity = item.quantity
        orderproduct.product_price = item.product.price
        orderproduct.ordered = True
        orderproduct.save()

        cart_item = CartItem.objects.get(id=item.id)
        product_variation = cart_item.variations.all()
        orderproduct = OrderProduct.objects.get(id=orderproduct.id)
        orderproduct.variations.set(product_variation)
        orderproduct.save()

        # Reduce the quantity of the sold products

        product = Product.objects.get(id=item.product_id)
        product.stock -= item.quantity
        product.save()

    # Clear cart

    CartItem.objects.filter(user=request.user).delete()

    # Send order recieved email to customer

    mail_subject = 'Thank you for your order!'
    message = render_to_string('order/order_recieved_email.html', {
        'user': request.user,
        'order': order,
    })
    to_email = request.user.email 
    send_email = EmailMessage(mail_subject, message, '"noreply@sipssolutions.co.ke"', to=[to_email])
    send_email.send()

    # Send to PhoneNumber

    url = f"https://apis.sematime.com/v1/99550d308e404de9b5db390cef1606f8/messages/single.url?recipients='0704662432,{phone}' &AuthToken=36fa33b648114b2fafec9de42ca5bee8&text=Thank you for your order. We have recieved it."

    payload={}
    headers = {}

    response = requests.request("GET", url, headers=headers, data=payload)

    print(response.text)

    
    # Send order number and transaction id back to sendData method via JsonResponse

    data = {
        'order_number': order.order_number,
        'transID': payment.payment_id,
    }
    return JsonResponse(data)

def place_order(request, quantity=0, total=0):
    current_user = request.user

    # IF THE CART IS LESS OR EQUAL, THEN REDIRECT BACK TO SHOP

    cart_items =CartItem.objects.filter(user=current_user)
    cart_count= cart_items.count()
    if cart_count <= 0:
        return redirect('home')

    grand_total = 0
    shipping = 0
    for cart_item in cart_items:
        total += (cart_item.product.price * cart_item.quantity)
        quantity += cart_item.quantity

    shipping = int((2*total)/100)
    grand_total = total + shipping

    if request.method =='POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            data = Order()
            # SAVING DATA IN DB
            data.user = current_user
            data.first_name = form.cleaned_data['first_name']
            data.last_name = form.cleaned_data['last_name']
            data.email = form.cleaned_data['email']
            data.phone = form.cleaned_data['phone']
            data.county = form.cleaned_data['county']
            data.subcounty = form.cleaned_data['subcounty']
            data.order_note = form.cleaned_data['order_note']
            data.order_total = grand_total
            data.shipping = shipping
            data.ip = request.META.get('REMOTE_ADDR')
            data.save()

            # GENERATING ORDER NUMBER
            yr = int(datetime.date.today().strftime('%Y'))
            dt = int(datetime.date.today().strftime('%d'))
            mt = int(datetime.date.today().strftime('%m'))
            d = datetime.date(yr, mt, dt)
            current_date = d.strftime("%Y%m%d")
            order_number = current_date + str(data.id)
            data.order_number = order_number
            data.save()
            order = Order.objects.get(user=current_user, is_ordered=False, order_number=order_number)

            context = {
                'order':order,
                'cart_item':cart_item,
                'cart_items':cart_items,
                'shipping':shipping,
                'total':total,
                'grand_total':grand_total,

            }

            return render (request, 'order/payments.html', context)
        else:
            return redirect('checkout')


def order_complete(request):
    order_number = request.GET.get('order_number')
    transID = request.GET.get('payment_id')

    try:
        order = Order.objects.get(order_number=order_number, is_ordered=True)
        ordered_products = OrderProduct.objects.filter(order_id=order.id)

        subtotal = 0
        for i in ordered_products:
            subtotal += i.product_price * i.quantity

        payment = Payment.objects.get(payment_id=transID)

        context = {
            'order': order,
            'ordered_products': ordered_products,
            'order_number': order.order_number,
            'transID': payment.payment_id,
            'payment': payment,
            'subtotal': subtotal,
        }

        messages.success(request, 'Item successfully added to cart')
        
        return render(request, 'order/order_complete.html', context)
    except (Payment.DoesNotExist, Order.DoesNotExist):
        return redirect('home')

def delivery(request):
    if request.method =='GET':
        jsonss = request.GET
        current_user = request.user

        phone = jsonss.get('phone')

        order_number_no = jsonss.get('order_number_no')
        product_details=jsonss.get('product_name')
        place_of_delivery = jsonss.get('place_of_delivery')
        amount_to_pay = jsonss.get('amount_paid'),

        delivery = Pay_on_delivery(
            user =  current_user,
            product_details = product_details,
            amount_to_pay = amount_to_pay,
            place_of_delivery = place_of_delivery,
            phone = phone,
            order_number_no = order_number_no,
        )
        delivery.save()

    # Send order recieved email to customer

    subject = 'Thank you for your order!'
    
    html_message = render_to_string('order/order_recieved_email.html', {
        'user': request.user,
        'order_number_no': order_number_no,
        'product_details':product_details,
        'place_of_delivery':place_of_delivery,
        'amount_to_pay':amount_to_pay
    })
    to_email = request.user.email
    msg = EmailMessage(subject, html_message, '"noreply@sipssolutions.co.ke"', to=[to_email])
    msg.content_subtype = "html"  # Main content is now text/html
    msg.send()

    # sending to the DIRECTOR OF SIPS

    subject = 'Check the customer order!'
    html_message = render_to_string('order/order_recieved_dir.html', {
        'user': request.user,
        'order_number_no':  order_number_no,
        'product_details':product_details,
        'place_of_delivery':place_of_delivery,
        'amount_to_pay':amount_to_pay
    })
    msg = EmailMessage(subject, html_message, '"noreply@sipssolutions.co.ke"', to=['msimeon937@gmail.com', 'kibsfor2030@gmail.com'])
    msg.content_subtype = "html"  # Main content is now text/html
    msg.send()

    # PHONE NUMBER
    url = f"https://apis.sematime.com/v1/99550d308e404de9b5db390cef1606f8/messages/single.url?recipients='0720650146,{phone}' &AuthToken=36fa33b648114b2fafec9de42ca5bee8&text=Thank you for your order. We have recieved it."

    payload={}
    headers = {}

    response = requests.request("GET", url, headers=headers, data=payload)

    # Clear cart
    CartItem.objects.filter(user=request.user).delete()

    return JsonResponse({'url': f"/order/order_items/{jsonss.get('order_number_no')}"})
                  

def orderItems(request,order_number):
    order_items = Pay_on_delivery.objects.filter(order_number_no=order_number).first()
    # print(order_items.product_details)

    context ={
        'order_items':order_items,
    }
    
    return render (request,'order/order_items.html', context)

def wishlistPage(request):
    wishItems = WishList.objects.filter(user=request.user)

    context = {
        'wishItems':wishItems,
    }
    return render (request, 'accounts/wishlist.html', context)

def addToWishListPage(request):
    if request.method == "POST":
        product_id = request.POST.get('product-id')
        product = Product.objects.get(id=product_id)

        try:
            wishItem = WishList.objects.get(user=request.user, product=product)
            if wishItem:
                wishItem.quantity += 1
                wishItem.save()
        except:
            WishList.objects.create(user=request.user, product=product)
        finally:
            messages.success(request, 'Item successfully added to saved items')
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def deleteFromWishlistPage(request):
    if request.method =="POST":
        item_id = request.POST.get('item-id')
        WishList.objects.filter(id=item_id).delete()

        messages.success(request, 'Item successfully deleted')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

