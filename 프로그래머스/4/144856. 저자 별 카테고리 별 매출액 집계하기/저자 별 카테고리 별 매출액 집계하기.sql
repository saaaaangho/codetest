with filterd as (
  select BOOK_ID, SALES_DATE, SALES
  from BOOK_SALES
  where year(SALES_DATE) = 2022 and month(SALES_DATE) = 1
),

total_price as (
  select f.BOOK_ID,
         b.CATEGORY as CATEGORY, 
         b.AUTHOR_ID as AUTHOR_ID,
         sum(f.SALES * b.PRICE) as TOTAL_PRICE
  from BOOK as b
  join filterd f on f.BOOK_ID = b.BOOK_ID
  group by b.AUTHOR_ID, b.CATEGORY
)

select t.AUTHOR_ID, a.AUTHOR_NAME, t.CATEGORY, t.TOTAL_PRICE as TOTAL_SALES
from total_price as t
join AUTHOR as a on a.AUTHOR_ID = t.AUTHOR_ID
order by t.AUTHOR_ID asc, t.CATEGORY desc;

