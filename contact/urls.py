from django.urls import path

from . import views

urlpatterns = [
    path('helpcenter', views.helpcenterPage, name='helpcenter'),
    path('returnpolicy', views.returnpolicyPage, name='returnpolicy'),
    path('contactus', views.contactPage,name='contactus'),
    path('placeorder', views.placeorderPage,name='placeorder'),
    path('helpcenter', views.helpcenterPage,name='helpcenter'),
]