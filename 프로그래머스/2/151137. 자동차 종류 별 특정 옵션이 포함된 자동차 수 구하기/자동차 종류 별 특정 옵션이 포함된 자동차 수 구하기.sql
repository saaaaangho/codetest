with options as (
 select CAR_ID, CAR_TYPE from CAR_RENTAL_COMPANY_CAR
 where OPTIONS like '%통풍시트%'
    or OPTIONS like '%열선시트%'
    or OPTIONS like '%가죽시트%'
)

select CAR_TYPE, count(CAR_TYPE) as CARS from options
group by CAR_TYPE
order by CAR_TYPE