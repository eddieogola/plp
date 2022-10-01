from rest_framework import serializers
from sellers_api.models import Seller, Address
from products_api.serializers import ProductSerializer


class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = Address
        fields = [
            'name',
            'city',
            'latitude',
            'longitude',
        ]

class SellerSerializer(serializers.ModelSerializer):   
    product = ProductSerializer( many=True)
    address = AddressSerializer( many=True)

    class Meta:
        model = Seller
        fields = [
            'id', 
            'name', 
            'address',
            'product',
            'join_date', 
            'rating',
            ]
            

            