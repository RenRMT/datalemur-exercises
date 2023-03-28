-- attempt #1

select pages.page_id from pages
left outer join page_likes
on pages.page_id = page_likes.page_id
where page_likes.page_id is null
order by page_id asc;
