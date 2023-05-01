{% docs dbt_profiler__stg_customers  %}
| column_name | data_type | row_count | not_null_proportion | distinct_proportion | distinct_count | is_unique | min | max |  avg | std_dev_population |     std_dev_sample | profiled_at                   |
| ----------- | --------- | --------- | ------------------- | ------------------- | -------------- | --------- | --- | --- | ---- | ------------------ | ------------------ | ----------------------------- |
| id          | number    |       100 |                   1 |                1.00 |            100 |      True | 1   | 100 | 50.5 |  28.86607004772212 | 29.011491981626865 | 2023-03-22 13:42:40.660 -0700 |
| first_name  | text      |       100 |                   1 |                0.79 |             79 |     False |     |     |      |                    |                    | 2023-03-22 13:42:40.660 -0700 |
| last_name   | text      |       100 |                   1 |                0.19 |             19 |     False |     |     |      |                    |                    | 2023-03-22 13:42:40.660 -0700 |
{% enddocs %}