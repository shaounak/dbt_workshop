
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
{% set table_exists_idl = load_relation(ref('raw_customers_idl')) is not none %}
{% set table_exists_delta = load_relation(ref('raw_customers_delta')) is not none %}

{{ config(materialized='table', schema="int_cust_n_affl") }}

with source_data as (

{%- if table_exists_idl -%}
    {{ log("IDL table exists, creating the model using the IDL table", info=True) }}

    select * from {{ref('raw_customers_idl')}}

{%- elif table_exists_delta -%}
    {{ log("Only the delta table exists, creating the model using the delta table", info=True) }}

    select * from {{ref('raw_customers_delta')}}
    
{%- endif -%}
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
