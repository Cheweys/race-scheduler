from django.contrib import admin
from .models import RaceScheduleCyclingEvent, RaceScheduleRider, RaceScheduleBike, RaceScheduleWheelset, RaceScheduleRace

admin.site.register(RaceScheduleCyclingEvent)
admin.site.register(RaceScheduleRider)
admin.site.register(RaceScheduleBike)
admin.site.register(RaceScheduleWheelset)
admin.site.register(RaceScheduleRace)
