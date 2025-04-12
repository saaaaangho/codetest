select case when month(DIFFERENTIATION_DATE) between 01 and 03 then '1Q'
            when month(DIFFERENTIATION_DATE) between 04 and 06 then '2Q'
            when month(DIFFERENTIATION_DATE) between 07 and 09 then '3Q'
            else '4Q'
       end as QUARTER,
       count(ID) as ECOLI_COUNT 
from ECOLI_DATA
group by QUARTER
order by QUARTER
