from .models import RaceScheduleCyclingEvent, RaceScheduleRider, RaceScheduleBike, RaceScheduleWheelset, RaceScheduleRace
from ninja import Schema, ModelSchema

class NotFoundSchema(Schema):
    message: str

class CyclingEventSchemaFull(ModelSchema):
    class Meta:
        model = RaceScheduleCyclingEvent
        fields = "__all__"
        depth = 1

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
<<<<<<< HEAD
        fields = "__all__"

class RaceSchemaFullOut(ModelSchema):
    class Meta:
        model = RaceScheduleRace
        fields = ['race_id', 'cycling_event', 'rider', 'race_date', 'race_start_time', 'distance']
        #, distance_units,
         #         terrain_type, route_url, cost, is_elite, bike, wheelset, results_url, total_time,
         #         total_elevation_gain_feet, average_speed = models.FloatField(blank=True, null=True)
    #average_power = models.IntegerField(blank=True, null=True)
    #normalized_power = models.IntegerField(blank=True, null=True)
    #category_desc = models.CharField(max_length=250, blank=True, null=True)
    #category_result_position = models.IntegerField(blank=True, null=True)
    #age_group_position = models.IntegerField(blank=True, null=True)
    #overall_female_male_position = models.IntegerField(blank=True, null=True)
    #overall_result_position = models.IntegerField(blank=True, null=True)
    #overall_multiday_result_position = models.IntegerField(blank=True, null=True)
    #payout = models.IntegerField(blank=True, null=True)
    #prize = models.TextField(blank=True, null=True)
    #notes]
        depth = 1
=======
        fields = "__all__"
>>>>>>> 40a57c8 (?)
