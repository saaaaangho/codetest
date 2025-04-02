with FILTERD as (
  select * from CAR_RENTAL_COMPANY_RENTAL_HISTORY as cartable
  where START_DATE between '2022-08-01' and '2022-10-31'
),

UPPER_5 as (
  select CAR_ID from FILTERD
  group by CAR_ID
  having COUNT(*) >= 5
)

select MONTH(START_DATE) as MONTH, CAR_ID, count(CAR_ID) as RECORDS from FILTERD
where CAR_ID in (select CAR_ID from UPPER_5)
group by MONTH(START_DATE), CAR_ID
order by MONTH asc, CAR_ID desc;