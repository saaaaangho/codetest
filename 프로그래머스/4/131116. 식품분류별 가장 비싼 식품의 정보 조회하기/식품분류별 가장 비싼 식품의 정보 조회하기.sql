with filterd as(
 select CATEGORY, PRICE, PRODUCT_NAME from FOOD_PRODUCT
 where CATEGORY in ('과자', '국', '김치', '식용유')
),

find_max as (
 select f.CATEGORY as CATEGORY,
        max(f.PRICE) as PRICE
 from filterd as f
 group by f.CATEGORY
)

select f.CATEGORY, f.PRICE, f.PRODUCT_NAME from filterd as f
join find_max fm on f.CATEGORY = fm.CATEGORY and f.PRICE = fm.PRICE
order by fm.PRICE desc