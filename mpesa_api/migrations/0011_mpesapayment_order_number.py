# Generated by Django 3.0.8 on 2022-10-26 09:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mpesa_api', '0010_auto_20221026_1003'),
    ]

    operations = [
        migrations.AddField(
            model_name='mpesapayment',
            name='order_number',
            field=models.CharField(blank=True, max_length=20),
        ),
    ]