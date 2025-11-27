CREATE TABLE IF NOT EXISTS Albums (
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    year INT
);

CREATE TABLE IF NOT EXISTS Performers (
    performer_id SERIAL PRIMARY KEY,
    pseudonym VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections (
    collection_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    year INT
);

CREATE TABLE IF NOT EXISTS Tracks (
     track_id SERIAL PRIMARY KEY,
     name VARCHAR(255) NOT NULL,
     duration INT,
     album_id INT NOT NULL,
     FOREIGN KEY (album_id) REFERENCES Albums (album_id),
     CONSTRAINT uk_tracks_unique UNIQUE (name, album_id)
);

CREATE TABLE IF NOT EXISTS CollectionsTracks (
     track_id INT NOT NULL,
     collection_id INT NOT NULL,
     PRIMARY KEY (track_id, collection_id),
     FOREIGN KEY (track_id) REFERENCES Tracks (track_id) ON DELETE CASCADE,
     FOREIGN KEY (collection_id) REFERENCES Collections (collection_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PerformersAlbums (
     performer_id INT NOT NULL,
     album_id INT NOT NULL,
     PRIMARY KEY (performer_id, album_id),
     FOREIGN KEY (performer_id) REFERENCES Performers (performer_id) ON DELETE CASCADE,
     FOREIGN KEY (album_id) REFERENCES Albums (album_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS PerformersGenres (
     genre_id INT NOT NULL,
     performer_id INT NOT NULL,
     PRIMARY KEY (genre_id, performer_id),
     FOREIGN KEY (genre_id) REFERENCES Genres (genre_id) ON DELETE CASCADE,
     FOREIGN KEY (performer_id) REFERENCES Performers (performer_id) ON DELETE CASCADE
);
