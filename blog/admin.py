from django.contrib import admin

from blog.models import HelpCenter, BlogPost, BlogAuthor, Newsletter, YoutubeVideo, Comments

# from .forms import HelpCenterAdminForm

# Register your models here.
class HelpCenterAdmin(admin.ModelAdmin):
     list_display = ('question',)
     # form = HelpCenterAdminForm

class BlogPostAdmin(admin.ModelAdmin):
     # list_display = ('title', '')
     prepopulated_fields  ={'slug': ('title',)}
     readonly_fields = ('cover_photo',)
     list_display = ('cover_photo','author', 'title', 'updated_at')

class BlogAuthorAdmin(admin.ModelAdmin):
     readonly_fields = ('admin_photo',)
     list_display = ('admin_photo','author_name', 'updated_at')

class NewsletterAdmin(admin.ModelAdmin):
     list_display = ('email','updated_at')

class YoutubeVideoAdmin(admin.ModelAdmin):
     list_display = ('youtube_url','updated_at')

class CommentsAdmin(admin.ModelAdmin):
     list_display = ('blog','name','content','updated_at')



admin.site.register(YoutubeVideo, YoutubeVideoAdmin)
admin.site.register(Comments, CommentsAdmin)
admin.site.register(BlogAuthor, BlogAuthorAdmin)
admin.site.register(BlogPost, BlogPostAdmin)
admin.site.register(HelpCenter, HelpCenterAdmin)
admin.site.register(Newsletter, NewsletterAdmin)