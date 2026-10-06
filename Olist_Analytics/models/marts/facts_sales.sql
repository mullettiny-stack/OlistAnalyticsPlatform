with order_items as (
    select *
    from {{ ref('stg_order_items')}}
),

customers as (
    select * 
    from {{ ref('stg_customers')}}
),

orders as (
    select * 
    from {{ ref('stg_orders')}}
),

translation as (
    select *
    from {{ ref('stg_product_category_name_translation')}}
), 

products as (
    select * 
    from {{ ref('stg_products')}}
),

 joined as (
    
    select 
    products.product_category_name,
    products.product_name_lenght,
    products.product_description_lenght,
    products.product_photos_qty,
    products.product_weight_g,
    products.product_length_cm,
    products.product_height_cm,
    products.product_width_cm,
    orders.order_status,
    orders.order_purchase_timestamp,
    orders.order_approved_at,
    orders.order_delivered_carrier_date,
    orders.order_delivered_customer_date,
    orders.order_estimated_delivery_date,
    order_items.order_id,
    order_items.order_item_id,
    order_items.product_id,
    order_items.seller_id,
    order_items.shipping_limit_date,
    order_items.price,
    order_items.freight_value,
    customers.customer_id,
    customers.customer_unique_id,
    customers.customer_zip_code_prefix,
    customers.customer_city,
    customers.customer_state,
    translation.product_category_name_english

from order_items 

left join orders
    on order_items.order_id = orders.order_id

left join customers 
    on orders.customer_id = customers.customer_id

left join products
    on order_items.product_id = products.product_id

left join translation
    on products.product_category_name = translation.product_category_name

)
 select * from joined 