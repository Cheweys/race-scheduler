from models import RaceScheduleCyclingEvent, RaceScheduleRider, RaceScheduleBike, RaceScheduleWheelset, RaceScheduleRace
from ninja import ModelSchema

class CyclingEventSchemaIn(ModelSchema):
    class Meta:
        model = RaceScheduleCyclingEvent
        exclude = ['cycling_event_id']

class CyclingEventSchemaOut(ModelSchema):
    class Meta:
        model = RaceScheduleCyclingEvent
        fields = "__all__"

class RiderSchemaIn(ModelSchema):
    class Meta:
        model = RaceScheduleRider
        exclude = ['rider_id']

class RiderSchemaOut(ModelSchema):
    class Meta:
        model = RaceScheduleRider
        fields = "__all__"

class BikeSchemaIn(ModelSchema):
    class Meta:
        model = RaceScheduleBike
        exclude = ['bike_id']

class BikeSchemaOut(ModelSchema):
    class Meta:
        model = RaceScheduleBike
        fields = "__all__"

class WheelsetSchemaIn(ModelSchema):
    class Meta:
        model = RaceScheduleWheelset
        exclude = ['wheelset_id']

class WheelsetSchemaOut(ModelSchema):
    class Meta:
        model = RaceScheduleWheelset
        fields = "__all__"

class RaceSchemaIn(ModelSchema):
    class Meta:
        model = RaceScheduleRace
        exclude = ['race_id']

class RaceSchemaOut(ModelSchema):
    class Meta:
        model = RaceScheduleRace
        fields = "__all__"

class RaceSchemaFullOut(ModelSchema):
    class Meta:
        model = RaceScheduleRace
        fields = "__all__"
        depth = 1