select count(fi.FISH_TYPE) as FISH_COUNT, fn.FISH_NAME as FISH_NAME from FISH_NAME_INFO as fn
join FISH_INFO as fi on fn.FISH_TYPE = fi.FISH_TYPE
group by fn.FISH_NAME
order by FISH_COUNT desc