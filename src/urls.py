from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required

from . import views as src_views

admin.site.site_header = 'Torres Technology Center Corporation'
admin.site.site_title = "T-TECH"
admin.site.index_title = "Welcome to T-TECH Admin Page"
admin.site.enable_nav_sidebar = False


urlpatterns = [
    path('admin/', admin.site.urls),
    path('komax/', include('apps.komax.urls')),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    # path('check_group/', src_views.check_group, name='check_group'),
    path('dashboard/', login_required(src_views.dashboard), name='dashboard'),
]
