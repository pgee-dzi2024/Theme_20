from django.db import models
# from accounts.models import Account
# from django.forms import *


class Film(models.Model):
    movie_name = models.CharField(verbose_name="Име на филма",max_length = 100)
    movie_genre = models.CharField(verbose_name="Жанр", max_length = 100, null=True, blank=True)
    movie_lang = models.CharField(verbose_name="Език", blank=True, null=True, max_length = 100)
    movie_year = models.IntegerField(verbose_name="Година", blank=True, null=True)
    movie_plot = models.TextField(verbose_name="Резюме", blank=True, null=True, help_text="кратко описание на филма")
    photo = models.ImageField('Снимка', upload_to='films', blank=True)

#     active = models.BooleanField(default=True)
    date_added = models.DateField(auto_now=False, auto_now_add=True, blank=True, null=True)

    def __str__(self):
        return self.movie_name


class banner(models.Model):
    movie = models.ForeignKey(Film, verbose_name="Movie", on_delete=models.CASCADE, blank=True,null=True)
    photo = models.ImageField('Снимка', upload_to='baners', blank=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    def __str__(self):
        return self.movie.movie_name


class show(models.Model):
    movie = models.ForeignKey(Film,verbose_name="Movie",on_delete=models.CASCADE,blank=True,null=True)
    start_date = models.DateField(verbose_name="Start Date", null=True)
    end_date = models.DateField(verbose_name="End Date", null=True)
    price = models.PositiveIntegerField(verbose_name="Ticket Price")
    showtime = models.TimeField(verbose_name="Showtime",auto_now=False, auto_now_add=False,blank=True, null=True)
    # modifiedby = models.OneToOneField(Account,on_delete=models.SET_NULL)

    def __str__(self):
        return self.movie.movie_name+"@"+self.showtime.strftime("%I:%M %p")
