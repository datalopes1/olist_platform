with sellers as (
    select * from {{ ref('stg__sellers') }}
),

geolocations as (
    select * from {{ ref('int__unique_zip_codes') }}
),

final as (
    select
        sellers.seller_id,
        sellers.zip_code_prefix,
        geolocations.uf,
        geolocations.cidade
    from sellers
    inner join geolocations on sellers.zip_code_prefix = geolocations.zip_code_prefix
)

select * from final