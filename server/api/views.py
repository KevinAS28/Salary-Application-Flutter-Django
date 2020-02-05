from django.shortcuts import render
import json
from .models import *
from django.http import HttpResponse
from django.http import JsonResponse
from django.http import HttpResponseNotAllowed, HttpResponseForbidden
from .library import *
from django.core import serializers
import base64
import Penggajian.settings as settings
import os

@mysalary_auth
def test(request):
    print("hitted: ", request.POST["username"])
    return JsonResponse({"success": "true"})
    
@mysalary_auth
def get_data(request):
    username = request.POST["username"]
    password = request.POST["password"]
    user = TblKaryawan.objects.get(username=username, password=password)
    gaji = list(TblGaji.objects.filter(id_karyawan=user.id_karyawan))
    gaji_data = []
    for i in gaji:
        gaji_data.append(i.get_gaji_data())
    user = user.get_employee_data() 
    with open(os.path.join(settings.BASE_DIR, "Penggajian", "image_profiles", username+".jpg"), "rb") as image:
        image = image.read()
        user["image"] = str(base64.b64encode(image), "utf-8")
    data = {'gaji': gaji_data, 'user':user}
    #print(data)
    return JsonResponse(data)
    
    

# def get_all(request):
    
#     TblKaryawan.objects.get(username=)
    
