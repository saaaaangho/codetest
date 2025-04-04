with grade as (
  select EMP_NO,
    case when avg(SCORE) >= 96 then 'S'
         when avg(SCORE) >= 90 then 'A'
         when avg(SCORE) >= 80 then 'B'
         else 'C'
    end as GRADE
  from HR_GRADE
  group by EMP_NO
),

bonus as (
  select he.EMP_NO as EMP_NO, he.EMP_NAME as EMP_NAME,
    case when g.GRADE = 'S' then floor(he.SAL*0.2)
         when g.GRADE = 'A' then floor(he.SAL*0.15)
         when g.GRADE = 'B' then floor(he.SAL*0.1)
         else 0
    end as bonus
  from HR_EMPLOYEES he
  join grade g on g.EMP_NO = he.EMP_NO
)

select h.EMP_NO, h.EMP_NAME, g.GRADE, b.bonus as BONUS
from HR_EMPLOYEES h
join grade g on g.EMP_NO = h.EMP_NO
join bonus b on b.EMP_NO = h.EMP_NO
order by h.EMP_NO