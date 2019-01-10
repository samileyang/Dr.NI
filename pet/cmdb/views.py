from django.shortcuts import render
from cmdb import models
import random
import time
import datetime
from django.contrib import messages
import json
from django.http.response import HttpResponse
from django.db.models import Sum

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
    return render(request, 'index.html')

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
        user=models.Member(username=request.POST['username'],password=request.POST['password'])
        request.session['user_name'] = user.username
        return render(request, 'user/user_shop.html')
    else:
        print('user is invalid')
        return render(request, 'user/user_login.html')

def emp_login(request):
    if request.method == 'GET':
        return render(request, 'emp/emp_login.html')
    if request.POST:
        emp=models.EmpInfo.objects.get(name=request.POST['name'],password=request.POST['password'])
        request.session['emp_num'] = emp.emp_num
        return render(request, 'emp/emp_main.html')
    else:
        print('user is invalid')
        return render(request, 'emp/emp_login.html')

def add_pet(request):
    pet_type = request.POST.get('pet_type')
    sex = request.POST.get('sex')
    status = request.POST.get('status')
    size = request.POST.get('size')
    type ='type'
    username = request.session.get('user_name',None)
    usernum = models.Member.objects.get(username = username)
    try:
        pet = models.Member_Pet(mem_num=usernum,pet_type=pet_type,sex=sex,type=type, size=  size,pet_num=point)
        pet.save()
    except:
        pass
    return render (request,'user/add_pet.html')

def user_mypet(request):
    username = request.session.get('user_name',None)
    user = models.Member.objects.get(username = username)
    pets = models.MemberPet.objects.filter(mem_num = user.mem_num)
    return render(request,'user/user_mypet.html',{'pets':pets})

def user_product(request):
    products = models.Inventory.objects.all()
    return render(request, 'user/user_products.html', {'products': products})


def emp_list(request):
    emps = models.EmpInfo.objects.all()
    return render(request, 'manager/empList.html', {'emps': emps})


def salary_list(request):
    emps = models.Emp_Performance.objects.all()
    return render(request, 'manager/salaryList.html', {'emps': emps})


def pay_salary(request):
    emp_name = request.POST.get("emp_name", None)
    emp = models.EmpInfo.objects.get(name=emp_name)
    salary_history = models.Salary_Histroy()
    salary_history.salary = request.POST.get("salary", None)
    salary_history.basic_salary = emp.salary_basic
    salary_history.performance_salary = int(request.POST.get("salary", None)) - int(emp.salary_basic)
    salary_history.last_paid_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    salary_history.emp_id = emp.emp_num
    salary_history.save()

    emp_performance = models.Emp_Performance.objects.get(emp_id=emp.emp_num)
    emp_performance.performance_salary = 0
    emp_performance.last_paid_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    emp_performance.save()
    return HttpResponse(json.dumps("发放工资成功"))

def add_salary(request):
    emps = models.EmpInfo.objects.all()
    return render(request, 'manager/addSalaryForm.html', {'emps': emps})

def add_emp_performance(request):
    performance = models.Emp_Performance()
    emp_name = request.POST.get("emp_name", None)
    performance.emp = models.EmpInfo.objects.get(name=emp_name)
    performance.salary = request.POST.get("salary", None)
    performance.salary_time = request.POST.get("salary_time", None)
    performance.save()
    emps = models.Emp_Performance.objects.all()
    return render(request, 'manager/salaryList.html', {'emps': emps})


def add_emp(request):
    emp = models.EmpInfo()
    dict_to_bean(request.POST, emp)
    emps = models.EmpInfo.objects.all()
    emp.save()
    return render(request, 'manager/empList.html', {'emps': emps})


def update_emp(request):
    print (emp_num=request.GET.get("emp_num"))
    emp = models.EmpInfo.objects.get(emp_num=request.GET.get("emp_num"))
    dict_to_bean(request.POST, emp)
    emp.save()
    emps = models.EmpInfo.objects.all()
    return render(request, 'manager/empList.html', {'emps': emps})


def delete_emp(request):
    try:
        emp = models.EmpInfo.objects.get(emp_num=request.GET.get("emp_num"))
        emp.delete()
    except:
        pass
    
    emps = models.EmpInfo.objects.all()
    return render(request, 'manager/empList.html', {'emps': emps})


def load_emp_update_form(request):
    emp = models.EmpInfo.objects.get(emp_num=request.GET.get("emp_num"))
    return render(request, 'manager/updateEmpForm.html', {'emp': emp})


def load_emp_form(request):
    return render(request, 'manager/addEmpForm.html')

def my_salary(request):

    emp = models.EmpInfo.objects.get(emp_num=request.session['emp_num'])
    emp_name = emp.name
    salarys = models.Salary_Histroy.objects.filter(emp_id=emp.emp_num)
    basic_salary = emp.salary_basic
    return render(request, 'emp/my_salary.html', {'salarys': salarys, 'emp_name': emp_name,'basic_salary':basic_salary})

def check_cage(request):
    cage = models.Cage.objects.all()
    return render(request, 'manager/check_cage.html', {'cage': cage})

def add_foster(request):
    try:
        pet_num = request.GET.get("pet_num")
        pet = models.MemberPet.objects.get(pet_num=pet_num)
        products = models.Inventory.objects.all()
        cage = models.Cage.objects.all()
        return render(request, 'user/foster.html', {'pet': pet, 'products': products, 'cage': cage})
    except:
        return render(request, 'user/foster.html')

def save_foster(request):
    username = request.session.get('user_name',None)
    user = models.Member.objects.get(username = username)
    fosters = models.FosterOrder()
    date1 = datetime.date.today()
    name=request.POST.get("name")
    product = models.Inventory.objects.get(name = name)
    cage_num = request.POST.get("cage_num")
    cage = models.Cage.objects.get(cage_num = cage_num)
    pet_num = request.GET.get("pet_num")
    pet = models.MemberPet.objects.get(pet_num = pet_num)
    mem = models.Member.objects.get(mem_num = user.mem_num)
    foster = models.FosterOrder(starttime=date1,price=0,cage_num=cage,pet_num=pet,product_num=product,mem_num = mem)
    cage.status = 0
    pet.status = 0
    foster.save()
    cage.save()
    pet.save()
    pets = models.MemberPet.objects.filter(mem_num=1)
    return render(request, 'user/user_mypet.html', {'pets': pets})

def end_foster(request):
    pet_num = request.GET.get("pet_num")
    fosters = models.FosterOrder.objects.filter(pet_num=pet_num).last()
    print(fosters.cage_num)
    endtime = datetime.date.today()
    price = int((endtime-fosters.starttime).days)*20+100
    models.FosterOrder.objects.filter(pet_num=pet_num).update(endtime=endtime,price=price)
    fosters.cage_num.status = 1
    fosters.pet_num.status = 1
    fosters.cage_num.save()
    fosters.pet_num.save()
    pets = models.MemberPet.objects.filter(mem_num=1)
    return render(request, 'user/user_mypet.html', {'pets': pets})
        
# def pet_detail(request):
#     pets = models.MemberPet.objects.get(mem_bum=request.GET.get("mem_num"))
#     return render(request, 'user/mypet.html', {'pets': pets})        

def shop(request):
    return render(request,'user/user_shop.html')

def service_reservation(request):
    emps = models.EmpInfo.objects.all()
    types = models.ServiceType.objects.all()
    username = request.session.get('user_name',None)
    user = models.Member.objects.get(username = username)
    pets = models.MemberPet.objects.filter(mem_num = user.mem_num)
    return render(request, 'user/service_reservation.html', {'emps': emps, 'types': types, 'pets':pets})

def add_service_reservation(request):
    service_reservation = models.ServiceReservation()
    service_reservation.datetime = request.POST.get("datetime")
    #service_reservation.mem = models.Member.objects.get(mem_num=request.POST.get("mem_num"))
    
    username = request.session.get('user_name',None)
    user = models.Member.objects.get(username = username)
    mem = models.Member.objects.get(mem_num = user.mem_num)
    # pets = models.MemberPet.objects.filter(mem_num = user.mem_num)
    emp = models.EmpInfo.objects.get(name=request.POST.get("emp_name"))
    service_reservation.res_num = 'YY' + str(datetime.date.today()).replace('-', '')+ str(random.randint(1000, 9999))
    service_reservation.status = 0
    type1 = models.ServiceType.objects.get(name=request.POST.get("type"))
    price = type1.price
    pet = models.MemberPet.objects.filter(mem_num = user.mem_num).first()
    check = str(service_reservation.datetime)+str(emp)
    service=models.ServiceReservation(res_num=service_reservation.res_num,datetime=service_reservation.datetime,
        status=False,final_price=price,emp_num=emp,mem_num=mem,pet_num=pet,service_num=type1,
        check = check)
    pets = models.MemberPet.objects.all()
    emps = models.EmpInfo.objects.all()
    types = models.ServiceType.objects.all()

    service_reservation.save()
    service.save()
    return render(request, 'user/service_reservation.html', {'show_alert': 'true','emps': emps, 'types':types, 'pets':pets})

def check(request):
    check1 = models.ServiceReservation.objects.get(check = check)
    return render(request, 'user/service_reservation.html', {'emps': emps, 'types':types})

def history(request):
    username = request.session.get('user_name',None)
    user = models.Member.objects.get(username = username)
    orders = models.ServiceReservation.objects.filter(mem_num = user.mem_num)
    fosters = models.FosterOrder.objects.filter(mem_num = user.mem_num)
    credits = models.CreditOrder.objects.filter(mem_num = user.mem_num)
    return render(request, 'user/history.html', {'orders':orders, 'fosters':fosters,'credits':credits})

def delete_service_reservation(request):
    orders = models.Service_Reservation.objects.all();
    orders = models.ServiceReservation.status.filter(status='false')
    orders.delete() 
    return render(request, 'user/history.html', {'orders': orders})

def comment(request):
    res_num = request.POST.get('res_num')
    comment = request.GET.get("comments")
    models.ServiceReservation.objects.filter(res_num=res_num).update(comment = comment)
    return render(request, 'user/comment.html',{'show_alert':'true'})

def available_order(request):
    emp = models.EmpInfo.objects.get(emp_num=request.session['emp_num'])
    emp_name = emp.name
    orders = models.ServiceReservation.objects.filter(emp_num=emp.emp_num, status=0)
    return render(request, 'emp/available_order.html', {'orders': orders, 'emp_name': emp_name})


def finished_order(request):
    emp = models.EmpInfo.objects.get(emp_num=request.session['emp_num'])
    emp_name = emp.name
    orders = models.ServiceReservation.objects.filter(emp_num=emp.emp_num, status=1)
    return render(request, 'emp/finished_order.html', {'orders': orders, 'emp_name': emp_name})

def take_order(request):
    order = models.ServiceReservation.objects.get(res_num=request.GET.get("order_id"))
    order.status = 1
    order.save()
    emp = models.EmpInfo.objects.get(emp_num=request.session['emp_num'])
    emp_name = emp.name
    orders = models.ServiceReservation.objects.filter(emp_num=emp.emp_num, status=0)
    emp_performance = models.Emp_Performance.objects.get(emp_id=emp.emp_num)
    emp_performance.performance_salary += 0.1*order.final_price
    emp_performance.save()
    return render(request, 'emp/available_order.html', {'orders': orders, 'emp_name': emp_name})

def dict_to_bean(dict_obj, bean):
    for p in bean.__dict__.keys():
        if dict_obj.get(p) == None:
            continue
        setattr(bean, p, dict_obj.get(p))


def check_all(request):
    stocks = models.StockOrder.objects.all()
    services = models.ServiceReservation.objects.all()
    salarys = models.SalaryOrder.objects.all()
    fosters = models.FosterOrder.objects.all()
    sum_stock=models.StockOrder.objects.aggregate(Sum("final_price"))['final_price__sum']
    sum_service=models.ServiceReservation.objects.aggregate(Sum("final_price"))['final_price__sum']
    sum_salary=models.Salary_Histroy.objects.aggregate(Sum("salary"))['salary__sum']
    sum_foster=models.FosterOrder.objects.aggregate(Sum("price"))['price__sum']
    total = sum_foster+sum_service-sum_stock-sum_salary
    print(total)
    return render(request,'manager/check_all.html',{'stocks':stocks,'services':services,'salarys':salarys,'fosters':fosters,'total':total})
