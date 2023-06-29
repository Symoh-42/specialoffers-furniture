# Generated by Django 3.2.15 on 2022-09-12 21:45

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_name', models.CharField(max_length=50)),
                ('slug', models.SlugField(max_length=100, unique=True)),
                ('cat_image', models.ImageField(blank=True, upload_to='photos/categories')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name_plural': 'categories',
            },
        ),
    ]