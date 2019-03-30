##genres(id,movie_id, genre_id)
##get avg and max number of genres for movies in each genre has

SELECT genre_id, AVG(genre_count) AS avg_num_of_genre, MAX(genre_count) AS max_num_of_genre
FROM (SELECT A.movie_id, a.genre_id, COUNT(b.genre_id) AS genre_count
FROM genres_movies a INNER JOIN genres_movies b ON (a.movie_id = b.movie_id)
GROUP BY a.movie_id, a.genre_id) C
GROUP BY genre_id
ORDER BY avg_num_of_genre DESC
