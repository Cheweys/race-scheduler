# race-scheduler

<mark>REMEMBER to set the environment variables in a `.env` file to execute locally.</mark> When deploying to Azure be sure to define the same variables as Application Settings. Locally, it should look something like the following.
```
% cat .env
AZUREPOSTGRESNAME='postgres'
AZUREPOSTGRESHOST='pats-postgresql.postgres.database.azure.com'
AZUREPOSTGRESUSER='ptschoen'
AZUREPOSTGRESPASS={{{PostgreSQL password>}}}
AZUREPOSTGRESPORT='5432'
SECRET_KEY={{{secret}}}
```

Refering to docs at ...

- https://medium.com/@theflyboy/building-a-simple-crud-application-with-django-ninja-from-scratch-37d7085453cf
- https://django-ninja.dev/tutorial/

**Project:** rsproject
**App:** racesched

On the mac I had to ensure openssl was installed ...
```
% brew install openssl
% export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/opt/openssl/lib
% pip3 install psycopg2
```

One time setup of the virtual Python environment ...
```
% python3 -m venv .venv
% pip install -r requirements.txt
```

To start the virtual Python environment. On a mac/unix ...
```
% source .venv/bin/activate
```
On a PC ...
```
% .venv/Scripts/activate
```
To deactivate ...
```
% deactivate
```

Used ["Azure Database for PostgreSQL flexible servers"](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.DBforPostgreSQL%2FflexibleServers)

To connect from command line (will be prompted for a password) ...
```
psql "--host=pats-postgresql.postgres.database.azure.com" "--port=5432" "--dbname=postgres" "--username=ptschoen" "--set=sslmode=require"
```

Initially defined a PostgreSQL schema to hold the tables. There's not the best support for this in django-ninja. \
Easier to use the `public` schema for User/Group management as well as the application tables.

Used ddl and dml scripts to define tables and load some initial data. These can be executed via psql via the `\i` command ...
```
postgres=> \i ddl.sql
postgres=> \i dml.sql
postgres=> \dt race*
                    List of relations
 Schema |            Name             | Type  |  Owner   
--------+-----------------------------+-------+----------
 public | race_schedule_bike          | table | ptschoen
 public | race_schedule_cycling_event | table | ptschoen
 public | race_schedule_race          | table | ptschoen
 public | race_schedule_rider         | table | ptschoen
 public | race_schedule_wheelset      | table | ptschoen

 postgres=> \d race_schedule_cycling_event
                                        Table "public.race_schedule_cycling_event"
      Column      |  Type   | Collation | Nullable |                                Default                                
------------------+---------+-----------+----------+-----------------------------------------------------------------------
 cycling_event_id | integer |           | not null | nextval('race_schedule_cycling_event_cycling_event_id_seq'::regclass)
 year             | integer |           | not null | 
 event_name       | text    |           | not null | 
 address          | text    |           |          | 
 city             | text    |           | not null | 
 state            | text    |           | not null | 
 start_date       | date    |           | not null | 
 end_date         | date    |           |          | 
 event_url        | text    |           |          | 
 registration_url | text    |           |          | 
 notes            | text    |           |          | 
Indexes:
    "race_schedule_cycling_event_pkey" PRIMARY KEY, btree (cycling_event_id)
    "race_schedule_cycling_event_year_event_name_key" UNIQUE CONSTRAINT, btree (year, event_name)
Referenced by:
    TABLE "race_schedule_race" CONSTRAINT "race_schedule_race_cycling_event_id_fkey" FOREIGN KEY (cycling_event_id) REFERENCES race_schedule_cycling_event(cycling_event_id)
```

To generate the django model code, first define the connection to the PostgreSQL dadtabase by modifying the `DATABASES` section of the project's settings.py file. **Note the options** ... this definition is correct, but I wasn't sure how to control where django looked for tables outside the `public` schema. 
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'OPTIONS': {
            'options': '-c search_path=race_scheudule,public'
        },
        'NAME': 'postgres',
        'USER': 'ptschoen',
        'PASSWORD': os.getenv('AZUREPOSTGRESPASS'),
        'HOST': 'pats-postgresql.postgres.database.azure.com',
        'PORT': '5432',
    }
}
```

## Djange User/Group Management Tables
Before any models were created, one can create the admin user/group tables useed by django ...
```
% cd rsproject
% python manage.py makemigrations
% python manage.py migrate
```
This installs django's user management tables in the **default** schema. Again, I didn't take the time to try and figure out how to define these tables in a `race_schedule` schema.

## Django Model creation from Existing Database
To reverse engineer the tables to model code ...
```
% cd racesched
% python manage.py inspectdb > models_temp.py
```

The resulting `models_temp.py` needed to have the order changed so the references to tables could be by object and not just a string.\
This is the same as the order of creating the tables in the ddl.sql file. The `managed = False` property was left as False to keep \
django from altering the database tables.\
Also how Foreign Key realtions should be dealt with on deletes needed to be defined. An example of a change ...
```
rider = models.ForeignKey('RaceScheduleRider', models.DO_NOTHING)
```
was changed to ...
```
rider = models.ForeignKey(RaceScheduleRider, on_delete=models.PROTECT)
```

## Django Schemas
Used the latest approach of creating from Django models, i.e. SchemaModel. Followed the format of a trailing `In` and `Out` on the schema classes to exclude primary key when creating. 

## Running the local Django server

First, do a one time creation of a super user ...
```
(.venv) pschoen@Patricks-MacBook-Pro rsproject % python manage.py createsuperuser
Username (leave blank to use 'pschoen'): 
Email address: pat.schoening@live.com
Password: 
Password (again): 
Superuser created successfully.
```

Starting the server ...
```
% python manage.py runserver
```
