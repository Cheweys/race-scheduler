from typing import List, Optional
from ninja import NinjaAPI
from .models import RaceScheduleCyclingEvent, RaceScheduleRider, RaceScheduleBike, RaceScheduleWheelset, RaceScheduleRace
from .schema import CyclingEventSchemaOut, CyclingEventSchemaIn, CyclingEventSchemaFull
from .schema import RiderSchemaOut, RiderSchemaIn, BikeSchemaOut, BikeSchemaIn, WheelsetSchemaOut, WheelsetSchemaIn
from .schema import RaceSchemaOut, RaceSchemaIn, RaceSchemaFullOut, NotFoundSchema

api = NinjaAPI()

@api.get("/races_full", response=List[RaceSchemaFullOut])
def races_full_detail(request):
    return RaceScheduleRace.objects.all()

#@api.get("/events_full", response=List[CyclingEventSchemaFull])
#def cycling_events_full(request):
    #queryset = RaceScheduleCyclingEvent.objects.select_related("races").all()
    #return list(queryset)
#    return RaceScheduleCyclingEvent.objects.all()

@api.get("/events", response=List[CyclingEventSchemaOut])
def cycling_events(request):
    return RaceScheduleCyclingEvent.objects.all()

@api.get("/events/{event_id}", response={200: CyclingEventSchemaOut, 404: NotFoundSchema})
def cycling_event(request, event_id: int):
    try:
        event = RaceScheduleCyclingEvent.objects.get(pk=event_id)
        return 200, event
    except RaceScheduleCyclingEvent.DoesNotExist as e:
        return 404, {"message": "Cycling Event does not exist."}

@api.post("/events", response={201:CyclingEventSchemaOut})
def create_cycling_event(request, event: CyclingEventSchemaIn):
    event = RaceScheduleCyclingEvent.objects.create(**event.dict())
    return event

@api.put("/events/{event_id}", response={200: CyclingEventSchemaOut, 404: NotFoundSchema})
def update_cycling_event(request, event_id: int, data: CyclingEventSchemaOut):
    try:
        event = RaceScheduleCyclingEvent.objects.get(pk=event_id)
        for attribute, value in data.dict().items():
            setattr(event, attribute, value)
        event.save()
        return 200, event
    except RaceScheduleCyclingEvent.DoesNotExist as e:
        return 404, {"message": "Cycling Event does not exist."}

@api.delete("/events/{event_id}", response={200: None, 404: NotFoundSchema})
def delete_cycling_event(request, event_id:int):
    try:
        event = RaceScheduleCyclingEvent.objects.get(pk=event_id)
        event.delete()
    except RaceScheduleCyclingEvent.DoesNotExist as e:
        return 404, {"message": "Cycling Event does not exist."}

@api.get("/races", response=List[RaceSchemaOut])
def races(request):
    return RaceScheduleRace.objects.all()

@api.get("/races/{race_id}", response={200: RaceSchemaOut, 404: NotFoundSchema})
def race(request, race_id: int):
    try:
        race = RaceScheduleRace.objects.get(pk=race_id)
        return 200, race
    except RaceScheduleRace.DoesNotExist as e:
        return 404, {"message": "Race does not exist."}

@api.post("/races", response={201:RaceSchemaOut})
def create_race(request, race: RaceSchemaIn):
    # TODO: Test this. I think I need to look up the related event, rider, bike, and wheelset first
    race = RaceScheduleRace.objects.create(**race.dict())
    return race

@api.put("/races/{race_id}", response={200: RaceSchemaOut, 404: NotFoundSchema})
def update_race(request, race_id: int, data: RaceSchemaOut):
    try:
        # TODO: Test this. Do I need to look up the related event, rider, bike, and wheelset first
        race = RaceScheduleRace.objects.get(pk=race_id)
        for attribute, value in data.dict().items():
            setattr(race, attribute, value)
        race.save()
        return 200, race
    except RaceScheduleRace.DoesNotExist as e:
        return 404, {"message": "Race does not exist."}

@api.delete("/races/{race_id}", response={200: None, 404: NotFoundSchema})
def delete_race(request, race_id:int):
    try:
        race = RaceScheduleRace.objects.get(pk=race_id)
        race.delete()
    except RaceScheduleRace.DoesNotExist as e:
        return 404, {"message": "Race does not exist."}

@api.get("/riders", response=List[RiderSchemaOut])
def riders(request):
    return RaceScheduleRider.objects.all()

@api.get("/riders/{rider_id}", response={200: RiderSchemaOut, 404: NotFoundSchema})
def rider(request, rider_id: int):
    try:
        rider = RaceScheduleRider.objects.get(pk=rider_id)
        return 200, rider
    except RaceScheduleRider.DoesNotExist as e:
        return 404, {"message": "Rider does not exist."}

@api.post("/riders", response={201:RiderSchemaOut})
def create_rider(request, rider: RiderSchemaIn):
    rider = RaceScheduleRider.objects.create(**rider.dict())
    return rider

@api.put("/riders/{rider_id}", response={200: RiderSchemaOut, 404: NotFoundSchema})
def update_rider(request, rider_id: int, data: RiderSchemaOut):
    try:
        rider = RaceScheduleRider.objects.get(pk=rider_id)
        for attribute, value in data.dict().items():
            setattr(rider, attribute, value)
        rider.save()
        return 200, rider
    except RaceScheduleRider.DoesNotExist as e:
        return 404, {"message": "Rider does not exist."}

@api.delete("/riders/{rider_id}", response={200: None, 404: NotFoundSchema})
def delete_rider(request, rider_id:int):
    try:
        rider = RaceScheduleRider.objects.get(pk=rider_id)
        rider.delete()
    except RaceScheduleRider.DoesNotExist as e:
        return 404, {"message": "Rider does not exist."}

@api.get("/bikes", response=List[BikeSchemaOut])
def bikes(request):
    return RaceScheduleBike.objects.all()

@api.get("/bikes/{bike_id}", response={200: BikeSchemaOut, 404: NotFoundSchema})
def bike(request, bike_id: int):
    try:
        bike = RaceScheduleBike.objects.get(pk=bike_id)
        return 200, bike
    except RaceScheduleBike.DoesNotExist as e:
        return 404, {"message": "Bike does not exist."}

@api.post("/bikes", response={201:BikeSchemaOut})
def create_bike(request, bike: BikeSchemaIn):
    b = bike.dict()
    b['rider'] = RaceScheduleRider.objects.get(pk=bike.rider)
    bike = RaceScheduleBike.objects.create(**b)
    return bike

@api.put("/bikes/{bike_id}", response={200: BikeSchemaOut, 404: NotFoundSchema})
def update_bike(request, bike_id: int, data: BikeSchemaOut):
    try:
        bike = RaceScheduleBike.objects.get(pk=bike_id)
        for attribute, value in data.dict().items():
            setattr(bike, attribute, value)
        setattr(bike, 'rider', RaceScheduleRider.objects.get(pk=data.rider))
        bike.save()
        return 200, bike
    except RaceScheduleBike.DoesNotExist as e:
        return 404, {"message": "Bike does not exist."}

@api.delete("/bikes/{bike_id}", response={200: None, 404: NotFoundSchema})
def delete_bike(request, bike_id:int):
    try:
        bike = RaceScheduleBike.objects.get(pk=bike_id)
        bike.delete()
    except RaceScheduleBike.DoesNotExist as e:
        return 404, {"message": "Bike does not exist."}

@api.get("/wheelsets", response=List[WheelsetSchemaOut])
def wheelsets(request):
    return RaceScheduleWheelset.objects.all()

@api.get("/wheelsets/{wheelset_id}", response={200: WheelsetSchemaOut, 404: NotFoundSchema})
def wheelset(request, wheelset_id: int):
    try:
        wheelset = RaceScheduleWheelset.objects.get(pk=wheelset_id)
        return 200, wheelset
    except RaceScheduleWheelset.DoesNotExist as e:
        return 404, {"message": "Wheelset does not exist."}

@api.post("/wheelsets", response={201:WheelsetSchemaOut})
def create_wheelsets(request, wheelset: WheelsetSchemaIn):
    w = wheelset.dict()
    w['rider'] = RaceScheduleRider.objects.get(pk=wheelset.rider)
    wheelset = RaceScheduleWheelset.objects.create(**w)
    return wheelset

@api.put("/wheelsets/{wheelset_id}", response={200: WheelsetSchemaOut, 404: NotFoundSchema})
def update_wheelset(request, wheelset_id: int, data: WheelsetSchemaOut):
    try:
        wheelset = RaceScheduleWheelset.objects.get(pk=wheelset_id)
        for attribute, value in data.dict().items():
            setattr(wheelset, attribute, value)
        setattr(wheelset, 'rider', RaceScheduleRider.objects.get(pk=data.rider))
        wheelset.save()
        return 200, wheelset
    except RaceScheduleWheelset.DoesNotExist as e:
        return 404, {"message": "Wheelset does not exist."}

@api.delete("/wheelsets/{wheelset_id}", response={200: None, 404: NotFoundSchema})
def delete_wheelset(request, wheelset_id:int):
    try:
        wheelset = RaceScheduleWheelset.objects.get(pk=wheelset_id)
        wheelset.delete()
    except RaceScheduleWheelset.DoesNotExist as e:
        return 404, {"message": "Wheelset does not exist."}
