# Generated by Django 3.0.8 on 2022-10-26 07:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0002_rename_cat_image_category_category_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='id',
            field=models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]