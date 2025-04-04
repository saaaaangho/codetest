select hd.DEPT_ID, hd.DEPT_NAME_EN, round(avg(he.SAL), 0) as AVG_SAL  
from HR_DEPARTMENT hd
join HR_EMPLOYEES he on he.DEPT_ID = hd.DEPT_ID
group by hd.DEPT_ID
order by round(avg(he.SAL), 1) desc