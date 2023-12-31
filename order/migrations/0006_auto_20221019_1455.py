# Generated by Django 3.2.15 on 2022-10-19 11:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0012_alter_product_discount_price'),
        ('order', '0005_rename_productvariations_wishlist_product'),
    ]

    operations = [
        migrations.AddField(
            model_name='wishlist',
            name='variations',
            field=models.ManyToManyField(blank=True, to='store.Variation'),
        ),
        migrations.AlterField(
            model_name='wishlist',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='store.product'),
        ),
    ]
