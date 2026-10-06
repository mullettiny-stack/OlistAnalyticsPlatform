select
    product_category_name,
    product_category_name_english

from {{source('ecom', 'product_category_name_translation')}}