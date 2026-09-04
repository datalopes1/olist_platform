with  __dbt__cte__int__unique_zip_codes as (
with source as (
    select
        zip_code_prefix,
        max(uf) as uf,
        max(cidade) as cidade
    from dev_stg.stg__geolocations
    group by
        zip_code_prefix
)

select * from source
), customers as (
    select * from "olist_db"."dev_stg"."stg__customers"
),

geolocations as (
    select * from __dbt__cte__int__unique_zip_codes
),

final as (
    select
        customers.customer_id,
        customers.customer_unique_id,
        customers.zip_code_prefix,
        geolocations.uf,
        geolocations.cidade
    from customers
    left join geolocations on customers.zip_code_prefix = geolocations.zip_code_prefix
)

select * from final