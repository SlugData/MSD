-- -----------------------------------------------------
-- Some examples
-- -----------------------------------------------------

-- Find all users who listened to the song SOBONKR12A58A7A7E0,
-- sort by listening count in descending order
SELECT *
FROM kaggle_evaluation_triplets
WHERE song = 'SOBONKR12A58A7A7E0'
ORDER BY count DESC;

-- Find the song_id of all the songs that 
-- user 7d90be8dfdbde170f036ce8a4b915440137cb11c listened to
SELECT t.song, s.id AS song_id
FROM kaggle_evaluation_triplets t
  JOIN kaggle_songs s ON s.song = t.song
WHERE user = '7d90be8dfdbde170f036ce8a4b915440137cb11c';

-- Find the top 10 most popular song by play count
SELECT song, SUM(count) AS play_count
FROM kaggle_evaluation_triplets
GROUP BY song
ORDER BY play_count DESC
LIMIT 10;

-- Find the top 10 most popular song by user count
SELECT song, COUNT(DISTINCT user) AS user_count
FROM kaggle_evaluation_triplets
GROUP BY song
ORDER BY user_count DESC
LIMIT 10;
