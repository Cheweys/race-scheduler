from django.db import models

class RaceScheduleCyclingEvent(models.Model):
    cycling_event_id = models.AutoField(primary_key=True)
    year = models.IntegerField()
    event_name = models.TextField()
    address = models.TextField(blank=True, null=True)
    city = models.TextField()
    state = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    event_url = models.TextField(blank=True, null=True)
    registration_url = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'race_schedule_cycling_event'
        unique_together = (('year', 'event_name'),)

class RaceScheduleRider(models.Model):
    rider_id = models.AutoField(primary_key=True)
    rider_name = models.TextField(unique=True)

    class Meta:
        managed = False
        db_table = 'race_schedule_rider'

class RaceScheduleBike(models.Model):
    bike_id = models.AutoField(primary_key=True)
    rider = models.ForeignKey(RaceScheduleRider, on_delete=models.PROTECT)
    make = models.TextField(unique=True)
    model = models.TextField(unique=True)
    retired = models.TextField()

    class Meta:
        managed = False
        db_table = 'race_schedule_bike'

class RaceScheduleWheelset(models.Model):
    wheelset_id = models.AutoField(primary_key=True)
    rider = models.ForeignKey(RaceScheduleRider, on_delete=models.PROTECT)
    model = models.TextField(unique=True)
    retired = models.TextField()

    class Meta:
        managed = False
        db_table = 'race_schedule_wheelset'

class RaceScheduleRace(models.Model):
    race_id = models.AutoField(primary_key=True)
    cycling_event = models.ForeignKey(RaceScheduleCyclingEvent, on_delete=models.PROTECT)
    rider = models.ForeignKey(RaceScheduleRider, on_delete=models.PROTECT)
    race_date = models.DateField(blank=True, null=True)
    race_start_time = models.TimeField(blank=True, null=True)
    distance = models.IntegerField()
    distance_units = models.TextField()
    terrain_type = models.TextField(blank=True, null=True)
    route_url = models.TextField(blank=True, null=True)
    cost = models.FloatField(blank=True, null=True)
    is_elite = models.TextField()
    bike = models.ForeignKey(RaceScheduleBike, on_delete=models.PROTECT, blank=True, null=True)
    wheelset = models.ForeignKey(RaceScheduleWheelset, on_delete=models.PROTECT, blank=True, null=True)
    results_url = models.TextField(blank=True, null=True)
    total_time = models.TimeField(blank=True, null=True)
    total_elevation_gain_feet = models.IntegerField(blank=True, null=True)
    average_speed = models.FloatField(blank=True, null=True)
    average_power = models.IntegerField(blank=True, null=True)
    normalized_power = models.IntegerField(blank=True, null=True)
    category_desc = models.TextField(blank=True, null=True)
    category_result_position = models.IntegerField(blank=True, null=True)
    age_group_position = models.IntegerField(blank=True, null=True)
    overall_female_male_position = models.IntegerField(blank=True, null=True)
    overall_result_position = models.IntegerField(blank=True, null=True)
    overall_multiday_result_position = models.IntegerField(blank=True, null=True)
    payout = models.IntegerField(blank=True, null=True)
    prize = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'race_schedule_race'
