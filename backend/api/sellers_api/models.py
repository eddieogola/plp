from django.db import models
from products_api.models import Product

class Address(models.Model):
    city = models.CharField(max_length=100)
    latitude = models.IntegerField()
    longitude = models.IntegerField()

    def __str__(self):
        return self.city

class Seller(models.Model):
    name = models.CharField(max_length=100, default = '')
    product = models.ManyToManyField(Product)
    address = models.ManyToManyField(Address)
    join_date = models.DateField()
    rating = models.PositiveIntegerField(default=0, help_text="Rating for seller")

    def __str__(self):
        return self.name


