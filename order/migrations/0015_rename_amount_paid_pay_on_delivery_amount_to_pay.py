# Generated by Django 3.2.15 on 2023-01-19 07:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0014_rename_number_no_pay_on_delivery_order_number_no'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pay_on_delivery',
            old_name='amount_paid',
            new_name='amount_to_pay',
        ),
    ]