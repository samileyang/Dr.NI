# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models



class Cage(models.Model):
    cage_num = models.IntegerField(primary_key=True)
    status = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        
        db_table = 'cage'


class CreditOrder(models.Model):
    order_num = models.IntegerField(primary_key=True)
    date = models.DateTimeField(blank=True, null=True)
    point = models.IntegerField(blank=True, null=True)
    amount = models.IntegerField(blank=True, null=True)
    mem_num = models.ForeignKey('Member', models.CASCADE, db_column='mem_num', blank=True, null=True)
    product_num = models.ForeignKey('Inventory', models.CASCADE, db_column='product_num', blank=True, null=True)

    class Meta:
        
        db_table = 'credit_order'




class EmpInfo(models.Model):
    emp_num = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    salary_time = models.IntegerField(blank=True, null=True)
    salary_basic = models.IntegerField(blank=True, null=True)
    last_paid_time = models.DateField(blank=True, null=True)
    service_num = models.ForeignKey('ServiceType', models.CASCADE, db_column='service_num', blank=True, null=True)

    class Meta:
        
        db_table = 'emp_info'


class FosterOrder(models.Model):
    foster_num = models.IntegerField(primary_key=True)
    starttime = models.DateTimeField(blank=True, null=True)
    endtime = models.DateTimeField(blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    cage_num = models.ForeignKey(Cage, models.CASCADE, db_column='cage_num', blank=True, null=True)
    pet_num = models.IntegerField(blank=True, null=True)
    product_num = models.ForeignKey('Inventory', models.CASCADE, db_column='product_num', blank=True, null=True)

    class Meta:
        
        db_table = 'foster_order'


class Inventory(models.Model):
    product_num = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    min = models.IntegerField(blank=True, null=True)
    max = models.IntegerField(blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    stock_price = models.IntegerField(blank=True, null=True)
    amount = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'inventory'


class Member(models.Model):
    mem_num = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=255, blank=True, null=True)
    point = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'member'


class MemberPet(models.Model):
    pet_num = models.IntegerField(primary_key=True)
    pet_type = models.CharField(max_length=255, blank=True, null=True)
    sex = models.CharField(max_length=255, blank=True, null=True)
    status = models.CharField(max_length=255, blank=True, null=True)
    size = models.CharField(max_length=225, blank=True, null=True)
    mem_num = models.ForeignKey(Member, models.CASCADE, db_column='mem_num', blank=True, null=True)

    class Meta:
        
        db_table = 'member_pet'


class SalaryOrder(models.Model):
    salary_order_num = models.IntegerField(primary_key=True)
    last_paid_time = models.DateTimeField(blank=True, null=True)
    datetime = models.DateTimeField(blank=True, null=True)
    emp_num = models.ForeignKey(EmpInfo, models.CASCADE, db_column='emp_num', blank=True, null=True)

    class Meta:
        
        db_table = 'salary_order'


class ServiceReservation(models.Model):
    res_num = models.IntegerField(primary_key=True)
    datetime = models.DateTimeField(blank=True, null=True)
    status = models.CharField(max_length=255, blank=True, null=True)
    final_price = models.IntegerField(blank=True, null=True)
    emp_num = models.ForeignKey(EmpInfo, models.CASCADE, db_column='emp_num', blank=True, null=True)
    mem_num = models.ForeignKey(Member, models.CASCADE, db_column='mem_num', blank=True, null=True)
    pet_num = models.ForeignKey(MemberPet, models.CASCADE, db_column='pet_num', blank=True, null=True)
    service_num = models.ForeignKey('ServiceType', models.CASCADE, db_column='service_num', blank=True, null=True)

    class Meta:
        
        db_table = 'service_reservation'


class ServiceType(models.Model):
    service_num = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'service_type'


class StockOrder(models.Model):
    stock_num = models.AutoField(primary_key=True)
    amount = models.IntegerField(blank=True, null=True)
    final_price = models.IntegerField(blank=True, null=True)
    product_num = models.ForeignKey(Inventory, models.CASCADE, db_column='product_num', blank=True, null=True)
    time = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        
        db_table = 'stock_order'
