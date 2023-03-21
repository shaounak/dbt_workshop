# dbt_workshop
Contains the sample projects using dbt

# Setup
Using `pipenv` install `dbt-core`. Alongwith `dbt-core` you might need to install the adapter for database or the data warehouse you want to play with. We'll use docker to get the postgres image and use it as a database.

## Update the source repositories and install pwgen
```bash
sudo apt-get update
sudo apt-get install pwgen
```
## Create the password for the postgres database
```bash
export PGPASSWORD=$(pwgen -1)
echo 'export PGPASSWORD=${PGPASSWORD}' >> ~/.bashrc
echo 'export PGPASSWORD=${PGPASSWORD}' >> ~/.profile
```
## Install `dbt-core` and `dbt-postgres`
```bash
pipenv install dbt-core
pipenv install dbt-postgres
```

## Pull the docker image for the postgres database and start the container
```bash
docker pull postgres
docker run -it -d -e POSTGRES_PASSWORD=${PGPASSWORD} -p 5432:5432 --name messy_range postgres:latest
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

## Setting up the `profiles.yml` for our postgres connetion

We can setup the connection details to our database in the profile.yml file which we can create in our projects directory or we can use one in the `~/.dbt` directory. For the simplified use case as ours we will use the one in the `~/.dbt` directory.

```
code ~/.dbt/profiles.yml
```

>**Note**: You need to make sure that port `5432` is exposed to the server port `5432` for the next set of steps when you start the postgres docker container. Second, you must also make sure that you initialize the your pipenv environment using the `pipenv shell` command or you might have to run the next set of steps using the `pipenv run <command>`.

## Testing the dbt connection using `dbt debug`
Execute the following command on the terminal. If you see the output as `All checks passed!`, that means the settings in the connection profile in the home directory or your project directory worked.

```bash
dbt debug
```


