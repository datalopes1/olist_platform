with source as (
    select * from "olist_db"."raw"."sellers"
),

final as (
    select
        seller_id,
        seller_zip_code_prefix as zip_code_prefix
    from source
)

select * from final