# Generated by Django 3.0.8 on 2022-11-08 10:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0021_auto_20221108_1244'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comments',
            name='blog',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='comments', to='blog.BlogPost'),
        ),
    ]
