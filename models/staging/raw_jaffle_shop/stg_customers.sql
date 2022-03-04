with source as (
    select
        id as customer_id,
        first_name,
        last_name
    from {{ source('raw_jaffle_shop', 'customers') }}
)

select * from source
