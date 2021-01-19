import math
from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib.auth.models import Permission
from django.core.paginator import EmptyPage, Paginator
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import ListView
from django.views.generic.edit import FormView

from .models import *
from .forms import NewDrForm, NewDrItem

def permitted_apps(usera):
    """
    Returning list of allowed apps for current user
    """
    lista = [i.upper() for i in usera.groups.values_list('name', flat=True)]
    return lista


class SafePaginator(Paginator):
    def validate_number(self, number):
        try:
            return super(SafePaginator, self).validate_number(number)
        except EmptyPage:
            if number > 1:
                return self.num_pages
            else:
                raise


class DrFormListView(ListView):
    model = dr_form
    paginator_class = SafePaginator
    template_name = 'komax/dr_home.html'  
    context_object_name = 'dr_forms' 
    paginate_by = 7 #if changed change also in edit_dr math

    def get_context_data(self, **kwargs):
        context = super(DrFormListView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'KOMAX',
            'form'  : NewDrForm,
            'search' : self.request.GET.get('search'),
            'lista' : permitted_apps(self.request.user),
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
    try:
        if request.method == 'POST':
            old_dr_form = request.POST.get('form_ctrl')
            if old_dr_form == "new_dr":
                form = NewDrForm(request.POST)
                if form.is_valid():
                    olo = form.cleaned_data['control_no']
                    form.save()
                    messages.success(request, f'Success: DR <strong class=" font-weight-bold">{form.cleaned_data["control_no"]}</strong> successfully Created!')
                    # return redirect('komax_home') 
                    return redirect(f'/komax/edit_dr/{form.cleaned_data["control_no"]}')

                else:
                    messages.error(request, f'Error: DR <strong class=" font-weight-bold">{request.POST.get("control_no")}</strong> already exist!')

            elif old_dr_form != "new_dr" and dr_form.objects.get(control_no=old_dr_form).status == "OPEN":
                old = dr_form.objects.get(control_no=old_dr_form)
                form = NewDrForm(request.POST)
                if form.is_valid():
                    olo = form.cleaned_data['control_no']
                    form.save()

                    # deleting old control_no
                    old_dr = old_dr_form
                    new_dr = request.POST.get('control_no')
                    n_dr = dr_form.objects.get(control_no=new_dr)
                    o_dr_items = dr_item.objects.filter(control_noFK=old_dr)
                    o_dr_items.update(control_noFK=n_dr)
                    old.delete()
                    messages.success(request, f' Success: DR <strong class=" font-weight-bold">{old_dr}</strong> Renamed to <strong class=" font-weight-bold">{form.cleaned_data["control_no"]}</strong>!')

                    # return redirect('komax_home') 
                    return redirect(f'/komax/edit_dr/{form.cleaned_data["control_no"]}')

                else:
                    messages.error(request, f'Error: DR <strong class=" font-weight-bold">{request.POST.get("control_no")}</strong> already exist!')
            else:
                messages.error(request, f"Error: Please Try Again!")
    except:
        messages.error(request, f"Error: Please Try Again!")
    return redirect('komax_home')


def delete_dr(request, cnum):
    cno = str(cnum).split('_')
    try:
        dr_form.objects.get(control_no=cno[0]).delete()
        messages.success(request, f' Success: DR <strong class=" font-weight-bold">{cno[0]}</strong> successfully Deleted!')
    except:
        messages.error(request, f"Error: DR <strong class='font-weight-bold'>{cno[0]}</strong> Don't exist!")
    try:
        return redirect(f'http://{request.get_host()}/komax/?page={cno[1]}')
    except:
        return redirect(f'http://{request.get_host()}/komax/?page={cno[1] - 1 }')


def close_dr(request, cnum):
    cno = str(cnum).split('_')
    try:
        olo = dr_form.objects.get(control_no=cno[0])
        olo.status = "CLOSED"
        olo.save()
        messages.success(request, f' Success: DR <strong class=" font-weight-bold">{cno[0]}</strong> successfully Closed!')
    except:
        messages.error(request, f"Error: DR <strong class='font-weight-bold'>{cno[0]}</strong> don't Exist or already Closed!")
    try:
        return redirect(f'http://{request.get_host()}/komax/?page={cno[1]}')
    except:
        return redirect(f'http://{request.get_host()}/komax/?page={cno[1] - 1 }')


def edit_dr(request, cnum):
    try:
        if request.method == 'POST':
            form_ctrl = request.POST.get('form_ctrl')
            if form_ctrl == "dr_form":
                form = NewDrForm(request.POST, instance=dr_form.objects.get(control_no=cnum))
                item_form = NewDrItem()
                if form.is_valid():
                    form.save()

                    pk = dr_form.objects.get(control_no=cnum).pk
                    blist = dr_form.objects.all().values_list('pk', flat=True).order_by('control_no').exclude(status='CLOSED')
                    position = list(blist).index(pk)
                    if position == 0:
                        page = 1
                    else:
                        page = math.floor(position/7)+1
                    messages.success(request, f' Success: DR <strong class=" font-weight-bold">{cnum}</strong> Saved!')
                    return redirect(f'http://{request.get_host()}/komax/?page={page}')

            elif form_ctrl == "new_item":
                form = NewDrForm(instance=dr_form.objects.get(control_no=cnum))
                item_form = NewDrItem(request.POST)
                new_form1 = item_form.save(commit=False)
                new_form1.control_noFK = dr_form.objects.get(control_no=cnum)
                if item_form.is_valid():
                    # cnum=form1.cleaned_data['control_noFK']
                    item_form.save()
                    messages.success(request, f' Item <strong class=" font-weight-bold">{item_form.cleaned_data["product_no"]} {item_form.cleaned_data["wos_no"]}</strong> Added!')
                    return redirect(f'/komax/edit_dr/{cnum}')

            elif form_ctrl:
                pk = form_ctrl
                form = NewDrForm(instance=dr_form.objects.get(control_no=cnum))
                item_form = NewDrItem(request.POST, instance=dr_item.objects.get(pk=pk))
                new_form1 = item_form.save(commit=False)
                new_form1.control_noFK = dr_form.objects.get(control_no=cnum)
                if item_form.is_valid():
                    # cnum=form1.cleaned_data['control_noFK']
                    item_form.save()
                    messages.info(request, f' Item <strong class=" font-weight-bold">{item_form.cleaned_data["product_no"]} {item_form.cleaned_data["wos_no"]}</strong> Changed!')
                    return redirect(f'/komax/edit_dr/{cnum}')
            else:
                form = NewDrForm(instance=dr_form.objects.get(control_no=cnum))
                item_form = NewDrItem()
        else:
            form = NewDrForm(instance=dr_form.objects.get(control_no=cnum))
            item_form = NewDrItem()
    except:
        messages.error(request, f"Error: Please Try Again!")
        return redirect('komax_home')

    signed_by = ""
    if request.user.username == 'komaxa':
        signed_by = "JOSIE AUTOS"
    elif request.user.username == 'komaxb':
        signed_by = "GLORIA PASTOR"
    context = {
        'title' : 'KOMAX',
        'cnum'  : cnum,
        'dr_form'  :   form,
        'item_form' :   item_form,
        'dr_items' :   dr_item.objects.filter(control_noFK=cnum).order_by('id'),
        'lista' : permitted_apps(request.user),
        'signed_by' : signed_by
    }
    return render(request, 'komax/dr_detail.html', context)


def delete_item(request, pk):
    cnum = dr_item.objects.get(pk=pk)
    dr_item.objects.get(pk=pk).delete()
    messages.warning(request, f' Item <strong class=" font-weight-bold">{cnum.product_no} {cnum.wos_no}</strong> Deleted!')
    return redirect(f'/komax/edit_dr/{cnum.control_noFK}')

