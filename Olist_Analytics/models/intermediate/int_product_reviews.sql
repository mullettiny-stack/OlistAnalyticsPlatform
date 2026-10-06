with reviews as (

    select *
    from {{ ref('stg_order_reviews') }}

),

orders as (

    select *
    from {{ ref('stg_orders') }}

),

customers as (

    select *
    from {{ ref('stg_customers') }}

),

order_items as (

    select *
    from {{ ref('stg_order_items') }}

),

products as (

    select *
    from {{ ref('stg_products') }}

),

translation as (

    select *
    from {{ ref('stg_product_category_name_translation') }}

)

select
    reviews.review_id,
    reviews.order_id,
    order_items.product_id,
    translation.product_category_name_english,
    products.product_category_name,
    customers.customer_city,
    customers.customer_state,
    reviews.review_score,
    order_items.price,
    order_items.freight_value

from reviews

left join orders
    on reviews.order_id = orders.order_id

left join customers
    on orders.customer_id = customers.customer_id

left join order_items
    on reviews.order_id = order_items.order_id

left join products
    on order_items.product_id = products.product_id

left join translation
    on products.product_category_name = translation.product_category_name