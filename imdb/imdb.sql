DROP SCHEMA IF EXISTS imdb;
CREATE SCHEMA IF NOT EXISTS imdb;
USE imdb;

CREATE TABLE IF NOT EXISTS imdb.actors(
	id INT UNSIGNED UNIQUE NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
    );

CREATE TABLE IF NOT EXISTS imdb.movies(
	movie_id INT UNSIGNED UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    release_date DATE,
    runtime INT UNSIGNED,
    PRIMARY KEY(movie_id)
    );
    
CREATE TABLE IF NOT EXISTS imdb.tvseries(
	tvseries_id INT UNSIGNED UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    release_date DATE,
    episodes INT UNSIGNED,
    PRIMARY KEY(tvseries_id)
    );

CREATE TABLE IF NOT EXISTS imdb.movie_actor(
	movie_id INT UNSIGNED NOT NULL,
    actor_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_movie_actor_movie_id
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
    CONSTRAINT fk_movie_actor_actor_id
    FOREIGN KEY(actor_id) REFERENCES actors(id)
    );

CREATE TABLE IF NOT EXISTS imdb.tv_actor(
	tvseries_id INT UNSIGNED NOT NULL,
    actor_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_tv_actor_movie_id
    FOREIGN KEY(tvseries_id) REFERENCES tvseries(tvseries_id),
    CONSTRAINT fk_tv_actor_actor_id
    FOREIGN KEY(actor_id) REFERENCES actors(id)
    );