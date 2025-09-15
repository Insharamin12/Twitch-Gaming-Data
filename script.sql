-- Get a feel for the stream table
FROM stream
LIMIT 20;

-- Get a feel for the chat table
FROM chat
LIMIT 20;

-- Find all unique games in the stream table
SELECT DISTINCT game
FROM stream;

-- Find all unique channels in the stream table
SELECT DISTINCT channel
FROM stream;

-- What are the most popular games?
-- Count the number of viewers per game
SELECT game, COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

-- Where are League of Legends viewers located?
-- Count the number of LoL viewers per country
SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY 1
ORDER BY 2 DESC;

-- How many viewers are using each player (platform/device)?
SELECT player, COUNT(*) AS "Total count"
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

-- Categorize games into genres using CASE
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

-- Preview the time column to understand its format (DATETIME: YYYY-MM-DD HH:MM:SS)
SELECT time
FROM stream
LIMIT 10;

-- Test the strftime() function by extracting seconds from the time column
SELECT time,
       strftime('%S', time)
FROM stream
GROUP BY 1
LIMIT 20;

-- Show how view count changes during the day (by hour)
-- Return the hour of the stream time and number of streams, only for US viewers
SELECT strftime('%H', time),
       COUNT(*)
FROM stream
WHERE country = 'US'
GROUP BY 1;

-- Join the stream and chat tables on device_id to combine user activity
SELECT *
FROM stream
JOIN chat
  ON stream.device_id = chat.device_id;

-- Viewership stats for favorite games
-- Replace the IN (...) list with your favorite games
SELECT game,
       COUNT(DISTINCT device_id) AS unique_viewers,
       COUNT(*) AS total_streams
FROM stream
WHERE game IN ('League of Legends', 'Dota 2')
GROUP BY game
ORDER BY unique_viewers DESC;

-- Chat activity stats for favorite games
SELECT game,
       COUNT(DISTINCT device_id) AS unique_chatters,
       COUNT(*) AS total_messages
FROM chat
WHERE game IN ('League of Legends', 'Dota 2')
GROUP BY game
ORDER BY total_messages DESC;

-- Compare viewership vs. chat activity (after joining both tables)
SELECT s.game,
       COUNT(DISTINCT s.device_id) AS viewers,
       COUNT(c.device_id) AS chat_messages,
       ROUND(1.0 * COUNT(c.device_id) / COUNT(DISTINCT s.device_id), 2) AS messages_per_viewer
FROM stream AS s
LEFT JOIN chat AS c
  ON s.device_id = c.device_id
WHERE s.game IN ('League of Legends', 'Dota 2')
GROUP BY s.game
ORDER BY messages_per_viewer DESC;

-- Engagement by country for favorite games
SELECT s.game,
       s.country,
       COUNT(DISTINCT s.device_id) AS viewers,
       COUNT(c.device_id) AS chat_messages,
       ROUND(1.0 * COUNT(c.device_id) / COUNT(DISTINCT s.device_id), 2) AS messages_per_viewer
FROM stream AS s
LEFT JOIN chat AS c
  ON s.device_id = c.device_id
WHERE s.game IN ('League of Legends', 'Dota 2')
GROUP BY s.game, s.country
HAVING viewers > 100    -- filter out small sample sizes
ORDER BY messages_per_viewer DESC;

-- Subscriber engagement in chat (only for streamers who are subscribers)
SELECT s.game,
       s.subscriber,
       COUNT(DISTINCT s.device_id) AS viewers,
       COUNT(c.device_id) AS chat_messages
FROM stream AS s
LEFT JOIN chat AS c
  ON s.device_id = c.device_id
WHERE s.game IN ('League of Legends', 'Dota 2')
GROUP BY s.game, s.subscriber
ORDER BY chat_messages DESC;
