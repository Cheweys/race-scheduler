from django.shortcuts import render, get_object_or_404
from . import models
from django.views import generic

def event_list(request):
    events = models.RaceScheduleCyclingEvent.objects.all()
    context = {'events': events}
    return render(request, 'event_list.html', context)

def event_detail(request, pk):
    event = get_object_or_404(models.RaceScheduleCyclingEvent, pk=pk)
    context = {'event': event}
    return render(request, 'event_detail.html', context)