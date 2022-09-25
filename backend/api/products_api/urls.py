from django.urls import path
from products_api.views import ProductList

urlpatterns = [
    path('', ProductList.as_view()),
]
