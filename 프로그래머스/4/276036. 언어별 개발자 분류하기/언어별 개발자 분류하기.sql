
with grade as (
  select ID, EMAIL,
         case
           when (SKILL_CODE & (select sum(CODE) from SKILLCODES where CATEGORY = 'Front end')) <> 0 and (SKILL_CODE & 256) <> 0 then 'A'
           when (SKILL_CODE & 1024) <> 0 then 'B'
           when (SKILL_CODE & (select sum(CODE) from SKILLCODES where CATEGORY = 'Front end')) <> 0 then 'C'
           else null
         end as GRADE
         from DEVELOPERS
)

select GRADE, ID, EMAIL from grade
where GRADE is not null
order by GRADE, ID
