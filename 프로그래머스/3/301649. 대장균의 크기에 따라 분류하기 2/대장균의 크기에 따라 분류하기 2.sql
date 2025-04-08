with ranked as (
  select ID, SIZE_OF_COLONY,
         row_number() over (order by SIZE_OF_COLONY desc) as RN
  from ECOLI_DATA
),

total_count as (
  select count(*) as cnt from ECOLI_DATA
)

select r.ID,
       case when r.RN <= tc.cnt*0.25 then 'CRITICAL'
            when r.RN <= tc.cnt*0.50 then 'HIGH'
            when r.RN <= tc.cnt*0.75 then 'MEDIUM'
            else 'LOW'
       end as COLONY_NAME
from ranked r
cross join total_count tc
order by r.ID