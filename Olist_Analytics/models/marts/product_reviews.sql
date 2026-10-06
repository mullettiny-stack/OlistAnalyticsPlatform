with product_reviews as (

    select *
    from {{ ref('int_product_reviews') }}

)

select
    product_category_name,
    product_category_name_english,
    customer_city,
    customer_state,
    avg(review_score) as average_review_score,
    count(distinct review_id) as review_count,
    sum(price) as total_product_value,
    sum(freight_value) as total_freight_value,
    avg(freight_value) as average_freight_value

from product_reviews

group by
    product_category_name,
    product_category_name_english,
    customer_city,
    customer_state

order by average_review_score desc