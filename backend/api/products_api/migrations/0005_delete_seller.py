# Generated by Django 4.1.1 on 2022-09-26 19:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('products_api', '0004_product_date_posted'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Seller',
        ),
    ]