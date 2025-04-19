with filterd as (
  select CART_ID from CART_PRODUCTS
  where NAME in ('Milk')
  group by CART_ID
)

select cp.CART_ID from CART_PRODUCTS cp
join filterd f on f.CART_ID = cp.CART_ID
where cp.NAME in ('Yogurt')
group by cp.CART_ID
