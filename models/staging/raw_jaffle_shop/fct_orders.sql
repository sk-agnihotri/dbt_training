with payemts as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

success_order_amount as (
    select order_id,
        sum(case when status = 'success' then amount end) as amount
    from payemts

    group by 1
),

source as (
    select orders.order_id,
       orders.customer_id,
       orders.order_date,
       coalesce(success_order_amount.amount,0) amount
    from orders
    left join success_order_amount using (order_id)

)

select * from source