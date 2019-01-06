"""pet URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url
from cmdb import views

urlpatterns = [
    url(r'^add_product/', views.add_product),
    url(r'^check_inventory/', views.checkinventory),
    url(r'^input_history/', views.viewhistory),
    url(r'^index/',views.index),
    url(r'^user_register/',views.user_register),
    url(r'^user_login/',views.user_login),
    url(r'^emp_main/',views.emp_main),
    url(r'^manager_main/',views.manager_main),
    url(r'^user_products/', views.user_product),
    url(r'^shopping_car/', views.shopping_car),
    url(r'^add_product_to_car*', views.add_product_to_car),
    url(r'^user_mypet*',views.user_mypet),
]
