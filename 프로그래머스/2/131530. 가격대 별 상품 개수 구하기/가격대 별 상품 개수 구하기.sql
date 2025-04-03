with filterd as (
  select PRODUCT_ID, floor(PRICE / 10000) * 10000 as PRICE
    from PRODUCT
)

select f.PRICE as PRICE_GROUP, count(PRODUCT_ID) as PRODUCTS
from filterd f
group by f.PRICE
order by f.PRICE