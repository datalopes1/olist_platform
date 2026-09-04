
  create view "olist_db"."dev_stg"."stg__order_items__dbt_tmp"
    
    
  as (
    with source as (
    select * from "olist_db"."raw"."order_items"
),

final as (
    select
        order_id,
        product_id,
        seller_id,
        order_item_id as order_item,
        price,
        freight_value
    from source
)

select * from final
  );