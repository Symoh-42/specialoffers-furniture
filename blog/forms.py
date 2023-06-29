from .models import HelpCenter, Newsletter, Comments
from django import forms

# class HelpCenterAdminForm(forms.ModelForm):
#     description = forms.CharField(widget=forms.Textarea(attrs={'id': "richtext_field"}))
#     class Meta:
#         model = HelpCenter
#         fields = "__all__"

class NewsletterForm(forms.ModelForm):
     class Meta:
          model = Newsletter
          fields = ['email', ]

     def __init__(self, *args, **kwargs):
        super(NewsletterForm, self).__init__(*args, **kwargs)
        self.fields['email'].widget.attrs['placeholder']         = 'Enter your email'
        self.fields['email'].widget.attrs['class']               = 'block p-3 pl-10 w-full text-sm text-gray-900 bg-white rounded-lg border border-gray-300 sm:rounded-none focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500'


class CommentForm(forms.ModelForm):
     class Meta:
          model = Comments
          fields = ['name', 'email', 'content']

     def __init__(self, *args, **kwargs):
        super(CommentForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs['class']         = 'block w-full px-4 py-2 text-gray-700 bg-white border rounded-md dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 focus:ring-blue-300 dark:focus:border-blue-300 focus:outline-none focus:ring focus:ring-opacity-40'
        self.fields['email'].widget.attrs['class']        = 'block w-full px-4 py-2 text-gray-700 bg-white border rounded-md dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 focus:ring-blue-300 dark:focus:border-blue-300 focus:outline-none focus:ring focus:ring-opacity-40'
        self.fields['content'].widget.attrs['class']      = 'block w-full h-40 px-4 py-2 text-gray-700 bg-white border rounded-md dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40'