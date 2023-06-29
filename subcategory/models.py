from django.db import models
from category.models import Category


# Create your models here.
class Sub_Category(models.Model):
    category           = models.ForeignKey(Category, on_delete=models.CASCADE)
    sub_category_name  = models.CharField(max_length=50)
    slug               = models.SlugField(max_length=100, unique=True)
    sub_category_image          = models.ImageField(upload_to = 'photos/sub_categories', blank = True)
    created_at         = models.DateTimeField(auto_now_add=True)

    class Meta:

        verbose_name_plural = 'sub_categories'

    def __str__(self):
        return self.sub_category_name