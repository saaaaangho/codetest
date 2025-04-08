with year_filterd as (
  select * from USER_INFO
  where year(JOINED) = '2021'
),

buy_filterd as (
  select distinct year(os.SALES_DATE) as YEAR,
                  month(os.SALES_DATE) as MONTH,
                  os.USER_ID
  from ONLINE_SALE os
  where os.USER_ID in (select USER_ID from year_filterd)
),

total_user as (
  select count(*) as TOTAL from year_filterd
)

select bf.YEAR,
       bf.MONTH,
       count(distinct bf.USER_ID) as PURCHASED_USERS,
       round(count(distinct bf.USER_ID) / tu.TOTAL, 1) as PURCHASED_RATIO
from buy_filterd bf
cross join total_user tu
group by bf.YEAR, bf.MONTH, tu.TOTAL
order by bf.YEAR, bf.MONTH