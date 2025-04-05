with car_type_filterd as (
  select CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS
  from CAR_RENTAL_COMPANY_CAR
  where CAR_TYPE in ('세단', 'SUV')
),

rental_filterd as (
  select rh.HISTORY_ID, rh.CAR_ID, rh.START_DATE, rh.END_DATE
  from CAR_RENTAL_COMPANY_RENTAL_HISTORY rh
  join car_type_filterd ctf on ctf.CAR_ID = rh.CAR_ID
  where rh.END_DATE >= '2022-11-01' and rh.START_DATE <= '2022-11-30'
),

discount_plan_filterd as (
  select PLAN_ID, CAR_TYPE, DURATION_TYPE, DISCOUNT_RATE
  from CAR_RENTAL_COMPANY_DISCOUNT_PLAN
  where DURATION_TYPE = '30일 이상'
)

select ctf.CAR_ID, ctf.CAR_TYPE, FLOOR(ctf.DAILY_FEE * (1 - dpf.DISCOUNT_RATE / 100) * 30) AS FEE
from car_type_filterd ctf
join discount_plan_filterd dpf on dpf.CAR_TYPE = ctf.CAR_TYPE
where ctf.CAR_ID NOT IN (SELECT CAR_ID FROM rental_filterd)
  and FLOOR(ctf.DAILY_FEE * (1 - dpf.DISCOUNT_RATE / 100) * 30) between 500000 and 1999999
order by (ctf.DAILY_FEE*dpf.DISCOUNT_RATE)*30 desc, ctf.CAR_TYPE asc, ctf.CAR_ID desc;
       # case when cc.CAR_TYPE = '세단' then (cc.DAILY_FEE*dpf.DISCOUNT_RATE)*30
       #      when cc.CAR_TYPE = 'SUV' then (cc.DAILY_FEE*dpf.DISCOUNT_RATE)*30


  