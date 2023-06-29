from django.urls import path
from . import views

urlpatterns = [
    path ('place_order/', views.place_order, name='place_order'),
    path ('payments/', views.payments, name='payments'),
    path ('order_complete/', views.order_complete, name='order_complete'),

    path ('delivery/', views.delivery, name='delivery'),
    path ('order_items/<int:order_number>', views.orderItems, name='order_items'),

    path ('wishlist/', views.wishlistPage, name='wishlist'),
    path ('addToWishList/', views.addToWishListPage, name='addToWishList'),
    path ('deleteFromWishlist/', views.deleteFromWishlistPage, name='deleteFromWishlist'),
]