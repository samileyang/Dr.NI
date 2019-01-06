from django.shortcuts import render
from cmdb import models
import random
import time
import datetime


def checkinventory(request):
    products = models.Inventory.objects.all()
    return render(request, 'manager/check_inventory.html', {'products': products})


def add_product(request):
    product_num = request.POST.get('product_num')
    amount = request.POST.get('amount') 
    products1 = models.Inventory.objects.all()
    print(product_num,amount)
    try:
        products = models.Inventory.objects.get(product_num=product_num)
        original_amount = products.amount
        products.amount = original_amount+int(amount)
        stock_price = products.stock_price
        final_price = int(amount)*stock_price
        time = str(datetime.date.today())
        stock = models.StockOrder(product_num = int(product_num), final_price =final_price,amount = amount,time=time)
        stock.save()
        products.save()
    except:
        pass
    return render(request,'manager/add_product.html',{'products1':products1})

def viewhistory(request):
    historys = models.StockOrder.objects.all()
    return render(request,'manager/input_history.html',{'historys' : historys})

def index(request):
    return render(request,'index.html')

def emp_main(request):
    return render(request,'emp/emp_main.html')

def manager_main(request):
    return render(request,'manager/manager_main.html')

def user_register(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    type ='type'
    point = 0
    try:
        member = models.Member(username=username,password=password,type=type,point=point)
        member.save()
    except:
        pass
    return render(request,'user/user_register.html')

def user_login(request):
    if request.method == 'GET':
        return render(request, 'user/user_login.html')

    if request.POST:
        print ("username:",request.POST['username'])
        print ("password:",request.POST['password'])
        user=models.Member(username=request.POST['username'],password=request.POST['password'])
        print ("user",user)
        request.session['user_name'] = user.username
        return render(request, 'user/user_products.html')
    else:
        print('user is invalid')
        return render(request, 'user/user_login.html')        


def user_mypet(request):
    username = request.session.get('user_name',None)
    print(username)
    usernum = models.Member.objects.get(username = username)
    print(usernum.mem_num)
    mypets = models.MemberPet.objects.filter(mem_num = usernum.mem_num)
    return render(request,'user/user_mypet.html',{'mypets':mypets})




def user_product(request):
    products = models.Inventory.objects.all()
    return render(request, 'user/user_products.html', {'products': products})

def shopping_car(request):
    products = models.Inventory.objects.all()
    for product in products:
        p = models.Inventory.objects.get(product_num=product.product_num)
        product.name = p.name
        product.min = p.min

    return render(request, 'user/shopping_car.html', {'products': products})

def add_product_to_car(request):
    product_order = models.Product_Order()
    dict_to_bean(request.GET, product_order)
    member = models.Member.objects.get(id=request.session['user_id'])
    product_order.mem_num = member.mem_num
    product_order.save()

    products = models.Inventory.objects.all()
    return render(request, 'suser/products.html', {'products': products})
