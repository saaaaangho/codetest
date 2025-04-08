with recursive gen_tree as (
  select ID, 1 AS GENERATION
  from ECOLI_DATA
  where PARENT_ID is null

  union all
    
  select ed.ID, gt.GENERATION + 1
  from ECOLI_DATA ed
  join gen_tree gt on gt.ID = ed.PARENT_ID
),

no_child as (
  select gt.ID, gt.GENERATION
  from gen_tree gt
  left join ECOLI_DATA ed on gt.ID = ed.PARENT_ID
  where ed.ID is null
)

select count(*) as COUNT, GENERATION from no_child
group by GENERATION
order by GENERATION
  