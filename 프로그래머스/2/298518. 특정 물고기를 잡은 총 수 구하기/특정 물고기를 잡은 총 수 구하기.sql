select count(*) as FISH_COUNT from FISH_INFO as fi
join FISH_NAME_INFO as fn on fi.FISH_TYPE = fn.FISH_TYPE
where fn.FISH_NAME in ('BASS', 'SNAPPER')