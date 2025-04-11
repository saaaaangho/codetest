with truck as (
  select * from CAR_RENTAL_COMPANY_CAR
  where CAR_TYPE = '트럭'
),

date as (
  select rh.HISTORY_ID, rh.CAR_ID, (datediff(rh.END_DATE, rh.START_DATE) + 1) as diff, 
         case when (datediff(rh.END_DATE, rh.START_DATE) + 1) >= 90 then '90일 이상'
              when (datediff(rh.END_DATE, rh.START_DATE) + 1) >= 30 then '30일 이상'
              when (datediff(rh.END_DATE, rh.START_DATE) + 1) >= 7 then '7일 이상'
         end as DISCOUNT_GRADE
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY rh
    join truck t on rh.CAR_ID = t.CAR_ID
)

select d.HISTORY_ID,
       case when d.DISCOUNT_GRADE = '7일 이상' then floor((t.DAILY_FEE*(1-dp.DISCOUNT_RATE/100))*diff)
            when d.DISCOUNT_GRADE = '30일 이상' then floor((t.DAILY_FEE*(1-dp.DISCOUNT_RATE/100))*diff)
            when d.DISCOUNT_GRADE = '90일 이상' then floor((t.DAILY_FEE*(1-dp.DISCOUNT_RATE/100))*diff)
            else floor(t.DAILY_FEE*diff)
       end as FEE
from date d
join truck t on t.CAR_ID = d.CAR_ID
left join CAR_RENTAL_COMPANY_DISCOUNT_PLAN dp
  on dp.CAR_TYPE = '트럭' and dp.DURATION_TYPE = d.DISCOUNT_GRADE
order by FEE desc, d.HISTORY_ID desc