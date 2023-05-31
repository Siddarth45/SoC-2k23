/*ques 1)
create table if not exists combined1 as select userId,movies.movieId,title,rating,genres from movies 
inner join ratings on movies.movieId=ratings.movieId;
create table if not exists combined2 as select tags.userId,tags.movieId,tag,rating from tags 
inner join ratings on tags.movieId=ratings.movieId;
select distinct title from combined1 where genres='Drama'
AND rating >=(select MAX(rating) from combined2 where tag='Quentin Tarantino');*/

/*ques 2)
select userId from combined1 where genres='Comedy'and movieId<=3;*/

/*ques 3)
SELECT ratings_master.rating, COUNT(combined1.rating) AS user_count
FROM generate_series(0.0, 5.0, 0.5) AS ratings_master(rating)
LEFT JOIN combined1 ON ratings_master.rating = combined1.rating
AND combined1.title = 'City Hall (1996)'
GROUP BY ratings_master.rating
ORDER BY ratings_master.rating;*/
--select rating,count(userId) from combined1 where title='City Hall (1996)' group by rating;
--the above code was not enough to show are rating levels along with their number including 0

/*ques 4)
SELECT movieid, title, unnest(string_to_array(genres, '|')) AS unnested_genre
FROM movies;*/

/*ques 5-method 1:
create table if not exists normalized_movies AS
    SELECT movieId, title, unnest(string_to_array(genres, '|')) AS unnested_genre
    FROM movies;
SELECT unnested_genre, COUNT(DISTINCT movieId) AS movie_count
FROM normalized_movies
GROUP BY unnested_genre;

--method 2:
WITH normalized_movies AS (
  SELECT movieId, title, unnested_genre AS genre
  FROM (
    SELECT movieId, title, unnest(string_to_array(genres, '|')) AS unnested_genre
    FROM movies
  ) AS subquery
)
SELECT genre, COUNT(DISTINCT movieid) AS movie_count
FROM normalized_movies
GROUP BY genre;*/

/*ques 6)
--did this ques using normalized_movies data(the unnested one).

create table if not exists combined3 as select normalized_movies.movieId,title,rating,unnested_genre
from normalized_movies inner join ratings on normalized_movies.movieId=ratings.movieId;

select movieId,title from combined3 where unnested_genre='Children' and 
rating>(select avg(rating) from combined3 where unnested_genre='Comedy');*/




