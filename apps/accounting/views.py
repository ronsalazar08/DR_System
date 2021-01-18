from django.shortcuts import render, redirect
from django.views.generic import TemplateView

from .forms import SelectForm
from apps.komax.models import *


def permitted_apps(usera):
    """
    Returning list of allowed apps for current user
    """
    lista = [i.upper() for i in usera.groups.values_list('name', flat=True)]
    return lista


class HomeView(TemplateView):
    template_name = "accounting/accounting_home.html"

    def get_context_data(self, **kwargs):
        context = super(HomeView, self).get_context_data(**kwargs)
        context.update({
            'title' : 'ACCOUNTING',
            'lista' : permitted_apps(self.request.user),
        })
        return context


def SelectView(request, dept):

    if request.method == 'POST':
        form = SelectForm(request.POST)
        if form.is_valid():
            customerS = form.cleaned_data['customer']
            monS = form.cleaned_data['month']
            yearS = form.cleaned_data['year']
            return redirect(f'/accounting/summary/{dept}/{customerS}/{monS}/{yearS}')
    else:
        form = SelectForm()
    context = {
        'title' : 'ACCOUNTING',
        'dept': dept,
        'lista' : permitted_apps(request.user),
        'form'  : form
    }
    return render(request, 'accounting/select.html', context)

def SummaryView(request, dept, customer, month, year):
    customerS = customer
    monS = month
    yearS = year
    objs = dr_item.objects.raw(f"""
                                SELECT
                                    t.id,
                                    product_no,
                                    wos_no,
                                    quantity,
                                    cn,
                                    date_created,
                                    customer,
                                    status
                                FROM ( SELECT
                                        id,
                                        product_no,
                                        wos_no,
                                        (first_quantity + second_quantity + third_quantity + fourth_quantity + fifth_quantity) AS quantity,
                                        control_no AS cn,
                                        (select date_created from {dept.lower()}_dr_form where control_no = cn limit 1) AS date_created,
                                        (select customer from {dept.lower()}_dr_form where control_no = cn limit 1) AS customer,
                                        (select status from {dept.lower()}_dr_form where control_no = cn limit 1) AS status
                                    FROM {dept.lower()}_dr_item ) AS t
                                WHERE t.customer = '{customerS}' AND t.date_created LIKE '{yearS}-{monS}%%' ORDER BY cn, date_created;""")
    context = {
        'items': objs,
        'customerS' :   customerS,
        'monS'  :   monS,
        'yearS' :   yearS,
        'title' : 'ACCOUNTING',
        'dept': dept,
        'lista' : permitted_apps(request.user),
    }
    return render(request, 'accounting/summary.html', context)