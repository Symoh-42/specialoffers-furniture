# Generated by Django 3.2.15 on 2022-10-17 09:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mpesa_api', '0006_mpesapaymentcallback'),
    ]

    operations = [
        migrations.DeleteModel(
            name='MpesaPaymentCallBack',
        ),
    ]