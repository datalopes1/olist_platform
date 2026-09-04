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
), sellers as (
    select * from "olist_db"."dev_stg"."stg__sellers"
),

geolocations as (
    select * from __dbt__cte__int__unique_zip_codes
),

final as (
    select
        sellers.seller_id,
        sellers.zip_code_prefix,
        geolocations.uf,
        geolocations.cidade
    from sellers
    inner join geolocations on sellers.zip_code_prefix = geolocations.zip_code_prefix
)

select * from final