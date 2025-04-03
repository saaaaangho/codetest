# select year(os.SALES_DATE) as YEAR,
#        month(os.SALES_DATE) as MONTH,
#        ui.GENDER as GENDER,
#        count(os.USER_ID) as USERS
# from ONLINE_SALE as os
# join USER_INFO ui on ui.USER_ID = os.USER_ID
# where ui.GENDER is not null
# group by year(os.SALES_DATE), month(os.SALES_DATE), ui.GENDER
# order by os.SALES_DATE
with filterd as (
  select year(os.SALES_DATE) as YEAR,
         month(os.SALES_DATE) as MONTH,
         ui.GENDER,
         os.USER_ID
  from ONLINE_SALE as os
  join USER_INFO ui on ui.USER_ID = os.USER_ID
  where ui.GENDER is not null
),

distinct_query as (
  select distinct YEAR, MONTH, GENDER, USER_ID
  from filterd
)

select YEAR, MONTH, GENDER, count(USER_ID) as USERS
from distinct_query
group by YEAR, MONTH, GENDER
order by YEAR, MONTH, GENDER