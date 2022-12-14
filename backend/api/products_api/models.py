from django.db import models

class Product(models.Model):
    name = models.CharField(max_length=100, default = '')
    imageUrl = models.URLField(default='')
    summary = models.CharField(max_length=100, default = '')
    description = models.CharField(max_length=200, default='')
    quantity = models.CharField(max_length = 100)
    price = models.DecimalField(max_digits=10, decimal_places=2,default=0)
    rating = models.PositiveIntegerField(default=0, help_text="Rating for this product")
    date_posted = models.DateTimeField(auto_now_add=True, null=True, blank=True)

    def __str__(self):
        return self.name

    

