
    
    

with __dbt__cte__int__unique_zip_codes as (
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
) select
    zip_code_prefix as unique_field,
    count(*) as n_records

from __dbt__cte__int__unique_zip_codes
where zip_code_prefix is not null
group by zip_code_prefix
having count(*) > 1


