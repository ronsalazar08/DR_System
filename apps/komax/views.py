import math
from django.contrib import messages
from django.core.paginator import Paginator
from django.shortcuts import render, redirect
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


class DrFormListView(ListView):
    model = dr_form
    template_name = 'komax/komax_home.html'  
    context_object_name = 'dr_forms' 
    paginate_by = 5

    def get_context_data(self, **kwargs):
        context = super(DrFormListView, self).get_context_data(**kwargs)

        context.update({
            'title' : 'KOMAX',
            'lista' : permitted_apps(self.request.user),
            'search' : self.request.GET.get('search'),
            'form'  : NewDrForm
        })
        return context
        
    def get_queryset(self, **kwargs):
        current_user = self.request.user
        search = self.request.GET.get('search')

        queryset = self.model.objects.all().exclude(status="CLOSED").order_by('control_no')
        if search:
            queryset = queryset.filter(control_no__contains=search)
            if len(queryset) == 0:
                queryset = self.model.objects.all()
                messages.success(self.request, f'Cannot find "{search}"')
            else:
                messages.success(self.request, f'Displaying "{search}"')

        return queryset

def new_or_rename_dr(request):
    if request.method == 'POST':
        if request.POST.get('form_ctrl') == "new_dr":
            form = NewDrForm(request.POST)
            if form.is_valid():
                olo = form.cleaned_data['control_no']
                form.save()
                messages.success(request, f' Success: DR <strong class=" font-weight-bold">{form.cleaned_data["control_no"]}</strong> successfully Created!')
                return redirect('komax_home') #change to edit dr +++++++++++++++++++++
            else:
                messages.error(request, f'Error: DR <strong class=" font-weight-bold">{request.POST.get("control_no")}</strong> already exist!')
        else:
            form = NewDrForm(request.POST)
            if form.is_valid():
                olo = form.cleaned_data['control_no']
                form.save()

                # deleting old control_no
                old_dr = request.POST.get('form_ctrl')
                new_dr = request.POST.get('control_no')
                n_dr = dr_form.objects.get(control_no=new_dr)
                o_dr_items = dr_item.objects.filter(control_noFK=old_dr)
                o_dr_items.update(control_noFK=n_dr)
                dr_form.objects.get(control_no=old_dr).delete()
                messages.success(request, f' Success: DR <strong class=" font-weight-bold">{old_dr}</strong> Renamed to <strong class=" font-weight-bold">{form.cleaned_data["control_no"]}</strong>!')

                return redirect('komax_home') #change to edit dr +++++++++++++++++++++
            else:
                messages.error(request, f'Error: DR <strong class=" font-weight-bold">{request.POST.get("control_no")}</strong> already exist!')

    return redirect('komax_home')


# class DrFormCreateView(SuccessMessageMixin, CreateView):
#     model = dr_form
#     template_name = 'dr_form/new_dr.html'
#     context_object_name = 'dr_forms'
#     success_message = 'DR <strong>%(control_no)s\'s</strong> Successfully Created!'
#     fields = ('date_created', 'control_no', 'customer', 'line')
 
#     def get_context_data(self, **kwargs):
#         context = super(DrFormCreateView, self).get_context_data(**kwargs)
#         context.update({
#             'title' : 'KOMAX',
#             'lista' : permitted_apps(self.request.user),
#         })
#         return context

#     def get_success_url(self):
#         return reverse_lazy('komax_home')


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
