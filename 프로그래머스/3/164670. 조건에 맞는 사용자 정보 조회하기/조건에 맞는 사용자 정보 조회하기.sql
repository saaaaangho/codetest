with count_filterd as (
  select * from USED_GOODS_BOARD
  group by WRITER_ID
  having count(BOARD_ID) >= 3
)

select u.USER_ID, u.NICKNAME,
       concat(u.CITY, ' ', u.STREET_ADDRESS1, ' ', u.STREET_ADDRESS2) as '전체주소',
       concat(substring(u.TLNO, 1, 3), '-', substring(u.TLNO, 4, 4), '-', substring(u.TLNO, 8, 4)) as '전화번호'
  from USED_GOODS_USER u
  join count_filterd cf on u.USER_ID = cf.WRITER_ID
  order by u.USER_ID desc