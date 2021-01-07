from django.shortcuts import render, redirect
from django.http import HttpResponse

# def check_group(request):
#     print(request.user.username)
#     if request.user.groups.filter(name='komax').exists():
#         return redirect('test')
#     else:
#         return redirect('/admin/')

def dashboard(request):
    """
    dashboard page
    """
    title='DASHBOARD'
    context = {
        'title' : title,
    }
    return render(request, 'dashboard.html', context)