# Generated by Django 3.0.8 on 2022-11-11 09:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0008_auto_20221111_1226'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='socialmedia',
            options={'verbose_name': 'Social Media', 'verbose_name_plural': 'Social Media'},
        ),
        migrations.AlterField(
            model_name='socialmedia',
            name='url',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
