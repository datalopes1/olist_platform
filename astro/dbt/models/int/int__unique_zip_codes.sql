with source as (
    select
        zip_code_prefix,
        max(uf) as uf,
        max(cidade) as cidade
    from {{ ref('stg__geolocations') }}
    group by
        zip_code_prefix
)

select * from source
