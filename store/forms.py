from django import forms
from .models import ReviewRating, Product

class ReviewForm(forms.ModelForm):
    class Meta:
        model = ReviewRating
        fields = ['subject', 'review', 'rating']


# class ProductAdminForm(forms.ModelForm):
#     description = forms.CharField(widget=forms.Textarea(attrs={'id': "richtext_field"}))
#     class Meta:
#         model = Product
#         fields = "__all__"