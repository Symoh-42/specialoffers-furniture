# Generated by Django 3.0.8 on 2022-11-08 09:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0020_auto_20221108_1241'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='comments',
            options={'verbose_name_plural': 'Comments'},
        ),
    ]