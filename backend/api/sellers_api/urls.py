from django.urls import path
from sellers_api.views import SellerList

urlpatterns = [
    path('', SellerList.as_view()),
]
