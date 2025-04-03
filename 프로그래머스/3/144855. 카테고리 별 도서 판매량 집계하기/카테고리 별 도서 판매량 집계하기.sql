with filterd as (
  select BOOK_ID, SALES_DATE, SALES from BOOK_SALES
  where SALES_DATE between '2022-01-01' and '2022-01-31'
)

select b.CATEGORY, sum(f.SALES) as TOTAL_SALES
from BOOK as b
join filterd f on f.BOOK_ID = b.BOOK_ID
group by b.CATEGORY
order by b.CATEGORY