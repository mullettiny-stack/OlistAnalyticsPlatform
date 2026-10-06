with customers as (

    select *
    from FINALPROJECT1.RAW.stg_customers

)

select
    customer_city,
    customer_state,
    count(distinct customer_id) as customer_count

from customers

group by
    customer_city,
    customer_state

order by customer_count desc