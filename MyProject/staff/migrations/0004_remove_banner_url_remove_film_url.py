# Generated by Django 4.2.13 on 2024-05-19 08:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('staff', '0003_banner_photo_film_photo'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='banner',
            name='url',
        ),
        migrations.RemoveField(
            model_name='film',
            name='url',
        ),
    ]
