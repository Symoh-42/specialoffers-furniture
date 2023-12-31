# Generated by Django 3.0.8 on 2022-11-11 09:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0007_auto_20221111_1144'),
    ]

    operations = [
        migrations.CreateModel(
            name='SocialMedia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=200)),
                ('url', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name': 'Social Url',
                'verbose_name_plural': 'Social Urls',
            },
        ),
        migrations.DeleteModel(
            name='SocialUrls',
        ),
    ]
