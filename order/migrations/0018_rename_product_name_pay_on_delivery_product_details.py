# Generated by Django 3.2.15 on 2023-01-20 09:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0017_alter_pay_on_delivery_product_name'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pay_on_delivery',
            old_name='product_name',
            new_name='product_details',
        ),
    ]