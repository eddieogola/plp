# Generated by Django 4.1.1 on 2022-10-01 15:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sellers_api', '0014_alter_address_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='address',
            name='name',
            field=models.CharField(max_length=100),
        ),
    ]
