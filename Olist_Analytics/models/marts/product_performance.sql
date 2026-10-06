with products as (

    select *
    from {{ ref('int_order_products') }}

)

select
    product_category_name,
    product_category_name_english,
    count(distinct order_id) as order_count,
    sum(price) as total_sales,
    sum(freight_value) as total_freight

from products

group by
    product_category_name,
    product_category_name_english


order by order_count desc

