with frontend as (
  select sum(CODE) as frontend from SKILLCODES
  where CATEGORY = 'Front End'
)

select d.ID, d.EMAIL, d.FIRST_NAME, d.LAST_NAME
from DEVELOPERS d 
cross join frontend fe
where fe.frontend & d.SKILL_CODE <> 0
order by d.ID