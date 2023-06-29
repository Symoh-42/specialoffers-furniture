from django.contrib import admin
from django.urls import path, include

from UrbanTwo import settings 
from . import views

from django.conf.urls.static import static
from django.conf import settings


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name= 'home'),

    # URLS FROM APPS
    path('accounts/', include('accounts.urls')),
    path('store/', include('store.urls')),
    path('cart/', include('carts.urls')),
    path('order/', include('order.urls')),
    path('api/v1/', include('mpesa_api.urls')),
    path('contact/', include('contact.urls')),
    path('blog/', include('blog.urls')),
    
    # THRID PARTY LOGINS
    path('tinymce/', include('tinymce.urls')),
    # path('accounts/', include('allauth.urls')),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
