with source as (
    select * from "olist_db"."dev_stg"."stg__order_payments"
),

final as (
    select
        order_id,
        payment_type,
        payment_installments,
        payment_value
    from source
)

select * from final