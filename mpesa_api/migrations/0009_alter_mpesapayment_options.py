# Generated by Django 3.2.15 on 2022-10-18 12:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mpesa_api', '0008_mpesapaymentcallback'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='mpesapayment',
            options={'verbose_name': 'Mpesa Payment', 'verbose_name_plural': 'Mpesa Payments'},
        ),
    ]
