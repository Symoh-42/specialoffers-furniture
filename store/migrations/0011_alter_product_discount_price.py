# Generated by Django 3.2.15 on 2022-10-17 11:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0010_alter_product_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='discount_price',
            field=models.IntegerField(blank=True, help_text='Should be higher than the price'),
        ),
    ]
