
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    
    
    



select order_item
from "olist_db"."dev_stg"."stg__order_items"
where order_item is null



    
  
    
    ) dbt_internal_test