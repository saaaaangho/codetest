select b.BOOK_ID, a.AUTHOR_NAME, DATE_FORMAT(b.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
from BOOK b
join AUTHOR a on a.AUTHOR_ID = b.AUTHOR_ID
where b.CATEGORY = '경제'
order by PUBLISHED_DATE