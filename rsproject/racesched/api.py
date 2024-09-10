from typing import List, Optional
from ninja import NinjaAPI
from .models import RaceScheduleRace
from .schema import RaceSchemaFullOut, NotFoundSchema

api = NinjaAPI()


@api.get("/races", response=List[RaceSchemaFullOut])
def races(request):
    return RaceScheduleRace.objects.all()