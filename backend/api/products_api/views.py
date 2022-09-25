from rest_framework.views import APIView
from products_api.models import Product 
from products_api.serializers import ProductSerializer
from rest_framework.response import Response
from rest_framework import status, generics

class ProductList(APIView):

    def is_valid_request_param(self, request): 
        allowed_query_params = ['id']
        
        query_param = list(self.request.query_params.keys())
        
        # check if query param list is not empty and is valid
        if bool(query_param) and query_param[0] not in allowed_query_params:
            return False
        return True


    def get(self, request):
        if self.is_valid_request_param(request):

            #Filter params
            product_id = self.request.query_params.get('id', None)
            products = Product.objects.all()

            if product_id:
                try:
                    products = products.filter(id=product_id)

                    if products.count() == 0:
                        return Response({'error': 'No product found',}, status=status.HTTP_404_NOT_FOUND)
                        
                    serializer = ProductSerializer(products, many=True)
                    return Response(serializer.data, status=status.HTTP_200_OK)

                except:
                    return Response(status=status.HTTP_400_BAD_REQUEST)

            
            serializer = ProductSerializer(products, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(status=status.HTTP_400_BAD_REQUEST)

    def post(self, request):
        if self.is_valid_request_param(request):

            serializer = ProductSerializer(data=request.data)

            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        return Response( status=status.HTTP_400_BAD_REQUEST)


    def put(self, request):
        if self.is_valid_request_param(request):

            product_id = self.request.query_params.get('id', None)

            if product_id:
                product = Product.objects.filter(id=product_id).first()
                serializer = ProductSerializer(product, data=request.data)
                if serializer.is_valid():
                    serializer.save()
                    return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)
                else:
                    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        return Response( status=status.HTTP_400_BAD_REQUEST)


    def delete(self, request):  
        if self.is_valid_request_param(request):

            product_id = self.request.query_params.get('id', None)

            if product_id: 
                product = Product.objects.filter(id=product_id)
                product.delete()
                return Response(status=status.HTTP_204_NO_CONTENT)

        return Response(status=status.HTTP_400_BAD_REQUEST)



    
    

    