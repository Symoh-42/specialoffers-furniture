from email.policy import default
from django.db import models

# Create your models here.
from django.db import models

# Create your models here.
from django.db import models

from accounts.models import Account
from store.models import Product, Variation

# Create your models here.
class Payment (models.Model):
    user = models.ForeignKey(Account, on_delete=models.CASCADE)
    payment_id = models.CharField(max_length=100)
    payment_method = models.CharField(max_length=100)
    amount_paid = models.CharField(max_length=100)
    status = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return self.payment_idy

class Order(models.Model):
    STATUS = (
        ('New', 'New'),
        ('Accepted', 'Accepted'),
        ('Completed','Completed'),
        ('Cancelled', 'Cancelled'),
    )

    user = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True)
    payment = models.ForeignKey(Payment, on_delete=models.SET_NULL, blank=True, null=True)
    order_number = models.CharField(max_length=20)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    phone = models.CharField(max_length=15)
    email = models.CharField(max_length=50)
    county = models.CharField(max_length=50)
    subcounty = models.CharField(max_length=50, blank=True)
    order_note= models.CharField(max_length=100, blank=True)
    order_total= models.FloatField()
    shipping = models.FloatField()
    status = models.CharField(max_length=10, choices=STATUS, default='New')
    ip = models.CharField(blank=True, max_length=20)
    is_ordered = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def full_name(self):
        return f'{self.first_name} {self.last_name}'

    def __str__(self):
        return self.first_name 

class OrderProduct(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    payment = models.ForeignKey(Payment, on_delete=models.SET_NULL, blank=True, null=True)
    user = models.ForeignKey(Account, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    variations = models.ManyToManyField(Variation, blank=True)
    quantity =models.IntegerField()
    product_price=models.FloatField()
    ordered = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Order Product'
        verbose_name_plural = 'Order Products'
      
    def __str__(self):
        return self.product.product_name

class Pay_on_delivery(models.Model):
    user = models.ForeignKey(Account, on_delete=models.CASCADE)
    product_details = models.TextField(max_length=300, default=0)
    amount_to_pay = models.CharField(max_length=100)
    place_of_delivery =models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    order_number_no = models.CharField(max_length=50, default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Pay On Delivery'
        verbose_name_plural = 'Pay On Delivery'
      
    def __str__(self):
        return self.order_number_no

class WishList (models.Model):
    user = models.ForeignKey(Account, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    variations = models.ManyToManyField(Variation, blank=True)
    quantity =models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


    def __str__(self):
        return f'{self.quantity} of {self.product}'

    class Meta:
        verbose_name = 'Wish List'
        verbose_name_plural = 'Wish Lists'