#2022-04-13
#not canceled
#cs
with date_apnt_filterd as (
  select * from APPOINTMENT
  where date_format(APNT_YMD, '%Y-%m-%d') = '2022-04-13'
    and APNT_CNCL_YN = 'N'
    and MCDP_CD = 'CS'
)

select daf.APNT_NO, p.PT_NAME, p.PT_NO, daf.MCDP_CD,
       d.DR_NAME, daf.APNT_YMD
from date_apnt_filterd daf
join PATIENT p on p.PT_NO = daf.pt_NO
left join DOCTOR d on d.DR_ID = daf.MDDR_ID
order by daf.APNT_YMD