INSERT INTO Performers (pseudonym)
VALUES ('ABBA'),
       ('Ariana Grande'),
       ('AC/DC'),
       ('Alt‑J')
ON CONFLICT (pseudonym) DO NOTHING;

INSERT INTO Genres (name)
VALUES ('pop'),
       ('R&B'),
       ('hard rock'),
       ('alternative')
ON CONFLICT (name) DO NOTHING;

INSERT INTO Albums (name, year)
VALUES ('Arrival', 1976),
       ('eternal sunshine', 2024),
       ('thank u, next', 2019),
       ('Positions', 2020),
       ('Back in Black', 1980),
       ('This Is All Yours', 2014);

INSERT INTO Collections (name, year)
VALUES ('eternal hits', 2018),
       ('Music for parties', 2024),
       ('The evolution of pop music', 2019),
       ('Music from films and TV series', 2023)
ON CONFLICT (name) DO NOTHING;

INSERT INTO Tracks (name, duration, album_id)
VALUES ('Dancing Queen', 230, 1),
       ('Money, Money, Money', 185, 1),
       ('My Love, My Life', 233, 1),
       ('eternal sunshine', 210, 2),
       ('supernatural', 163, 2),
       ('7 Rings', 178, 3),
       ('Thank U, Next', 207, 3),
       ('34+35', 172, 4),
       ('Off the Table', 260, 4),
       ('Hells Bells', 312, 5),
       ('You Shook Me All Night Long', 210, 5),
       ('Hunger of the Pine', 299, 6),
       ('Left Hand Free', 173, 6),
       ('myself', 134, 6),
       ('by myself', 167, 3),
       ('bemy self', 165, 2),
       ('myself by', 195, 1),
       ('by myself by', 172, 5),
       ('beemy', 188, 4),
       ('premyne', 175, 4)
       ('my own', 145, 5),
       ('own my', 153, 2),
       ('my', 134, 2),
       ('oh my god', 124, 4)
ON CONFLICT (name, album_id) DO NOTHING;

INSERT INTO CollectionsTracks(track_id, collection_id)
VALUES (1, 1),
       (2, 2),
       (3, 1),
       (4, 4),
       (5, 2),
       (6, 3),
       (7, 2),
       (8, 4),
       (9, 4),
       (10, 1),
       (11, 1),
       (12, 3),
       (13, 4)
       (14, 4),
       (15, 3),
       (16, 2),
       (17, 3),
       (18, 1),
       (19, 4),
       (20, 4),
       (21, 1),
       (22, 4),
       (23, 1),
       (24, 2)
ON CONFLICT (track_id, collection_id) DO NOTHING;

INSERT INTO PerformersAlbums(performer_id, album_id)
VALUES (1, 1),
       (2, 2),
       (2, 3),
       (2, 4),
       (3, 5),
       (4, 6)
ON CONFLICT (performer_id, album_id) DO NOTHING;

INSERT INTO PerformersGenres(performer_id, genre_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4)
ON CONFLICT (performer_id, genre_id) DO NOTHING;

