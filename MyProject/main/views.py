from multiprocessing import context
from django.shortcuts import HttpResponseRedirect, render
from django.http import HttpResponse
from django.forms import formset_factory, modelformset_factory

from datetime import datetime, date,time,timezone
from django.views.generic.list import ListView
from django.contrib.auth.decorators import (user_passes_test)
from .models import *

from django.core.mail import EmailMessage
from django.conf import settings
from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required,permission_required,user_passes_test
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect, HttpResponseRedirect
from .forms import SignUpForm, LoginForm


# *************************************************************
# *                         ACCOUNT                           *
# *************************************************************
def staff_required(user):
    return user.is_authenticated and user.is_staff


def user_login_required(user):
    return user.is_authenticated


def is_user(user):
    return not user.is_staff


def user_signup(request):
    if request.user.is_authenticated:
        return redirect('/')
    msg = None
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            msg = 'user created'
            return redirect('/accounts/usersignin')
        else:
            msg = 'form is not valid'
    else:
        form = SignUpForm()
    return render(request, 'user_register.html', {'form': form, 'msg': msg})


def user_login(request):
    if request.user.is_authenticated:
        # return render(request, 'account_index.html')
        return redirect('/')
    form = LoginForm(request.POST or None)
    msg = None
    if request.method == 'POST':

        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None and user.is_staff:
                # if user is not None and user.role==1:
                login(request, user)
                return redirect('/admin')
            # elif user is not None and user.is_customer:
            elif user is not None and not user.is_staff:
                # elif user is not None and user.role==0:
                login(request, user)
                return redirect('/')
            # elif user is not None and user.is_employee:
            #     login(request, user)
            #     return redirect('employee')
            else:
                msg = 'invalid credentials'
        else:
            msg = 'error validating form'

    return render(request, 'user_signin.html', {'form': form, 'msg': msg})


def admin_login(request):
    if request.user.is_authenticated and request.user.is_staff:
        # return render(request, 'account_index.html')
        return redirect('/admin')
    form = LoginForm(request.POST or None)
    msg = None
    if request.method == 'POST':

        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None and user.is_staff:
                # if user is not None and user.role==1:
                login(request, user)
                return redirect('/admin')
            # elif user is not None and user.is_customer:
            elif user is not None and not user.is_staff:
                # elif user is not None and user.role==0:
                login(request, user)
                return redirect('/')
            # elif user is not None and user.is_employee:
            #     login(request, user)
            #     return redirect('employee')
            else:
                msg = 'invalid credentials'
        else:
            msg = 'error validating form'

    return render(request, 'admin_login.html', {'form': form, 'msg': msg})
    # return render(request,)


@user_passes_test(staff_required, login_url='/adminlogin')
def admin(request):
    return render(request, 'admin.html')


@login_required(login_url='/login')
def customer(request):
    return render(request, 'customer.html')


def signout(request):
    if request.user.is_staff:
        url = "/admin"
    else:
        url = "/"
    logout(request)
    return redirect(url)


# *************************************************************
# *                         BOOKING                           *
# *************************************************************
def home(request):
    movies = Film.objects.filter().values_list('id', 'movie_name', 'url', named=True)
    banners = Banner.objects.filter().select_related().values_list('movie__id', 'movie__movie_name', 'url', named=True)
    return render(request,"main/booking/index.html", context={'films': movies, 'banners': banners})

def movie_detail(request,id):
    context = {}
    context['film'] = Film.objects.get(id = id) 
    context ['showtimes'] = Show.objects.filter(movie=id,end_date__gte=date.today()).all().values_list('id', 'showtime',
                                                                                                       named=True)
    return render(request,"movie_detail.html",context)

@user_passes_test(user_login_required, login_url='/accounts/usersignin')
def show_select(request):
    if(request.method == "GET" and len(request.GET)!=0):
        
        date = request.GET['date']
        films = ""
        # add showitme >= current time + 5 min
        shows = Show.objects.filter(end_date__gte=date, start_date__lte=date).select_related('movie_id','movie__url','movie__movie_name').order_by('movie_id','showtime').values_list('id','price','showtime','movie','movie__url','movie__movie_name',named=True)
        res_dict = {}
        
        # Grouping shows rows by movie and appending showitmes in a list
        for s in shows:
            # legend of fields: showid 0, price 1, showtime 2, movieid 3, movieurl 4, moviename 5,
            if(s[5] not in res_dict.keys()): 
                #movie doesn't exit in dict
                res_dict[s[5]]={'url':s[4],'price':s[1], 'showtimes':{s[0]:s[2]}, 'movieid':s[3]}
            else: 
                #movie already exists
                res_dict[s[5]]['showtimes'][s[0]]=s[2]            
        
    return render(request,"show_selection.html",context={'films':res_dict, 'date':date, 'shows':shows})


def bookedseats(request):
    """
    AJAX seat booking info retrival view funciton
    """
    if request.method == 'GET':
           show_id = request.GET['show_id']
           show_date = request.GET['show_date']
           seats = Booking.objects.filter(show=show_id,show_date=show_date).values('seat_num')
           booked = ""
           for s in seats:
            booked+=s['seat_num']+","
           return HttpResponse(booked[:-1])
    else:
           return HttpResponse("Request method is not a GET")


def sendEmail(request,message):
    """
    Function to send Email
    """
    template ="Hello "+request.user.username+'\n'+message

    user_email = request.user.email

    email = EmailMessage(
        'Tickets Confirmation Email',
        template,
        settings.EMAIL_HOST_USER,
        [user_email],
    )

    email.fail_silently = False
    email.send()
    return True


def checkout(request):
    context = {}
    if (request.method == "POST"):
        show_date = request.POST['showdate']
        seats = request.POST['seats']
        show_id = request.POST['showid']
        # Get Show id
        showinfo = Show.objects.get(id=show_id)
        num_seats = len(seats.split(","))
        showinfo = Show.objects.get(id=show_id)
        total = showinfo.price*num_seats
        Booking.objects.create(booking_code="Random",user=request.user,show=showinfo,show_date=show_date,booked_date=datetime.now(timezone.utc),  seat_num=seats, num_seats=num_seats,total = total)        
        context["film"] = Film.objects.get(movie_name = showinfo.movie)
        context['sdate'] = show_date
        context['seats'] = seats
        context['show'] = showinfo
        message="\nYour tickets are successsfully booked. Here are the details. \nThe movie is {}. \nThe show is on {}. \nThe show starts at {}. \nYour seat numbers are {}. \n\nThank you,\nBookMyTicket".format(context["film"], show_date,showinfo.showtime,seats)
        sendEmail(request,message)
    return render(request,"checkout.html",context)

@user_passes_test(user_login_required, login_url='/accounts/usersignin')
def userbookings(request):
    msg = ""
    if (request.method == "GET" and len(request.GET)!=0):
        msg = request.GET['ack']

    booking_table = Booking.objects.filter(user=request.user).select_related().order_by('-booked_date').values_list('id','show_date','booked_date','show__movie__movie_name','show__movie__url','show__showtime','total','seat_num',named=True)
    
    context = {
        'data': booking_table,
        'msg': msg
    }
    return render(request,"bookings.html",context)

@user_passes_test(user_login_required, login_url='/accounts/usersignin')
def cancelbooking(request,id):
    bobj = Booking.objects.get(id=id)
    message = "\nYour tickets are succcessfully Cancelled. Here are the details.\nYour show info{}\nYour Show date {}\nYour seats\n\nThank you,\nBookMyTicket".format(bobj.show,bobj.show_date,bobj.seat_num)
    ack = "Your tickets {} for {} are cancelled successfully".format(bobj.seat_num,bobj.show)
    bobj.delete()
    sendEmail(request,message)
    
    return HttpResponseRedirect("/mybookings?ack="+ack)
