
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    
    
    



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
) select zip_code_prefix
from __dbt__cte__int__unique_zip_codes
where zip_code_prefix is null



    
  
    
    ) dbt_internal_test