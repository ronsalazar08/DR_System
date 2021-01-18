from django import forms
from datetime import datetime as dt

class SelectForm(forms.Form):
    customerCHOICES=[('CHRYSLER','CHRYSLER'),
                     ('GM','GM'),
                     ('HONDA','HONDA'),
                     ('IMV','IMV'),
                     ('OUTLANDER','OUTLANDER')]
    monthCHOICES=[('01', 'JANUARY'),
                ('02', 'FEBRUARY'),
                ('03', 'MARCH'),
                ('04', 'APRIL'),
                ('05', 'MAY'),
                ('06', 'JUNE'),
                ('07', 'JULY'),
                ('08', 'AUGUST'),
                ('09', 'SEPTEMBER'),
                ('10', 'OCTOBER'),
                ('11', 'NOVEMBER'),
                ('12', 'DECEMBER')]
    yearCHOICES=[(dt.now().year, dt.now().year), (dt.now().year - 1, dt.now().year - 1)]
    customer = forms.ChoiceField(choices=customerCHOICES, required=True)
    month = forms.ChoiceField(choices=monthCHOICES, required=True)
    year = forms.ChoiceField(choices=yearCHOICES, required=True)


