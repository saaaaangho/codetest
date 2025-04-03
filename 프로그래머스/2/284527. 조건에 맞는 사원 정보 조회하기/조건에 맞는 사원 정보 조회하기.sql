with grade_sum as (
 select EMP_NO, sum(SCORE) as SUM_SCORE
 from HR_GRADE
 where YEAR = 2022
 group by EMP_NO
), 

max_score as(
  select max(SUM_SCORE) as MAX_SCORE
  from grade_sum
)

select g.SUM_SCORE as SCORE,
       e.EMP_NO,
       e.EMP_NAME,
       e.POSITION,
       e.EMAIL
from grade_sum as g
join HR_EMPLOYEES e on g.EMP_NO = e.EMP_NO
join max_score m on g.SUM_SCORE = m.MAX_SCORE

       
       
