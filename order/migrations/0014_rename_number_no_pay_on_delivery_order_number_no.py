# Generated by Django 3.2.15 on 2023-01-18 16:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0013_pay_on_delivery_number_no'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pay_on_delivery',
            old_name='number_no',
            new_name='order_number_no',
        ),
    ]
