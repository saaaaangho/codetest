with sum_fe as (
  select sum(CODE) as FE from SKILLCODES
  where CATEGORY = 'Front End'
),

python as (
  select CODE as python from SKILLCODES
  where NAME = 'Python'
),

csharp as (
  select CODE as csharp from SKILLCODES
  where NAME = 'C#'
),

grade as (
  select ID, EMAIL,
         case
           when (SKILL_CODE & fe.FE <> 0) 
                and (SKILL_CODE & py.python <> 0) then 'A'
           when (SKILL_CODE & cs.csharp <> 0) then 'B'
           when (SKILL_CODE & fe.FE <> 0) then 'C'
           else null
         end as GRADE
  from DEVELOPERS
  cross join sum_fe fe
  cross join python py
  cross join csharp cs
)

select GRADE, ID, EMAIL from grade
where GRADE is not null
order by GRADE, ID