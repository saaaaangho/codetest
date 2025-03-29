select child.ITEM_ID, child.ITEM_NAME, child.RARITY from ITEM_INFO as parent
join ITEM_TREE as tree on parent.ITEM_ID = tree.PARENT_ITEM_ID
join ITEM_INFO as child on tree.ITEM_ID = child.ITEM_ID
where parent.RARITY = 'RARE'
order by child.ITEM_ID desc;