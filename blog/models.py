# from turtle import title
from django.db import models
from accounts.models import Account
from ckeditor.fields import RichTextField
from django.utils.safestring import mark_safe

# Create your models here.
class BaseModel(models.Model):
   created_at = models.DateTimeField(auto_now_add=True)
   updated_at = models.DateTimeField(auto_now=True)
   class Meta:
      abstract = True


class HelpCenter (BaseModel):
   user     = models.ForeignKey(Account, on_delete=models.CASCADE)
   question = models.CharField(max_length=100)
   description  = RichTextField()

   class Meta:
      verbose_name_plural = 'Help Center'

   def __str__(self):
      return self.question

class BlogAuthor (BaseModel):
   
   author_name      = models.CharField(max_length=200)
   author_image     = models.ImageField(upload_to='author_image')
   about_author     = RichTextField()

   def admin_photo(self):
      return mark_safe('<img src="{}" width="100" />'  .format(self.author_image.url))
   admin_photo.short_description = 'Image'
   admin_photo.allow_tags = True

   class Meta:
      verbose_name_plural = 'Blog Authors'

   def __str__(self):
      return self.author_name

class BlogPost (BaseModel):
   author      = models.ForeignKey(BlogAuthor, on_delete=models.CASCADE, default='10')
   # author_name      = models.CharField(max_length=200,  blank=True)
   # author_image     = models.ImageField(blank=True, upload_to='blogauthor')
   title            = models.CharField(max_length = 200, unique=True)
   slug             = models.SlugField(max_length=200,  blank=True)
   blog_intro       = models.TextField(help_text = "GIVE A SHORT DESCRIPTION ABOUT THE BLOG")
   blog_description = RichTextField()
   cover_image      = models.ImageField(blank=True, upload_to='blogcover')
   featured         = models.BooleanField(default=False)
   published        = models.BooleanField(default=False)


   class Meta:
      verbose_name_plural = 'Blog Posts'


   def cover_photo(self):
      return mark_safe('<img src="{}" width="100" />'  .format(self.cover_image.url))
   cover_photo.short_description = 'Image'
   cover_photo.allow_tags = True

   def __str__(self):
      return self.title

class Newsletter(BaseModel):
   email = models.EmailField(null=True)

   def __str__(self):
      return self.email

   class Meta:
      verbose_name_plural = 'Newsletters'

class YoutubeVideo(BaseModel):
   youtube_url      = models.CharField(max_length=400,  blank=True)


   class Meta:
      verbose_name_plural = 'Youtube Videos'


class Comments(BaseModel):
   blog = models.ForeignKey(BlogPost, on_delete=models.CASCADE, related_name= "comments")
   name = models.CharField(max_length=50)
   email = models.EmailField()
   content = models.TextField()
   status = models.BooleanField(default=True)
   

   class Meta:
      verbose_name_plural = 'Comments'

   def __str__(self):
      return f"Comment by {self.name}"