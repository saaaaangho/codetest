with count_review as (
  select MEMBER_ID, count(*) as CNT
  from REST_REVIEW
  group by MEMBER_ID
),

top_review as (
  select MEMBER_ID from count_review
  where CNT = (select max(CNT) from count_review)
)

select mp.MEMBER_NAME, rr.REVIEW_TEXT, date_format(rr.REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
from REST_REVIEW rr
join MEMBER_PROFILE mp on mp.MEMBER_ID = rr.MEMBER_ID
where rr.MEMBER_ID in (select MEMBER_ID from top_review)
order by rr.REVIEW_DATE asc, rr.REVIEW_TEXT asc;