# Generated by Django 3.0.8 on 2022-11-07 08:48

import ckeditor.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0013_auto_20221107_1141'),
    ]

    operations = [
        migrations.CreateModel(
            name='BlogAuthor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('author_name', models.CharField(blank=True, max_length=200)),
                ('author_image', models.ImageField(blank=True, upload_to='author_image')),
                ('body', ckeditor.fields.RichTextField()),
            ],
            options={
                'verbose_name_plural': 'Blog Authors',
            },
        ),
    ]
