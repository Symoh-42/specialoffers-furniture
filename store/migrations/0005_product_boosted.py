# Generated by Django 3.2.15 on 2022-10-01 09:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0004_reviewrating'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='boosted',
            field=models.BooleanField(default=False),
        ),
    ]