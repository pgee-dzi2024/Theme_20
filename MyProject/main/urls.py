from . import views
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('', views.home, name='mainpage'),
    path('detail/<id>', views.movie_detail, name="movie detail"),
    path('show', views.show_select, name="show select"),
    path('bookedseats', views.bookedseats, name="bookedseats"),
    path('mybookings', views.userbookings, name="user bookings"),
    path('checkout', views.checkout, name="checkout"),
    path('cancelbooking/<int:id>', views.cancelbooking, name='cancel-booking'),

    # account
    path('usersignin/', views.user_login, name='user login'),
    path('userregister/', views.user_signup, name='user register'),
    path('adminlogin/', views.admin_login, name='admin login'),
    path('logout/', views.signout, name="logout"),

]