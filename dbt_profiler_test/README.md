Welcome to the `dbt-profiler-test` project!

### Run the commands in the following order

First we should seed some data for profiling.

> **Note**: Seed process will also create the staging schema and raw_customers entity in the staging schema. This entity is what will be referred in the `stg_customers` model. So considering this dependency, you cannot directly start running the models using the `dbt run` command.

```
dbt seed
```

Following command should run the models in the target database and schema. Once the command succeeds, you should see 2 views created in the staging schema. 
```
dbt run
```

The reason why the views will be created in your staging schema and not the tables due to the materialization settings in the [dbt_profile.yml](dbt_project.yml) file.

You can also run `dbt test` but that's not the intent of this project.

We can now generate the docs for our project based on this sample data we seeded. Please follow the instructions in [this](https://github.com/data-mie/dbt-profiler) project. Please note that if you query the view `stg_customers_profile`, it should already get you the profiling information for your table.




### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
