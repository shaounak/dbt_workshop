{% snapshot customers %}

{{
    config(
      target_database='postgres',
      target_schema='dwh_cust_n_affl',
      unique_key='id',
      strategy='check',
      check_cols=['first_name', 'last_name'],
    )
}}

select * from {{ source('int_cust_n_affl', 'int_customers') }}

{% endsnapshot %}