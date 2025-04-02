with is_rental as (
  select CAR_ID from CAR_RENTAL_COMPANY_RENTAL_HISTORY
  where START_DATE <= '2022-10-16' and END_DATE >= '2022-10-16'
)

select CAR_ID,
  case
    when CAR_ID in (select CAR_ID from is_rental) then '대여중'
    else '대여 가능'
  end as AVAILABILITY
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
group by CAR_ID
order by CAR_ID desc;