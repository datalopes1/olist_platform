
  create view "olist_db"."dev_stg"."stg__customers__dbt_tmp"
    
    
  as (
    with source as (
    select * from "olist_db"."raw"."customers"
),

final as (
    select
        customer_id,
        customer_unique_id,
        customer_zip_code_prefix as zip_code_prefix
    from source
)

select * from final
  );