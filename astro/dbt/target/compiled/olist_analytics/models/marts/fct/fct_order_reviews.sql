with source as (
    select * from "olist_db"."dev_stg"."stg__order_reviews"
),

final as (
    select 
        review_id,
        order_id,
        review_dt,
        review_score
    from source
)

select * from final