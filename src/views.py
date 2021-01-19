from django.shortcuts import render, redirect
from django.http import HttpResponse
import shutil
import os

def permitted_apps(usera):
    """
    Returning list of allowed apps for current user
    """
    lista = [i.upper() for i in usera.groups.values_list('name', flat=True)]
    return lista


def dashboard(request):
    
    total, used, free = shutil.disk_usage("/")
    temp = os.popen("vcgencmd measure_temp").readline().replace("temp=","")
    
    title='DASHBOARD'
    context = {
        'title' : title,
        'lista' : permitted_apps(request.user),
        'total_memory'  : (total // (2**30)),
        'used_memory'   : (used // (2**30)),
        'free_memory'   : (free // (2**30)),
        'temperature'   : temp,
    }
    return render(request, 'dashboard.html', context)