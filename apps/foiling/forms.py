from django import forms
from .models import *


class NewDrForm(forms.ModelForm):
    customerCHOICES=[('CHRYSLER','CHRYSLER'),
                     ('GM','GM'),
                     ('HONDA','HONDA'),
                     ('IMV','IMV'),
                     ('OUTLANDER','OUTLANDER')]

    statusCHOICES=[('OPEN','OPEN'),
                   ('WAITING','WAITING'),
                   ('CLOSED','CLOSED')
                   ]
    

    customer = forms.ChoiceField(choices=customerCHOICES, required=True)
    status = forms.ChoiceField(choices=statusCHOICES, required=False)
    class Meta:
        model=dr_form
        fields = ['date_created', 'control_no', 'customer', 'line', 'status']

class NewDrItem(forms.ModelForm):
    control_noFK= forms.CharField(widget = forms.HiddenInput(), required=False)
    first_quantity = forms.IntegerField(label="1ST")
    second_quantity = forms.IntegerField(widget = forms.HiddenInput(), initial=0, label="2ND")
    third_quantity = forms.IntegerField(widget = forms.HiddenInput(), initial=0, label="3RD")
    fourth_quantity = forms.IntegerField(widget = forms.HiddenInput(), initial=0, label="4TH")
    fifth_quantity = forms.IntegerField(widget = forms.HiddenInput(), initial=0, label="5TH")
    class Meta:
        model=dr_item
        fields = ['product_no', 'wos_no', 'first_quantity', 'second_quantity', 'third_quantity', 'fourth_quantity', 'fifth_quantity']

        # labels = {
        #     'first_quantity': _('1ST'),
        #     'second_quantity': _('2ND'),
        #     'third_quantity': _('3RD'),
        #     'fourth_quantity': _('4TH'),
        #     'fifth_quantity': _('5TH'),
        # }








