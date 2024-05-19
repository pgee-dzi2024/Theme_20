from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from . import views

urlpatterns = [
    path('usersignin/', views.user_login, name='user login'),
    path('userregister/', views.user_signup, name='user register'),
    path('adminlogin/', views.admin_login, name='admin login'),
    path('logout/', views.signout, name="logout"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
