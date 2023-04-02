-- attempt #1

with ranked_songs as (
select artist_id, songs.song_id from songs
inner join global_song_rank
on songs.song_id = global_song_rank.song_id
), ranked_artists as (
select artist_name, count(song_id) as ranked_no from artists 
inner join ranked_songs
on artists.artist_id = ranked_songs.artist_id
group by artist_name
)

select artist_name, dense_rank() over(order by ranked_no desc) as artist_rank
from ranked_artists;

-- attempt #2 (place in ranking must be <=10 and only top 5 artists)
with ranked_songs as (
select artist_id, count(songs.song_id) as ranked_no from songs
inner join global_song_rank
on songs.song_id = global_song_rank.song_id
where global_song_rank.rank <= 10
group by artist_id
), ranked_artists as (
select artist_name, dense_rank() over(order by ranked_no desc) as artist_rank from artists 
inner join ranked_songs
on artists.artist_id = ranked_songs.artist_id
)
select * from ranked_artists 
where artist_rank <= 5;

-- attempt #3 (they secretly wanted the artists ranked alphabetically)
with ranked_songs as (
select artist_id, count(songs.song_id) as ranked_no from songs
inner join global_song_rank
on songs.song_id = global_song_rank.song_id
where global_song_rank.rank <= 10
group by artist_id
), ranked_artists as (
select artist_name, dense_rank() over(order by ranked_no desc) as artist_rank from artists 
inner join ranked_songs
on artists.artist_id = ranked_songs.artist_id
)
select * from ranked_artists 
where artist_rank <= 5
order by artist_rank asc, artist_name asc;
