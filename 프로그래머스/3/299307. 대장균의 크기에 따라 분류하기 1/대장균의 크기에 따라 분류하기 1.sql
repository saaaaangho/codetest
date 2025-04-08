select ID,
       case when SIZE_OF_COLONY > 1000 then 'HIGH'
            when SIZE_OF_COLONY > 100 then 'MEDIUM'
            when SIZE_OF_COLONY <= 100 then 'LOW'
       end as SIZE
from ECOLI_DATA
order by ID