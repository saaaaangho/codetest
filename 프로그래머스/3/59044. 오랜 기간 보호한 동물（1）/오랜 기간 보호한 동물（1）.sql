with top3 as (
  select NAME, DATETIME from ANIMAL_INS
  where ANIMAL_ID not in (select ANIMAL_ID from ANIMAL_OUTS)
  order by DATETIME asc
  limit 3
)

select * from top3
order by DATETIME

