with source as (
    select * from "olist_db"."dev_stg"."stg__products"
),

final as (
    select
        product_id,
        product_category
    from source
)

select * from final