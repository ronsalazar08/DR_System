from django.shortcuts import render, redirect
from django.http import HttpResponse


def permitted_apps(usera):
    """
    Returning list of allowed apps for current user
    """
    lista = [i.upper() for i in usera.groups.values_list('name', flat=True)]
    return lista


def dashboard(request):
    """
    dashboard page
    """
    title='DASHBOARD'
    context = {
        'title' : title,
        'lista' : permitted_apps(request.user),
    }
    return render(request, 'dashboard.html', context)