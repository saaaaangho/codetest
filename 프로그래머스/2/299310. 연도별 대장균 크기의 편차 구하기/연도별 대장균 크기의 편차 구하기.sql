with max_size as (
  select year(DIFFERENTIATION_DATE) as YEAR,
         max(SIZE_OF_COLONY) as SIZE_OF_COLONY
  from ECOLI_DATA
  group by year(DIFFERENTIATION_DATE)
)

select year(ed.DIFFERENTIATION_DATE) as YEAR,
       (m.SIZE_OF_COLONY - ed.SIZE_OF_COLONY) as YEAR_DEV,
       ed.ID
from ECOLI_DATA ed
join max_size m on m.YEAR = year(ed.DIFFERENTIATION_DATE)
order by YEAR, YEAR_DEV