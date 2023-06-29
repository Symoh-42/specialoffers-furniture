from urllib import response
from django.db import models
from accounts.models import Account

class BaseModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        abstract = True


class MpesaPayment (BaseModel):
    user         = models.ForeignKey(Account, on_delete=models.CASCADE)
    order_number = models.CharField(max_length=20, blank=True)
    merchant_id  = models.CharField(max_length=100)
    checkout_id  = models.CharField(max_length=100)
    response     = models.CharField(max_length=100)

    
    class Meta:
        verbose_name = 'Mpesa Payment'
        verbose_name_plural = 'Mpesa Payments'


class MpesaPaymentCallBack(BaseModel):
    user            = models.ForeignKey(Account, on_delete=models.CASCADE)
    merchant_id     = models.CharField(max_length=300)
    checkout_id     = models.CharField(max_length=300)
    result_code     = models.TextField()
    result_desc     = models.TextField()
    amount          = models.CharField(max_length=300)
    receipt_number  = models.TextField()
    phone_number    = models.TextField()

    class Meta:
        verbose_name = 'Mpesa Payment CallBack'
        verbose_name_plural = 'Mpesa Payments CallBacks'
