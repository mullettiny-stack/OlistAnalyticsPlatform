with products as (

    select *
    from FINALPROJECT1.RAW.int_order_products

)

select
    product_id,
    product_category_name,
    count(distinct order_id) as order_count,
    sum(price) as total_sales,
    sum(freight_value) as total_freight

from products

group by
    product_id,
    product_category_name

order by order_count desc