from typing import List, Optional
from ninja import NinjaAPI
from racesched.models import RaceScheduleRace
from racesched.schema import RaceSchemaFullOut, NotFoundSchema

api = NinjaAPI()


@api.get("/races", response=List[RaceSchemaFullOut])
def races(request):
    return RaceScheduleRace.objects.all()