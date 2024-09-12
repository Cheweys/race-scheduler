from django.shortcuts import render, get_object_or_404
from . import models
from django.views import generic

def event_list(request):
    events = models.RaceScheduleCyclingEvent.objects.all()
    context = {'events': events}
    return render(request, 'event_list.html', context)

def event_detail(request, pk):
    #races = models.RaceScheduleRace.objects.select_related('cycling_event').filter(cycling_event__pk=event_pk)
    event = models.RaceScheduleCyclingEvent.objects.get(pk=pk)
    races = models.RaceScheduleRace.objects.filter(cycling_event=event)
    context = {'event': event, 'races': races}
    return render(request, 'event_detail.html', context)