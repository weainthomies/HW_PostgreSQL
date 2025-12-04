-- Задание 2

SELECT name
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks);

SELECT name
FROM Tracks
WHERE duration >= 210;

SELECT name
FROM Collections
WHERE year BETWEEN 2018 AND 2020;

SELECT pseudonym
FROM Performers
WHERE pseudonym ~ '^[a-zA-Z0-9]+$';

SELECT name
FROM Tracks
WHERE name ILIKE 'my %'
   OR name ILIKE '% my %'
   OR name ILIKE '% my'
   OR name ILIKE  'my'
   OR name ILIKE 'мой %'
   OR name ILIKE '% мой %'
   OR name ILIKE '% мой'
   OR name ILIKE  'мой';

-- Задание 3

SELECT g.name AS genre_name,
COUNT(pg.performer_id) AS performer_count
FROM Genres g
LEFT JOIN PerformersGenres pg ON g.genre_id = pg.genre_id
GROUP BY g.genre_id, g.name
ORDER BY performer_count DESC, genre_name;

SELECT COUNT(t.track_id) AS track_count
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
WHERE a.year BETWEEN 2019 AND 2020;

SELECT a.album_id, a.name AS album_name, ROUND(AVG(t.duration), 2) AS avg_duration_seconds
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.name
ORDER BY a.album_id;

SELECT p.performer_id, p.pseudonym
FROM Performers p
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Albums a
        JOIN PerformersAlbums pa ON a.album_id = pa.album_id
        WHERE
            pa.performer_id = p.performer_id
            AND a.year = 2020
    )
ORDER BY p.pseudonym;

SELECT c.name
FROM Collections c
JOIN CollectionsTracks ct ON ct.collection_id = c.collection_id
JOIN Tracks t ON t.track_id = ct.track_id
JOIN PerformersAlbums pa ON pa.album_id = t.album_id
JOIN Performers p ON p.performer_id = pa.performer_id AND p.pseudonym = 'Alt‑J';
