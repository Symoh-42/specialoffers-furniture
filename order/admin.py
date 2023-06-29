from django.contrib import admin
from .models import *
# Register your models here.

class OrderProductInline(admin.TabularInline):
    model = OrderProduct
    readonly_fields = ('payment', 'user', 'product', 'quantity', 'product_price', 'ordered')
    extra = 0

class OrderAdmin(admin.ModelAdmin):
    list_display = ['order_number', 'full_name', 'phone', 'email', 'county', 'order_total', 'shipping', 'status', 'is_ordered', 'created_at']
    list_filter = ['status', 'is_ordered']
    search_fields = ['order_number', 'first_name', 'last_name', 'phone', 'email']
    list_per_page = 20
    inlines = [OrderProductInline]

class Pay_on_deliveryAdmin(admin.ModelAdmin):
    list_display = ['user','amount_paid','place_of_delivery','phone','order_number_no','created_at']
    search_fields = ['user','amount_paid','place_of_delivery','phone','order_number_no']
    list_per_page = 20

class WishListAdmin(admin.ModelAdmin):
    list_display = ['user', 'product', 'quantity']


admin.site.register(Payment)
admin.site.register(Pay_on_delivery)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderProduct)
admin.site.register(WishList, WishListAdmin)