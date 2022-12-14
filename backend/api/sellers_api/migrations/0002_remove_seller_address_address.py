# Generated by Django 4.1.1 on 2022-09-26 19:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('sellers_api', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='seller',
            name='address',
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('town', models.CharField(max_length=100)),
                ('latitude', models.IntegerField()),
                ('longitude', models.IntegerField()),
                ('seller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='sellers_api.seller')),
            ],
        ),
    ]
