from django.contrib import admin
from .models import Category
from subcategory.models import Sub_Category
# Register your models here.

class CategoryAdmin(admin.ModelAdmin):

    # def render_change_form(self, request, context, *args, **kwargs):
    #      context['adminform'].form.fields['subcategory'].queryset = Sub_Category.objects.filter(category_name__iexact='category_name')
    #      return super(CategoryAdmin, self).render_change_form(request, context, *args, **kwargs)

    prepopulated_fields  ={'slug': ('category_name',)}
    list_display         =('category_name', 'slug', 'created_at')


admin.site.register(Category, CategoryAdmin)