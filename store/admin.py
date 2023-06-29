from django.contrib import admin
import admin_thumbnails

from . models import Product, Variation, ReviewRating, ProductGallery, MarketingImages
#from . forms import ProductAdminForm
# Register your models here.

@admin_thumbnails.thumbnail('image')
class ProductGalleryInline(admin.TabularInline):
    model = ProductGallery
    extra = 1

class VariationInline(admin.TabularInline):
    model = Variation

class ProductAdmin(admin.ModelAdmin):
    prepopulated_fields  ={'slug': ('product_name',)}
    list_display = ('admin_photo',  'category', 'sub_category','product_name', 'price', 'stock', 'modified_date')
    list_per_page = 30
    readonly_fields = ('admin_photo',)
    inlines = [ProductGalleryInline, VariationInline]
    # form = ProductAdminForm
    #fields = ['description', ('discount_price', 'price')]

class MarketingImagesAdmin(admin.ModelAdmin):
    list_display = ['admin_photo','on_offer', 'new_product', 'large', 'by_category', 'created_at']
    readonly_fields = ('admin_photo',)

admin.site.register(MarketingImages, MarketingImagesAdmin)

admin.site.register(Product, ProductAdmin)
# admin.site.register(Variation)

admin.site.register(ReviewRating)
# admin.site.register(ProductGallery)