# Generated by Django 3.0.8 on 2022-11-07 09:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0014_blogauthor'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blogauthor',
            name='author_name',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.BlogPost'),
        ),
    ]