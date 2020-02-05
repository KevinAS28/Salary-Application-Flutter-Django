from django.shortcuts import render
import json
from .models import *
from django.http import HttpResponse
from django.http import JsonResponse
from django.http import HttpResponseNotAllowed, HttpResponseForbidden

def mergeDict(all_dict) -> dict:
    init_dict = all_dict[0]
    del all_dict[0]
    for i in range(len(all_dict)):
        init_dict.update(all_dict[i])
    return init_dict

def allDatasMethods(request):
    all_methods = [request.POST, request.GET]
    return mergeDict(all_methods)


def mysalary_auth(f):
    
    def wrapper(*args, **kw):
        request = args[0]
        datas = allDatasMethods(request)
        print(datas)
        print("AUTH: ", datas['username'], datas["password"])

        if ( ("username" in datas) and ("password" in datas)):
            user = list(TblKaryawan.objects.filter(username=datas["username"], password=datas["password"]))#list(User.objects.filter(username=datas["username"], password=datas["password"]))
            if (len(user)==0):
                print('Authentication Failed')
                return HttpResponseForbidden()    
            else:
                return f(*args, **kw)
        else:
            print('Invalid Request')
            return HttpResponseForbidden()
    return wrapper
