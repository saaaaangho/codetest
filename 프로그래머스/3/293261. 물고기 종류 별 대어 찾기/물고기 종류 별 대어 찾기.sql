with max_filterd as (
  select fi.FISH_TYPE, max(fi.LENGTH) as LENGTH
  from FISH_INFO fi
  group by fi.FISH_TYPE
),

name_matched as (
  select fn.FISH_NAME, mf.LENGTH, mf.FISH_TYPE
  from max_filterd mf
  join FISH_NAME_INFO fn on fn.FISH_TYPE = mf.FISH_TYPE
)

select fi.ID, nm.FISH_NAME, nm.LENGTH
from name_matched nm
join FISH_INFO fi on fi.FISH_TYPE = nm.FISH_TYPE
                  and fi.LENGTH = nm.LENGTH
order by fi.ID


