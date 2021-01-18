from django.urls import path
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    path('', login_required(views.HomeView.as_view()), name='accounting_home'),
    path('summary/<slug:dept>', login_required(views.SelectView), name='accounting_select'),
    path('summary/<slug:dept>/<slug:customer>/<slug:month>/<slug:year>', login_required(views.SummaryView), name='accounting_summary'),
]
