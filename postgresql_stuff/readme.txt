## Docker and PostgreSql

*I didn't use this for the last deployment. Refer to the above Azure for PostgreSql notes in the `..README.md` file.*

docker cheatsheet
  https://zhubicen.github.io/posts/docker-cheet-sheet/

starting docker for postgres
  > docker run --name race_scheduler -e POSTGRES_PASSWORD=foobar -p 5432:5432 -d postgres

opend a shell within docker ...
  > docker exec -it race_scheduler bash
  # su postgres

then start the database ...
  $ pg_ctl start -D /var/lib/postgresql/data -l /var/lib/postgresql/logfile

to stop the database ...
  $ pg_ctl stop -D /var/lib/postgresql/data

Using docker compose ...
  docker compose -f C:\Users\patsc\projects\race-scheduler\postgresql_stuff\postgres.yaml up

default port is 5432

$ psql -U postgres
Password is "foobar"

\d shows tables and sequences

\i <filename> to execute file

---- SPARK

pyspark shell
  > docker run --rm --name spark -p 4040:4040 -it spark:python3 /opt/spark/bin/pyspark

This all doesn't seem to work ...
  Create docker container from image spark:python3 (Not sure about this) ...
    > docker run --name spark1 -d spark:python3 /opt/spark/bin/pyspark
   pyspark(if container is already running, though not sure how to keep it running IDK) ...
    > docker exec -it spark /opt/spark/bin/pyspark