from email.policy import default
from django.db import models

# Create your models here.
class BaseModel(models.Model):
     created_at = models.DateTimeField(auto_now_add=True)
     updated_at = models.DateTimeField(auto_now=True)

     class Meta:
          abstract = True


class ContactUs (BaseModel):
     name         = models.CharField(max_length=100)
     email        = models.CharField(max_length=100)
     phone        = models.CharField(max_length=100)
     message      = models.TextField()

     class Meta:
          verbose_name = 'Contact'
          verbose_name_plural = 'Contacts'

     def __str__(self):
        return self.name

class Socials (BaseModel):
     name       = models.CharField(max_length=200)
     url        = models.CharField(max_length=200, blank=True)

     class Meta:
          verbose_name = 'Social Media'
          verbose_name_plural = 'Social Media'