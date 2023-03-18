# dbt_workshop
Contains the sample projects using dbt

# Setup
Using `pipenv` install `dbt-core`. Alongwith `dbt-core` you might need to install the adapter for database or the data warehouse you want to play with. We'll use docker to get the postgres image and use it as a database.

```
sudo apt-get update
sudo apt-get install pwgen
export PGPASSWORD=$(pwgen -1)
echo 'export PGPASSWORD=${PGPASSWORD}' >> ~/.bashrc
echo 'export PGPASSWORD=${PGPASSWORD}' >> ~/.profile
pipenv install dbt-core
pipenv install dbt-postgres
docker pull postgres
docker run -it -d -e POSTGRES_PASSWORD=${PGPASSWORD} --name messy_range postgres:latest
```

> **_NOTE:_**  In case you get an error that the container name is already in use by container <Id>, then you might have the remove the existing conatiner or choose a different container name. If the container is stopped you can simply execute `docker restart messy_range`.

> **_NOTE:_** You are not required to keep the same container that is `messy_range` for your container. You can choose another container name of your choice.