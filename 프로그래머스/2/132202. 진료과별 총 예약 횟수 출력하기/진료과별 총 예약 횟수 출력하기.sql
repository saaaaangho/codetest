with filterd as (
  select APNT_YMD, MCDP_CD from APPOINTMENT
  where year(APNT_YMD) = 2022 and month(APNT_YMD) = 5
)

select MCDP_CD as '진료과코드',
       count(APNT_YMD) as '5월예약건수'
from filterd
group by MCDP_CD
order by count(APNT_YMD), MCDP_CD