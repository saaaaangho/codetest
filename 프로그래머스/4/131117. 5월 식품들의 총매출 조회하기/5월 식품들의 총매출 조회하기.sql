with date_filterd as (
  select ORDER_ID, PRODUCT_ID, AMOUNT, PRODUCE_DATE
  from FOOD_ORDER
  where PRODUCE_DATE between '2022-05-01' and '2022-05-31'
)

select fp.PRODUCT_ID, fp.PRODUCT_NAME, sum((fp.PRICE*df.AMOUNT)) as TOTAL_SALES
from FOOD_PRODUCT fp
join date_filterd df on df.PRODUCT_ID = fp.PRODUCT_ID
group by df.PRODUCT_ID
order by TOTAL_SALES desc, fp.PRODUCT_ID asc;