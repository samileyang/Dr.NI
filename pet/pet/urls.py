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
    url(r'^user_mypet*',views.user_mypet),
    url(r'^check_cage/', views.check_cage),
    url(r'^foster/', views.add_foster),
    url(r'^save_foster/', views.save_foster),
    url(r'^end_foster/', views.end_foster),
    url(r'^history/',views.history),
    url(r'^service_reservation/', views.service_reservation),
    url(r'^add_service_reservation/', views.add_service_reservation),
    url(r'^delete_service_reservation/', views.delete_service_reservation),
    url(r'^load_comment_update_form/', views.load_comment_update_form),
    url(r'^add_pet*',views.add_pet),
    url(r'^check_all*',views.check_all),
    url(r'^emp_list/', views.emp_list),
    url(r'^salary_list/', views.salary_list),
    url(r'^add_salary/', views.add_salary),
    url(r'^add_emp_performance/', views.add_emp_performance),
    url(r'^add_emp/', views.add_emp),
    url(r'^update_emp*', views.update_emp),
    url(r'^delete_emp/', views.delete_emp),
    url(r'^load_emp_form/', views.load_emp_form),
    url(r'^load_emp_update_form/', views.load_emp_update_form),
    url(r'^pay_salary', views.pay_salary),
    url(r'^my_salary/', views.my_salary),
    url(r'^update_comment/', views.update_comment),
    url(r'^emp_login/', views.emp_login),
    url(r'^finished_order/', views.finished_order),
    url(r'^available_order/', views.available_order),
    url(r'^take_order*', views.take_order),

]
