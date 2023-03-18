# dbt_workshop
Contains the sample projects using dbt

# Setup
Using `pipenv` install `dbt-core`. Alongwith `dbt-core` you might need to install the adapter for database or the data warehouse you want to play with. We'll use docker to get the postgres image and use it as a database.

```bash
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

> **_NOTE:_**  In case you get an error that `The container name is already in use by container "<Id>"`, then you might have the remove the existing container using the command `docker rm messy_range` or choose a different container name when executing the docker run command. If the container is stopped you can simply execute `docker restart messy_range`.

> **_NOTE:_** You are not required to keep the same container that is `messy_range` for your container. You can choose another container name of your choice.

# Creating a new project

We will now create a new project using the `dbt init` command. Execute the same on the command line and provide the project name. The first project which we are going to create is `dbt_profiler_test`. Once the project is created you should be able to see a directory created with the project name.

```
cd dbt_profiler_test
```

## Installing dependencies

```
code packages.yml
```

Follow the [instructions](https://hub.getdbt.com/data-mie/dbt_profiler/latest/) to install the dependency for installing the `dbt_profiler`.

Once you execute the `dbt deps` command, you should be able to see the directory for `dbt_packages` created in the project folder.

