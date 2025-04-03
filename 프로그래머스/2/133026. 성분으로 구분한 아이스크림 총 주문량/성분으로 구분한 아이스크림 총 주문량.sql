select ii.INGREDIENT_TYPE, sum(fh.TOTAL_ORDER) as TOTAL_ORDER
from FIRST_HALF as fh
join ICECREAM_INFO ii on ii.FLAVOR = fh.FLAVOR
group by ii.INGREDIENT_TYPE
order by sum(fh.TOTAL_ORDER)