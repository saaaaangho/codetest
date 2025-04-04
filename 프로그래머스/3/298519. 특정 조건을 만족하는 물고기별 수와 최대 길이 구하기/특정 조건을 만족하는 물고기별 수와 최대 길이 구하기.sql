with ten as (
  select ID, FISH_TYPE,
         case when LENGTH > 10 then LENGTH
              else 10
         end as ten_LENGTH
  from FISH_INFO
),

average as (
  select count(ID) as FISH_COUNT, FISH_TYPE, avg(ten_LENGTH)
  from ten
  group by FISH_TYPE
  having avg(ten_LENGTH) >= 33
)

select a.FISH_COUNT, max(t.ten_LENGTH) as MAX_LENGTH, a.FISH_TYPE
from average a
join ten t on a.FISH_TYPE = t.FISH_TYPE
group by a.FISH_TYPE, a.FISH_COUNT
order by a.FISH_TYPE
