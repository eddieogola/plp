from rest_framework import serializers
from products_api.models import Product

class ProductSerializer(serializers.ModelSerializer):   
    class Meta:
        model = Product
        fields = [
            'id', 
            'imageUrl',
            'name', 
            'summary',
            'description', 
            'price', 
            'rating'
            ]
            
