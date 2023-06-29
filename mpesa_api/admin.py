from django.contrib import admin
from .models import MpesaPaymentCallBack, MpesaPayment
# Register your models here.


class MpesaPaymentCallBackAdmin(admin.ModelAdmin):
    list_display = ['user', 'amount', 'phone_number','' 'receipt_number', 'created_at']



class MpesaPaymentAdmin(admin.ModelAdmin):
    list_display = ['user', 'order_number', 'checkout_id', 'response', 'created_at']

admin.site.register(MpesaPaymentCallBack, MpesaPaymentCallBackAdmin)
admin.site.register(MpesaPayment, MpesaPaymentAdmin)