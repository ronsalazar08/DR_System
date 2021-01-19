from django.urls import path
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    path('', login_required(views.DrFormListView.as_view()), name='foiling_home'),
    path('new_or_rename_dr/', login_required(views.new_or_rename_dr), name='foiling_new_or_rename_dr'),
    path('delete_dr/<slug:cnum>', login_required(views.delete_dr), name='foiling_delete_dr'),
    path('close_dr/<slug:cnum>', login_required(views.close_dr), name='foiling_close_dr'),
    path('edit_dr/<slug:cnum>', login_required(views.edit_dr), name='foiling_edit_dr'),
    path('delete_item/<int:pk>', login_required(views.delete_item), name='foiling_delete_item'),
]
