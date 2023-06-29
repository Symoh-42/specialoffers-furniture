from django.http import HttpResponse, JsonResponse
import requests
from django.core.mail import EmailMessage

from datetime import datetime
import json, base64
from django.views.decorators.csrf import csrf_exempt
from django.template.loader import render_to_string

from .models import MpesaPayment, MpesaPaymentCallBack
from carts.models import CartItem
from order.models import Order, Payment, OrderProduct
from store.models import Product


lipa_time = datetime.now().strftime('%Y%m%d%H%M%S')
Business_short_code = "174379"
passkey = 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919'

# print(lipa_time)

def getAccessToken():
     url = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"

     payload={}
     headers = {
     'Authorization': 'Basic QXpzMktlalUxQVJ2SUw1SmRKc0FSYlYyZ0RyV21wT0I6aGlwR3ZGSmJPeHJpMzMwYw==',
     'Cookie': 'incap_ses_1025_2742146=3oNJa6jLtwsXEOtcx4g5DgVUVmMAAAAAUe5aDtGH7hTTM6rwfemssA==; visid_incap_2742146=ZmaASRKkRpSLBl+d8+TcLlal2mIAAAAAQUIPAAAAAABsmse7sebki8THcCx8s11o'
     }

     response = requests.get(url, headers=headers, data=payload)
     token = json.loads(response.text)

     # print(token.get('access_token'))
     validated_mpesa_access_token = token.get('access_token')

     # return HttpResponse(validated_mpesa_access_token)
     return validated_mpesa_access_token


def LipanaMpesaPpassword():
    data_to_encode = Business_short_code + passkey + lipa_time
    online_password = base64.b64encode(data_to_encode.encode())
    decode_password = online_password.decode('utf-8')
    return decode_password


@csrf_exempt
def lipa_na_mpesa_online(request ):

     # print(request.POST.get('phone'), request.POST.get('amount'))

     current_user = request.user
     access_token = getAccessToken()

     url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"

     payload = json.dumps({
          "BusinessShortCode": Business_short_code,
          "Password": LipanaMpesaPpassword(),
          "Timestamp": lipa_time,
          "TransactionType": "CustomerPayBillOnline",
          "Amount": 1,#int(request.POST.get('amount')),
          "PartyA": request.POST.get('phone'),
          "PartyB": Business_short_code,
          "PhoneNumber": request.POST.get('phone'),
          "CallBackURL": "https://sipssoluions.co.ke/api/v1/c2b/callback/url.json",
          "AccountReference": "sipssolutions",
          "TransactionDesc": "Test"
          })

     headers = {
          'Authorization': 'Bearer {}'.format(access_token),
          'Content-Type': 'application/json',
          'Cookie': 'incap_ses_1025_2742146=3oNJa6jLtwsXEOtcx4g5DgVUVmMAAAAAUe5aDtGH7hTTM6rwfemssA==; visid_incap_2742146=ZmaASRKkRpSLBl+d8+TcLlal2mIAAAAAQUIPAAAAAABsmse7sebki8THcCx8s11o'
          }

     response = requests.request("POST", url, headers=headers, data=payload)
     
     callback = json.loads(response.text)
     if callback.get('errorMessage') is None:

          # print(response.text)

          payment = MpesaPayment(
               user         = current_user,
               order_number = request.POST.get('orderID'),
               merchant_id  = callback.get('MerchantRequestID'),
               checkout_id  = callback.get('CheckoutRequestID'),
               response     = callback.get('CustomerMessage')
          )
          payment.save()
     else:

          # print(response.text)

          pass
     return HttpResponse(response)


@csrf_exempt
def register_urls(request):
     access_token = getAccessToken()
     api_url = "https://sandbox.safaricom.co.ke/mpesa/c2b/v1/registerurl"
     headers = {"Authorization": "Bearer %s" % access_token}
     options = {"ShortCode": Business_short_code,
                    "ResponseType": "Completed",
                    "ConfirmationURL": "https://sipssolutions.co.ke/api/v1/c2b/confirmation",
                    "ValidationURL": "https://sipssolutions.co.ke/api/v1/c2b/validation"}
     response = requests.post(api_url, json=options, headers=headers)
     return HttpResponse(response.text)


@csrf_exempt
def call_back(request):
     mpesa_body =request.body.decode('utf-8') 
     mpesa_payment = json.loads(mpesa_body)

     print(mpesa_payment)

     result = mpesa_payment.get('Body').get('stkCallback')

     # print(result)
     
     call = MpesaPayment.objects.filter(checkout_id = result.get('CheckoutRequestID')).first()

     # print(call)

     if result.get('ResultCode') == 0:

          # Saving data in the MpesaPaymentCallBack table

          payment = MpesaPaymentCallBack(
               user           = call.user,
               merchant_id    = result.get('MerchantRequestID'),
               checkout_id    = result.get('CheckoutRequestID'),
               result_code    = result.get('ResultCode'),
               result_desc    = result.get('ResultDesc'),
               amount         = result.get('CallbackMetadata').get('Item')[0]['Value'],
               receipt_number = result.get('CallbackMetadata').get('Item')[1]['Value'], 
               phone_number   = result.get('CallbackMetadata').get('Item')[3]['Value']
          )
          payment.save()
          
          order = Order.objects.get(user=call.user, is_ordered=False, order_number = call.order_number)

          # print(order)

          # Store transaction details inside Payment model
    
          payment = Payment(
               user = call.user,
               payment_id = result.get('CallbackMetadata').get('Item')[1]['Value'],
               payment_method = 'Mpesa',
               amount_paid = result.get('CallbackMetadata').get('Item')[0]['Value'],
               status = 'COMPLETED',
          )
          payment.save()

          order.payment = payment
          order.is_ordered = True
          order.save()
          
          # Move the cart items to Order Product table

          cart_items = CartItem.objects.filter(user=call.user)

          for item in cart_items:
               orderproduct = OrderProduct()
               orderproduct.order_id = order.id
               orderproduct.payment = payment
               orderproduct.user_id = call.user
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

          CartItem.objects.filter(user=call.user).delete()

          # Send order recieved email to customer

          mail_subject = 'Thank you for your order!'
          message = render_to_string('order/order_recieved_email.html', {
               'user': call.user,
               'order': order,
          })

          to_email = call.user.email
          send_email = EmailMessage(mail_subject, message, to=[to_email])
          send_email.send()

          # Send order number and transaction id back to sendData method via JsonResponse

          data = {
               'order_number': order.order_number,
               'transID': payment.payment_id,
          }
          return JsonResponse(data)

     else:
          print(result)

     context = {
               "ResultCode": 0,
               "ResultDesc": "Accepted"
          }

     return JsonResponse(dict(context))


@csrf_exempt
def validation(request):
     context = {
          "ResultCode": 0,
          "ResultDesc": "Accepted"
     }
     return JsonResponse(dict(context))


@csrf_exempt
def confirmation(request):
     mpesa_body =request.body.decode('utf-8')
     mpesa_payment = json.loads(mpesa_body)

     # print(mpesa_body)

     # payment = MpesaPayment(
     #      first_name=mpesa_payment['FirstName'],
     #      last_name=mpesa_payment['LastName'],
     #      middle_name=mpesa_payment['MiddleName'],
     #      description=mpesa_payment['TransID'],
     #      phone_number=mpesa_payment['MSISDN'],
     #      amount=mpesa_payment['TransAmount'],
     #      reference=mpesa_payment['BillRefNumber'],
     #      organization_balance=mpesa_payment['OrgAccountBalance'],
     #      type=mpesa_payment['TransactionType'],
     # )
     # payment.save()

     context = {
          "ResultCode": 0,
          "ResultDesc": "Accepted"
     }
     return JsonResponse(dict(context))