# Generated by Django 3.2.15 on 2022-10-21 13:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0005_alter_blogpost_blog_intro'),
    ]

    operations = [
        migrations.AddField(
            model_name='blogpost',
            name='latest',
            field=models.BooleanField(default=False),
        ),
    ]