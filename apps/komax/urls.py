from django.urls import path
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    path('', login_required(views.DrFormListView.as_view()), name='komax_home'),
    path('new_or_rename_dr/', login_required(views.new_or_rename_dr), name='komax_new_or_rename_dr'),
    path('delete_dr/<slug:cnum>', login_required(views.delete_dr), name='komax_delete_dr'),
    path('close_dr/<slug:cnum>', login_required(views.close_dr), name='komax_close_dr'),
    path('edit_dr/<slug:cnum>', login_required(views.edit_dr), name='komax_edit_dr'),
    # path('create/', login_required(views.DrFormCreateView.as_view()), name='komax_new_dr'),
    # path('delete/<int:pk>/', login_required(views.DrFormDeleteView.as_view()), name='komax_delete_dr'),
]
