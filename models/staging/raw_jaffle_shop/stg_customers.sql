with source as (
    select
        id as customer_id,
        first_name,
        last_name
    from raw_jaffle_shop.customers
)

select * from source
