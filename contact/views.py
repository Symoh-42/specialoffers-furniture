from multiprocessing import context
from django.shortcuts import render
from django.contrib import messages, auth

from blog.models import HelpCenter


from .models import ContactUs
from .forms import ContactForm
# Create your views here.
def helpcenterPage(request):
     return render (request, 'contact/helpcenter.html')

def returnpolicyPage(request):
     return render (request, 'contact/returnpolicy.html')

def contactPage(request):
     if request.method =='POST':
          form = ContactForm(request.POST)
          if form.is_valid():
               data = ContactUs()

               # SAVING DATA IN DB
               data.name = form.cleaned_data['name']
               data.email = form.cleaned_data['email']
               data.phone = form.cleaned_data['phone']
               data.message = form.cleaned_data['message']
               data.save()

               messages.success(request, 'Thank you! Your Message have been received.')
               return render (request, 'contact/contactus.html')
          
          else:
               messages.success(request, 'Failed! Your message was not sent.')
               
     return render(request, 'contact/contactus.html')

def placeorderPage(request):
     return render (request, 'contact/placeorder.html')

def helpcenterPage(request):
     questions = HelpCenter.objects.all()

     context = {
          'questions':questions
     }
          
     return render (request, 'contact/helpcenter.html', context)