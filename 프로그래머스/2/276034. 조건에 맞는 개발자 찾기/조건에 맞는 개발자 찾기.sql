select d.ID, d.EMAIL, d.FIRST_NAME, d.LAST_NAME from DEVELOPERS as d
join SKILLCODES as s on d.SKILL_CODE & s.CODE <> 0
where s.NAME in ('Python', 'C#')
group by d.ID, d.EMAIL, d.FIRST_NAME, d.LAST_NAME
order by id