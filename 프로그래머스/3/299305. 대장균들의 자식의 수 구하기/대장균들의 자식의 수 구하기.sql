with child_count as (
  select PARENT_ID, COUNT(*) as CHILD_COUNT
  from ECOLI_DATA
  where PARENT_ID is not null
  group by PARENT_ID
)

select e.ID, coalesce(c.CHILD_COUNT, 0) as CHILD_COUNT from ECOLI_DATA e
left join child_count c on e.ID = c.PARENT_ID
order by e.ID

