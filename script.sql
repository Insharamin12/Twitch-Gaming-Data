-- 1. Get a feel for the stream table: preview the first 20 rows
SELECT *
FROM stream
LIMIT 20;

-- 1. Get a feel for the chat table: preview the first 20 rows
SELECT *
FROM chat
LIMIT 20;

-- 2. Find all unique games in the stream table
SELECT DISTINCT game
FROM stream;

-- 3. Find all unique channels in the stream table
SELECT DISTINCT channel
FROM stream;

-- 4. What are the most popular games?
-- Count the number of viewers per game
SELECT game, COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

-- 5. Where are League of Legends viewers located?
-- Count the number of LoL viewers per country
SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY 1
ORDER BY 2 DESC;

-- 6. How many viewers are using each player (platform/device)?
SELECT player, COUNT(*) AS "Total count"
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

-- 7. Categorize games into genres using CASE
-- MOBA: Dota 2, League of Legends, Heroes of the Storm
-- FPS: Counter-Strike: Global Offensive
-- Survival: DayZ, ARK: Survival Evolved
-- Else: Other
SELECT game,
       CASE
           WHEN game = 'Dota 2' THEN 'MOBA'
           WHEN game = 'League of Legends' THEN 'MOBA'
           WHEN game = 'Heroes of the Storm' THEN 'MOBA'
           WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
           WHEN game = 'DayZ' THEN 'Survival'
           WHEN game = 'ARK: Survival Evolved' THEN 'Survival'
           ELSE 'Other'
       END AS genre,
       COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;

-- 8. Preview the time column to understand its format (DATETIME: YYYY-MM-DD HH:MM:SS)
SELECT time
FROM stream
LIMIT 10;

-- 9. Test the strftime() function by extracting seconds from the time column
SELECT time,
       strftime('%S', time)
FROM stream
GROUP BY 1
LIMIT 20;

-- 10. Show how view count changes during the day (by hour)
-- Return the hour of the stream time and number of streams, only for US viewers
SELECT strftime('%H', time),
       COUNT(*)
FROM stream
WHERE country = 'US'
GROUP BY 1;

-- 11. Join the stream and chat tables on device_id to combine user activity
SELECT *
FROM stream
JOIN chat
  ON stream.device_id = chat.device_id;