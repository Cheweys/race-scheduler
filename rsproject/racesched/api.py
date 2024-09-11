from typing import List, Optional
from ninja import NinjaAPI
from .models import RaceScheduleCyclingEvent, RaceScheduleRider, RaceScheduleBike, RaceScheduleWheelset, RaceScheduleRace
from .schema import CyclingEventSchemaOut, CyclingEventSchemaFull, RiderSchemaOut, BikeSchemaOut, WheelsetSchemaOut, RaceSchemaOut, NotFoundSchema

api = NinjaAPI()

@api.get("/events_full", response=List[CyclingEventSchemaFull])
def events_full(request):
    return RaceScheduleCyclingEvent.objects.all()

@api.get("/events", response=List[CyclingEventSchemaOut])
def cycling_events(request):
    return RaceScheduleCyclingEvent.objects.all()

@api.get("/races", response=List[RaceSchemaOut])
def races(request):
    return RaceScheduleRace.objects.all()

@api.get("/riders", response=List[RiderSchemaOut])
def riders(request):
    return RaceScheduleRider.objects.all()

@api.get("/bikes", response=List[BikeSchemaOut])
def bikes(request):
    return RaceScheduleBike.objects.all()

@api.get("/wheels", response=List[WheelsetSchemaOut])
def wheels(request):
    return RaceScheduleWheelset.objects.all()