# Generated by Django 3.2.15 on 2022-12-31 10:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('subcategory', '0005_auto_20221026_1003'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sub_category',
            name='id',
            field=models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]
