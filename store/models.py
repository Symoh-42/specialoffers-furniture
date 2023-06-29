from itertools import product
from django.db import models
from django.urls import reverse
from django.utils.safestring import mark_safe

from ckeditor.fields import RichTextField
from category.models import *
from subcategory.models import *
from accounts.models import Account
from django.db.models import Avg, Count


# Create your models here.
class Product(models.Model):
    category         = models.ForeignKey(Category, on_delete=models.CASCADE)
    sub_category     = models.ForeignKey(Sub_Category, on_delete=models.CASCADE)
    product_name     = models.CharField(max_length = 200, unique=True)
    slug             = models.SlugField(max_length=200,  blank=True)
    description      = RichTextField(blank=True, null=True)
    price            = models.IntegerField()
    discount_price   = models.IntegerField(help_text = "SHOULD BE HIGHER THAN THE ORIGINAL PRODUCT PRICE")
    
    photo_main       = models.ImageField(upload_to='photos/products', null=True)
    stock            = models.IntegerField()
    flash_sales         = models.BooleanField(default=False)
    in_store_offers     = models.BooleanField(default=False)
    most_viewed         = models.BooleanField(default=False)
    new_arrival    = models.BooleanField(default=False)
    color_your_world    = models.BooleanField(default=False)
    
    created_at       = models.DateTimeField(auto_now_add=True)
    modified_date    = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'products'

    def admin_photo(self):
        
        return mark_safe('<img src="{}" width="100" />'  .format(self.photo_main.url))
    admin_photo.short_description = 'Image'
    admin_photo.allow_tags = True

    def averageReview(self):
        reviews = ReviewRating.objects.filter(product=self, status=True).aggregate(average=Avg('rating'))
        avg = 0
        if reviews['average'] is not None:
            avg = float(reviews['average'])
        return avg

    def countReview(self):
        reviews = ReviewRating.objects.filter(product=self, status=True).aggregate(count=Count('id'))
        count = 0
        if reviews['count'] is not None:
            count = int(reviews['count'])
        return count

    @property
    def get_discount_percentage(self):
        discount = self.discount_price - self.price
        discount_percent = discount / self.price * 100
        return int(discount_percent)

    def get_url(self):
        return reverse('product_detail', args=[self.category.slug, self.slug])
    #    how to use it 
    #    product.get_url

    def __str__(self):
        return self.product_name


class VariationManager(models.Manager):
    def colors(self):
        return super(VariationManager, self).filter(variation_category= 'color', is_active=True)

    def sizes(self):
        return super(VariationManager, self).filter(variation_category= 'size', is_active=True)


variation_category_choice = (
    ('color', 'color'),
    ('size', 'size'),
)

class Variation(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    variation_category = models.CharField(max_length=100, choices=variation_category_choice)
    variation_value = models.CharField(max_length=100)
    is_active        = models.BooleanField(default=True)
    created_date     = models.DateTimeField(auto_now=True)


    objects = VariationManager()

     
    def __str__(self):
        return self.variation_value

class ReviewRating(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    user = models.ForeignKey(Account, on_delete=models.CASCADE)
    subject = models.CharField(max_length=100, blank=True)
    review = models.TextField(max_length=500, blank=True)
    rating = models.FloatField()
    ip = models.CharField(max_length=20, blank=True)
    status = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.subject

class ProductGallery(models.Model):
    product = models.ForeignKey(Product, default=None, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='store/products', max_length=255)

    def __str__(self):
        return self.product.product_name

    class Meta:
        verbose_name = 'Product Gallery'
        verbose_name_plural = 'Product Galleries'

class MarketingImages(models.Model):
    image               = models.ImageField(upload_to='marketing', max_length=255)
    on_offer            = models.BooleanField(default=False, help_text = "ONLY THE POSTER WITH THE PRODUCT ON OFFER")
    new_product         = models.BooleanField(default=False, help_text = "ONLY THE POSTER WITH THE NEW PRODUCT")
    large               = models.BooleanField(default=False, help_text = "ONLY A POSTER WITH A LARGE POSTER")
    by_category         = models.BooleanField(default=False, help_text = "FOR DIFFERENT CATEGORY")
    created_at          = models.DateTimeField(auto_now_add=True)
    updated_at          = models.DateTimeField(auto_now=True)

    def admin_photo(self):
        
        return mark_safe('<img src="{}" width="100" />'  .format(self.image.url))
    admin_photo.short_description = 'Image'
    admin_photo.allow_tags = True

    class Meta:
        verbose_name = 'Marketing Image'
        verbose_name_plural = 'Marketing Images'