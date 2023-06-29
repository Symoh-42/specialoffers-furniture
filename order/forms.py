from dataclasses import fields
from pyexpat import model
from django import forms
from .models import Order


class OrderForm(forms.ModelForm):
    class Meta:
        model = Order
        fields =['first_name', 'last_name', 'phone', 'email', 'county', 'subcounty', 'order_note']
        