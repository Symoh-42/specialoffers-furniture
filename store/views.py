from re import sub
from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from django.db.models import Q
from django.contrib import messages

from carts.models import CartItem
from category.models import Category
from store.forms import ReviewForm
from subcategory.models import Sub_Category
from order.models import Order
from .models import Product, ReviewRating, ProductGallery, MarketingImages
from .forms import ReviewForm
from contact.models import Socials

from carts.views import _cart_id

# Create your views here.


def productsPage(request, slug):

    categories = Category.objects.filter(slug=slug).first()
    sub_categories = Sub_Category.objects.filter(category=categories.id).all()
    products = Product.objects.filter(category=categories.id).all()

    most_viewed = Product.objects.filter(
        most_viewed=True, category=categories.id).all()
    flash_sales = Product.objects.filter(
        flash_sales=True, category=categories.id).all()
    in_store_offers = Product.objects.filter(
        in_store_offers=True, category=categories.id)
    new_arrival = Product.objects.filter(
        new_arrival=True, category=categories.id)

    p = Paginator(Product.objects.filter(category_id=categories.id).all(), 20)
    page = request.GET.get('page')
    product_list = p.get_page(page)

    marketing_on_categories = MarketingImages.objects.filter(
        by_category=True).order_by('-updated_at').all()[:3]

    items_categories = Category.objects.all()

    social_urls = Socials.objects.all()

    context = {
        'categories': categories,
        'sub_categories': sub_categories,
        'products': products,
        'category_slug': slug,
        'product_list': product_list,
        'most_viewed': most_viewed,
        'marketing_on_categories': marketing_on_categories,
        'items_categories': items_categories,
        'social_urls': social_urls,
        'flash_sales': flash_sales,
        'in_store_offers': in_store_offers,
        'new_arrival': new_arrival
    }
    return render(request, 'store/products.html', context)


def productPage(request, slug):

    products2 = Product.objects.filter(slug=slug).first()
    sub_categories2 = Sub_Category.objects.filter(
        id=products2.sub_category_id).first()
    categories = Category.objects.filter(
        id=sub_categories2.category_id).first()

    # Get related products
    related = Product.objects.filter(
        sub_category=products2.sub_category_id).all()[:10]

    in_cart = CartItem.objects.filter(
        cart__cart_id=_cart_id(request), product=products2).exists()

    # Get the product gallery
    product_gallery = ProductGallery.objects.filter(product_id=products2.id)
    review = ReviewRating.objects.all()

    social_urls = Socials.objects.all()

    context = {
        'sub_category_slug': sub_categories2.slug,
        'category_slug': categories.slug,
        'product': products2,
        'related': related,
        # 'range'           : range(3, 5),
        'in_cart': in_cart,
        'product_gallery': product_gallery,
        'social_urls': social_urls,
        'review': review
    }
    return render(request, 'store/product.html', context)


def category(request, category, slug):

    sub_categories2 = Sub_Category.objects.filter(slug=slug).first()
    categories = Category.objects.filter(
        id=sub_categories2.category_id).first()
    sub_categories = Sub_Category.objects.filter(category=categories.id).all()
    products = Product.objects.filter(
        category_id=sub_categories2.category_id, sub_category_id=sub_categories2.id).all()

    most_viewed = Product.objects.filter(
        most_viewed=True, category_id=sub_categories2.category_id).all()
    flash_sales = Product.objects.filter(
        flash_sales=True, category_id=sub_categories2.category_id).all()
    in_store_offers = Product.objects.filter(
        in_store_offers=True, category_id=sub_categories2.category_id)
    new_arrival = Product.objects.filter(
        new_arrival=True, category_id=sub_categories2.category_id)

    p = Paginator(Product.objects.filter(
        category_id=sub_categories2.category_id, sub_category_id=sub_categories2.id).all(), 20)
    page = request.GET.get('page')
    product_list = p.get_page(page)

    social_urls = Socials.objects.all()

    context = {
        'categories': categories,
        'sub_categories': sub_categories,
        'products': products,
        'category_slug': category,
        'product_list': product_list,
        'social_urls': social_urls,
        'flash_sales': flash_sales,
        'in_store_offers': in_store_offers,
        'new_arrival': new_arrival,
        'most_viewed': most_viewed,
    }

    return render(request, 'store/products.html', context)


def searchPage(request):

    if 'keyword' in request.GET:
        keyword = request.GET['keyword']
        if keyword:
            products = Product.objects.order_by(
                '-created_at').filter(Q(description__icontains=keyword) | Q(product_name__icontains=keyword))
    context = {
        'products': products,
    }
    return render(request, 'store/search.html', context)

# Autocomplete Search


def submit_review(request, product_id):
    url = request.META.get('HTTP_REFERER')
    if request.method == 'POST':
        try:
            reviews = ReviewRating.objects.get(
                user__id=request.user.id, product__id=product_id)
            form = ReviewForm(request.POST, instance=reviews)
            form.save()
            messages.success(
                request, 'Thank you! Your review has been updated.')
            return redirect(url)
        except ReviewRating.DoesNotExist:
            form = ReviewForm(request.POST)
            if form.is_valid():
                data = ReviewRating()
                data.subject = form.cleaned_data['subject']
                data.rating = form.cleaned_data['rating']
                data.review = form.cleaned_data['review']
                data.ip = request.META.get('REMOTE_ADDR')
                data.product_id = product_id
                data.user_id = request.user.id
                data.save()
                messages.success(
                    request, 'Thank you! Your review has been submitted.')
                return redirect(url)


def toppicksPage(request):
    boosted = Product.objects.filter(boosted=True).all()

    context = {
        'boosted': boosted
    }

    return render(request, 'store/toppick.html', context)


def flashSalesPage(request):
    flash_sales = Product.objects.filter(flash_sales=True).all()

    context = {
        'flash_sales': flash_sales
    }

    return render(request, 'store/flashSales.html', context)


def inStoreOffersPage(request):
    in_store_offers = Product.objects.filter(in_store_offers=True).all()

    context = {
        'in_store_offers': in_store_offers
    }

    return render(request, 'store/inStoreOffers.html', context)


def mostViewedPage(request):
    most_viewed = Product.objects.filter(most_viewed=True).all()

    context = {
        'most_viewed': most_viewed
    }

    return render(request, 'store/mostViewed.html', context)


def arrivalPage(request):
    new_arrival = Product.objects.filter(new_arrival=True).all()

    context = {
        'new_arrival': new_arrival
    }

    return render(request, 'store/arrival.html', context)


def colorYourWorldPage(request):
    color_your_world = Product.objects.filter(color_your_world=True).all()

    context = {
        'color_your_world': color_your_world
    }

    return render(request, 'store/arrival.html', context)


def newArrivalPage(request):
    return render(request, 'store/newArrival.html')
