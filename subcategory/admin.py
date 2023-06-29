from django.contrib import admin
from .models import *
# Register your models here.
class Sub_CategoryAdmin(admin.ModelAdmin):
    prepopulated_fields  ={'slug': ('sub_category_name',)}
    list_display         =('sub_category_name', 'category', 'created_at')


admin.site.register(Sub_Category, Sub_CategoryAdmin)