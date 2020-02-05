
from django.urls import path, include
from . import views

app_name='api'

urlpatterns = [

    path('test/', views.test),
    path('get_data/', views.get_data)
]