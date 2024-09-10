from django.db import models

class RaceScheduleCyclingEvent(models.Model):
    cycling_event_id = models.AutoField(primary_key=True)
    year = models.IntegerField()
    event_name = models.CharField(max_length=200)
    address = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=100)
    state = models.CharField(max_length=2)
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    event_url = models.CharField(max_length=250, blank=True, null=True)
    registration_url = models.CharField(max_length=250, blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'race_schedule_cycling_event'
        unique_together = (('year', 'event_name'),)

    def __str__(self):
        return self.event_name + ', ' + self.city + ', ' + self.state + ' (' + self.start_date.isoformat() + ')'

class RaceScheduleRider(models.Model):
    rider_id = models.AutoField(primary_key=True)
    rider_name = models.CharField(unique=True, max_length=250)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'race_schedule_rider'
    
    def __str__(self):
        return self.rider_name

class RaceScheduleBike(models.Model):
    bike_id = models.AutoField(primary_key=True)
    rider = models.ForeignKey(RaceScheduleRider, on_delete=models.PROTECT)
    make = models.CharField(unique=True, max_length=250)
    model = models.CharField(unique=True, max_length=250)
    retired = models.CharField(max_length=1)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'race_schedule_bike'
    
    def __str__(self):
        return self.rider.rider_name + "'s " + self.make + " " + self.model

class RaceScheduleWheelset(models.Model):
    wheelset_id = models.AutoField(primary_key=True)
    rider = models.ForeignKey(RaceScheduleRider, on_delete=models.PROTECT)
    make = models.CharField(unique=True, max_length=250)
    model = models.CharField(unique=True, max_length=250)
    size = models.CharField(max_length=100, blank=True, null=True)
    retired = models.CharField(max_length=1)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'race_schedule_wheelset'
    
    def __str__(self):
        return self.rider.rider_name + "'s " + self.make + " " +self.model

class RaceScheduleRace(models.Model):
    race_id = models.AutoField(primary_key=True)
    cycling_event = models.ForeignKey(RaceScheduleCyclingEvent, on_delete=models.PROTECT)
    rider = models.ForeignKey(RaceScheduleRider, on_delete=models.PROTECT)
    race_date = models.DateField(blank=True, null=True)
    race_start_time = models.TimeField(blank=True, null=True)
    distance = models.IntegerField()
    distance_units = models.CharField(max_length=2)
    terrain_type = models.CharField(max_length=20, blank=True, null=True)
    route_url = models.CharField(max_length=250, blank=True, null=True)
    cost = models.FloatField(blank=True, null=True)
    is_elite = models.CharField(max_length=1)
    bike = models.ForeignKey(RaceScheduleBike, models.DO_NOTHING, blank=True, null=True)
    wheelset = models.ForeignKey(RaceScheduleWheelset, on_delete=models.PROTECT, blank=True, null=True)
    results_url = models.CharField(max_length=250, blank=True, null=True)
    total_time = models.TimeField(blank=True, null=True)
    total_elevation_gain_feet = models.IntegerField(blank=True, null=True)
    average_speed = models.FloatField(blank=True, null=True)
    average_power = models.IntegerField(blank=True, null=True)
    normalized_power = models.IntegerField(blank=True, null=True)
    category_desc = models.CharField(max_length=250, blank=True, null=True)
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
    
    def __str__(self):
        return self.rider.rider_name + "'s " + self.cycling_event.event_name + " Race (" + self.race_date.isoformat() + ")"
