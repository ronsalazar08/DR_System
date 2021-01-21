from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.utils import timezone
import shutil
import os

from apps.komax.models import dr_form as komax_dr_form
from apps.foiling.models import dr_form as foiling_dr_form

def permitted_apps(usera):
    """
    Returning list of allowed apps for current user
    """
    lista = [i.upper() for i in usera.groups.values_list('name', flat=True)]
    return lista


def dashboard(request):
    
    total, used, free = shutil.disk_usage("/")
    temp = os.popen("vcgencmd measure_temp").readline().replace("temp=","")
    
    komax_date_list = komax_dr_form.objects.values_list('date_created', flat=True).distinct().order_by('-date_created')[:7]
    komax_data = {}
    for i in komax_date_list[::-1]:
        dr = komax_dr_form.objects.filter(date_created=i)
        i = i.strftime('%b-%d')
        komax_data[i] = {}
        komax_data[i]["OPEN"] = dr.filter(status='OPEN').count() + dr.filter(status='WAITING').count()
        komax_data[i]["CLOSED"] = dr.filter(status='CLOSED').count()
    
    foiling_date_list = foiling_dr_form.objects.values_list('date_created', flat=True).distinct().order_by('-date_created')[:7]
    foiling_data = {}
    for i in foiling_date_list[::-1]:
        dr = foiling_dr_form.objects.filter(date_created=i)
        i = i.strftime('%b-%d')
        foiling_data[i] = {}
        foiling_data[i]["OPEN"] = dr.filter(status='OPEN').count() + dr.filter(status='WAITING').count()
        foiling_data[i]["CLOSED"] = dr.filter(status='CLOSED').count()


    context = {
        'title' : 'DASHBOARD',
        'lista' : permitted_apps(request.user),
        'total_memory'  : (total // (2**30)),
        'used_memory'   : (used // (2**30)),
        'free_memory'   : (free // (2**30)),
        'temperature'   : temp,
        'komax_data'    : komax_data,
        'foiling_data'    : foiling_data,
    }
    return render(request, 'dashboard.html', context)