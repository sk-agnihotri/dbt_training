with source as (
        select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from {{ source('raw_jaffle_shop', 'orders') }}
)

select * from source