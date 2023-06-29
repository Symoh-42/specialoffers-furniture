from django.urls import path
from . import views


urlpatterns = [
    path ('login/', views.loginPage, name='login'),
    path ('register/', views.registerPage, name='register'),
    path ('logout/', views.logoutPage, name='logout'),
    
    path ('userpage/', views.userpage, name='userpage'),
    path('user_orders/', views.user_orders, name= 'user_orders'),
    path('edit_profile/', views.edit_profile, name= 'edit_profile'),
    path('newsletter/', views.newsletterPage, name= 'newsletter'),
  
    path ('activate/<uidb64>/<token>/', views.activate, name='activate'),
    path ('resetpassword_validate/<uidb64>/<token>/', views.resetpassword_validate, name='resetpassword_validate'),
    path ('forgotPassword/', views.forgotPassword, name='forgotPassword'),
    path ('resetPassword/', views.resetPassword, name='resetPassword'),
] 