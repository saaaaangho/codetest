with filterd as (
    select ID, NAME, HOST_ID from PLACES
    group by HOST_ID
    having count(HOST_ID) >= 2
)

select p.ID, p.NAME, p.HOST_ID from PLACES p
join filterd f on f.HOST_ID = p.HOST_ID
order by p.ID
