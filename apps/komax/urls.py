from django.urls import path
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    path('', login_required(views.DrFormListView.as_view()), name='komax_home'),
    path('create/', login_required(views.DrFormCreateView.as_view()), name='komax_new_dr'),
    path('delete/<int:pk>/', login_required(views.DrFormDeleteView.as_view()), name='komax_delete_dr'),
]
