# Generated by Django 3.0.8 on 2022-11-08 05:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0018_newsletter'),
    ]

    operations = [
        migrations.CreateModel(
            name='YoutubeVideo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('youtube_url', models.CharField(blank=True, max_length=400)),
            ],
            options={
                'verbose_name_plural': 'YoutubeVideos',
            },
        ),
        migrations.AlterModelOptions(
            name='newsletter',
            options={'verbose_name_plural': 'Newsletters'},
        ),
        migrations.RemoveField(
            model_name='blogpost',
            name='youtube_url',
        ),
    ]
