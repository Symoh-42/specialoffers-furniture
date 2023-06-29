from django.urls import path
from . import views

urlpatterns = [
    path('products/<slug>/', views.productsPage, name='products'),
    path('products/<category>/<slug>/', views.category, name='products'),
    path('product/<slug>/', views.productPage, name='products'),
    path('search/', views.searchPage, name='search'),

    path('toppicks/', views.toppicksPage, name='toppicks'),
    path('flashSales/', views.flashSalesPage, name='flashSales'),
    path('newArrival/', views.newArrivalPage, name='newArrival'),
    path('inStoreOffers/', views.inStoreOffersPage, name='inStoreOffers'),
    path('mostViewed/', views.mostViewedPage, name='mostViewed'),
    path('arrival/', views.arrivalPage, name='arrival'),
    path('colorYourWorld/', views.colorYourWorldPage, name='colorYourWorld'),

    path('submit_review/<int:product_id>/',
         views.submit_review, name='submit_review'),
]
