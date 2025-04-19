with filterd as (
  select child.ITEM_ID from ITEM_TREE child
  join ITEM_TREE parent on parent.PARENT_ITEM_ID = child.ITEM_ID
  group by child.ITEM_ID
)

select it.ITEM_ID, ii.ITEM_NAME, ii.RARITY
from ITEM_TREE it
join ITEM_INFO ii on ii.ITEM_ID = it.ITEM_ID
where it.ITEM_ID not in (select ITEM_ID from filterd)
order by it.ITEM_ID desc