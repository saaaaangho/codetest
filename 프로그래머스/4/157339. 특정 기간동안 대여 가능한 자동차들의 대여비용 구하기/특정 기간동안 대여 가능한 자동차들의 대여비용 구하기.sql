with car_filterd as (
  select * from CAR_RENTAL_COMPANY_CAR
  where CAR_TYPE in ('세단', 'SUV')
),

day_filterd as (
  select distinct rh.CAR_ID from CAR_RENTAL_COMPANY_RENTAL_HISTORY rh
  join car_filterd cf on cf.CAR_ID = rh.CAR_ID
  where not (rh.START_DATE > '2022-11-30' or rh.END_DATE < '2022-11-01')
)

select cf.CAR_ID, cf.CAR_TYPE,
       floor((1-dp.DISCOUNT_RATE/100) * (cf.DAILY_FEE*30)) as FEE
       from car_filterd cf
join CAR_RENTAL_COMPANY_DISCOUNT_PLAN dp on cf.CAR_TYPE = dp.CAR_TYPE and dp.DURATION_TYPE = '30일 이상'
where cf.CAR_ID not in (select CAR_ID from day_filterd)
  and floor((1-dp.DISCOUNT_RATE/100) * (cf.DAILY_FEE*30)) between 500000 and 2000000



