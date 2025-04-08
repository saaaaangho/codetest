with first_filterd as (
 select child.ID from ECOLI_DATA child
 join ECOLI_DATA parent on parent.ID = child.PARENT_ID
 where parent.PARENT_ID is null
),

second_filterd as (
  select ed.ID from ECOLI_DATA ed
  join first_filterd ff on ff.ID = ed.PARENT_ID
)

select ID from second_filterd
order by ID


