from django.http import JsonResponse
from rest_framework.views import APIView
from sellers_api.models import Seller , Address
from sellers_api.serializers import AddressSerializer, SellerSerializer
from rest_framework.response import Response
from rest_framework import status

class SellerList(APIView):

    def is_valid_request_param(self, request): 
        allowed_query_params = ['id','format', 'city', 'address']
        
        query_param = list(self.request.query_params.keys())
        
        # check if query param list is not empty and is valid
        if bool(query_param) and query_param[0] not in allowed_query_params:
            return False
        return True


    def get(self, request):
        if self.is_valid_request_param(request):

            #Filter params
            seller_id = self.request.query_params.get('id', None)
            all_cities = self.request.query_params.get('city','')
            city_name = self.request.query_params.get('address',None)

            sellers = Seller.objects.all()
            addresses = Address.objects.all()

            if seller_id:
                try:
                    sellers = sellers.filter(id=seller_id)

                    if sellers.count() == 0:
                        return Response({'error': 'No Seller found',}, status=status.HTTP_404_NOT_FOUND)

                except:
                    return Response(status=status.HTTP_400_BAD_REQUEST)

            if city_name:
                try:
                    query_set = addresses.filter(city=city_name)

                    serializer = AddressSerializer(query_set, many=True)
                    if len(query_set) == 0:
                        return Response({'error': 'No Address found',}, status=status.HTTP_404_NOT_FOUND)

                    return Response(serializer.data, status=status.HTTP_200_OK)
                except:
                    return Response(status=status.HTTP_400_BAD_REQUEST)

            
            if all_cities:
                try:
                    cities = set()
                    
                    for address in addresses:
                        cities.add(address.city)
                    
                    if len(cities) == 0:
                        return Response({'error': 'No City found',}, status=status.HTTP_404_NOT_FOUND)

                    return Response({frozenset(cities)},status=status.HTTP_200_OK)

                except:
                    return Response(status=status.HTTP_400_BAD_REQUEST)

            
            serializer = SellerSerializer(sellers, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response( status=status.HTTP_400_BAD_REQUEST)

    def post(self, request):
        if self.is_valid_request_param(request):

            serializer = SellerSerializer(data=request.data)

            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        return Response( status=status.HTTP_400_BAD_REQUEST)


    def put(self, request):
        if self.is_valid_request_param(request):

            seller_id = self.request.query_params.get('id', None)

            if seller_id:
                seller_id = Seller.objects.filter(id=seller_id).first()
                serializer = SellerSerializer(seller_id, data=request.data)
                if serializer.is_valid():
                    serializer.save()
                    return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)
                else:
                    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        return Response( status=status.HTTP_400_BAD_REQUEST)


    def delete(self, request):  
        if self.is_valid_request_param(request):

            seller_id = self.request.query_params.get('id', None)

            if seller_id: 
                seller_id = Seller.objects.filter(id=seller_id)
                seller_id.delete()
                return Response(status=status.HTTP_204_NO_CONTENT)

        return Response(status=status.HTTP_400_BAD_REQUEST)





    
    

    