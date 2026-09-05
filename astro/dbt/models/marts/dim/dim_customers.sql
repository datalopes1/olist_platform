with customers as (
    select * from {{ ref('stg__customers') }}
),

geolocations as (
    select * from {{ ref('int__unique_zip_codes') }}
),

final as (
    select
        customers.customer_id,
        customers.customer_unique_id,
        customers.zip_code_prefix,
        geolocations.uf,
        geolocations.cidade
    from customers
    left join geolocations on customers.zip_code_prefix = geolocations.zip_code_prefix
)

select * from final
