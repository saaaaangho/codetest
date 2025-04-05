select fh.FLAVOR from FIRST_HALF fh
join JULY j on j.FLAVOR = fh.FLAVOR
group by fh.FLAVOR
order by sum(j.TOTAL_ORDER + fh.TOTAL_ORDER) desc limit 3