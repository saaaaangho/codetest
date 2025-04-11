with max_filterd as (
  select max(VIEWS) as VIEWS from USED_GOODS_BOARD
),

board as (
  select BOARD_ID from USED_GOODS_BOARD
  where VIEWS = (select VIEWS from max_filterd)
)

select
concat('/home/grep/src/', f.BOARD_ID, '/', f.FILE_ID, f.FILE_NAME, f.FILE_EXT) 
as FILE_PATH
from USED_GOODS_FILE f
join board b on f.BOARD_ID = b.BOARD_ID
order by f.FILE_ID desc;

