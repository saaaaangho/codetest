with type_filterd as (
  select * from CAR_RENTAL_COMPANY_CAR
  where CAR_TYPE = '세단'
)

select distinct tf.CAR_ID
from type_filterd tf
join CAR_RENTAL_COMPANY_RENTAL_HISTORY rh on tf.CAR_ID = rh.CAR_ID
where rh.START_DATE between '2022-10-01' and '2022-10-31'
order by tf.CAR_ID desc