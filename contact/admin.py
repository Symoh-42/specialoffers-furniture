from django.contrib import admin

from . models import ContactUs, Socials
# Register your models here.

class ContactUsAdmin(admin.ModelAdmin):
     list_display = ['name', 'email', 'phone', 'message', 'created_at']

class SocialsAdmin(admin.ModelAdmin):
     list_display = ['name', 'url', 'created_at']

admin.site.register(ContactUs, ContactUsAdmin)
admin.site.register(Socials, SocialsAdmin)