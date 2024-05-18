from django.db import models
from django import forms
from django.contrib.auth.models import AbstractUser
from datetime import datetime
from django.contrib.auth.models import AbstractUser


# *************************************************************
# *                         ACCOUNT                           *
# *************************************************************
class Account(AbstractUser):
    email = models.EmailField("Email Address", unique=True, max_length=255, blank=True, null=True)

    def __str__(self):
        return self.username


# *************************************************************
# *                          STAFF                            *
# *************************************************************
class Film(models.Model):
    movie_name = models.CharField(verbose_name="Movie Name",max_length = 100)
    movie_genre = models.CharField(verbose_name="Genre", max_length = 100,null=True,blank=True)
    movie_lang = models.CharField(verbose_name="Language",blank=True, null=True,max_length = 100)
    movie_year = models.IntegerField(verbose_name="Year",blank=True, null=True)
    movie_plot = models.TextField(verbose_name="Plot",blank=True, null=True,help_text="movie plot here ")
    url = models.URLField(blank=True, null=True)
#     active = models.BooleanField(default=True)
    date_added = models.DateField(auto_now=False, auto_now_add=True, blank=True, null=True)

    def __str__(self):
        return self.movie_name


class Banner(models.Model):
    movie = models.ForeignKey(Film, verbose_name="Movie",on_delete=models.CASCADE,blank=True,null=True)
    url = models.URLField(verbose_name="Banner Image URL",blank=True, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    def __str__(self):
        return self.movie.movie_name


class Show(models.Model):
    movie = models.ForeignKey(Film, verbose_name="Movie",on_delete=models.CASCADE,blank=True,null=True)
    start_date = models.DateField(verbose_name="Start Date",null=True)
    end_date = models.DateField(verbose_name="End Date",null=True)
    price = models.PositiveIntegerField(verbose_name="Ticket Price")
    showtime = models.TimeField(verbose_name="Showtime",auto_now=False, auto_now_add=False,blank=True, null=True)
    # modifiedby = models.OneToOneField(Account,on_delete=models.SET_NULL)

    def __str__(self):
        return self.movie.movie_name+"@"+self.showtime.strftime("%I:%M %p")


# *************************************************************
# *                         BOOKING                           *
# *************************************************************
class Booking(models.Model):
    booking_code = models.CharField(max_length=100)
    user = models.ForeignKey(Account, on_delete=models.DO_NOTHING)
    show = models.ForeignKey(Show, on_delete=models.CASCADE)
    seat_num = models.CharField(max_length=25)
    num_seats = models.PositiveSmallIntegerField(blank=True, null=True)
    total = models.IntegerField(blank=True, null=True)
    show_date = models.DateField(null=True)
    booked_date = models.DateTimeField(blank=True, null=True, auto_now_add=True)

    def __str__(self) -> str:
        return self.seat_num + "@" + self.show_date.strftime("%m/%d/%Y") + " " + self.show.movie.movie_name
