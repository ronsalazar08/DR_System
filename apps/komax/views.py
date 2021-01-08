import math
from django.shortcuts import render, redirect
from django.contrib import messages
from django.urls import reverse_lazy, reverse
from django.contrib.auth.models import Permission
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import TemplateView, ListView, UpdateView, CreateView, DeleteView
from django.views.generic.edit import FormView

from .models import *
from .forms import NewDrForm

def permitted_apps(usera):
    """
    Returning list of allowed apps for current user
    """
    if str(usera) == 'admin':
        permissions = Permission.objects.all()
    else:
        permissions = Permission.objects.filter(user=usera)
    lista = list(set([((str(p).split())[0]).upper() for p in permissions]))
    lista.sort()
    return lista


# class DrFormListView(ListView):
#     model = dr_form
#     template_name = 'komax/komax_home.html'  
#     context_object_name = 'dr_forms' 
#     paginate_by = 5

#     def get_context_data(self, **kwargs):
#         context = super(DrFormListView, self).get_context_data(**kwargs)

#         context.update({
#             'title' : 'KOMAX',
#             'lista' : permitted_apps(self.request.user),
#             'search' : self.request.GET.get('search'),
#             'form'  : NewDrForm
#         })
#         return context
        
#     def get_queryset(self, **kwargs):
#         current_user = self.request.user
#         search = self.request.GET.get('search')

#         queryset = self.model.objects.all().exclude(status="CLOSED").order_by('control_no')
#         if search:
#             queryset = queryset.filter(control_no__contains=search)
#             if len(queryset) == 0:
#                 queryset = self.model.objects.all()
#                 messages.success(self.request, f'Cannot find "{search}"')
#             else:
#                 messages.success(self.request, f'Displaying "{search}"')

#         return queryset


class DrFormListView(SuccessMessageMixin, CreateView):
    model = dr_form
    template_name = 'komax/komax_home.html'  
    context_object_name = 'dr_forms' 
    success_message = 'DR <strong class="text-warning font-weight-bold">%(control_no)s</strong> Successfully Created!'
    fields = ('date_created', 'control_no', 'customer', 'line')
    error_message = 'Error: DR Already exist!'

    def get_context_data(self, **kwargs):
        context = super(DrFormListView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'KOMAX',
            'lista' : permitted_apps(self.request.user),
            'search' : self.request.GET.get('search'),
            'dr_forms'  : self.model.objects.all().exclude(status="CLOSED").order_by('control_no')
        })
        return context

    def form_invalid(self, form):
        messages.success(self.request, self.error_message)
        return super().form_invalid(form)

    def get_success_url(self):
        return reverse_lazy('komax_home')

class DrFormCreateView(SuccessMessageMixin, CreateView):
    model = dr_form
    template_name = 'dr_form/new_dr.html'
    context_object_name = 'dr_forms'
    success_message = 'DR <strong>%(control_no)s\'s</strong> Successfully Created!'
    fields = ('date_created', 'control_no', 'customer', 'line')
 
    def get_context_data(self, **kwargs):
        context = super(DrFormCreateView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'KOMAX',
            'lista' : permitted_apps(self.request.user),
        })
        return context

    def get_success_url(self):
        return reverse_lazy('komax_home')


class DrFormDeleteView(DeleteView):
    model = dr_form
    template_name = 'dr_form/delete_dr.html'
    context_object_name = 'dr_form'
    success_message = '<strong>DR</strong> is now Deleted!'

    def get_context_data(self, **kwargs):
        context = super(DrFormDeleteView, self).get_context_data(**kwargs)

        pk = self.kwargs['pk']
        blist = dr_form.objects.all().values_list('pk', flat=True).order_by('control_no')
        position = list(blist).index(pk)
        if position == 0:
            page = 1
        else:
            page = math.floor(position/5)+1

        context.update({
            'title' : 'KOMAX',
            'lista' : permitted_apps(self.request.user),
            'page'  : page,
        })
        return context
    def get_success_url(self, **kwargs):
        pk = self.kwargs['pk']
        blist = dr_form.objects.all().values_list('pk', flat=True).order_by('control_no')
        position = list(blist).index(pk)
        if position == 0:
            page = 1
        else:
            page = math.floor(position/5)+1
        return reverse_lazy('komax_home') + "?page=" + str(page)

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, self.success_message)
        return super(DrFormDeleteView, self).delete(request, *args, **kwargs)
