
DROP DATABASE IF EXISTS movies;
CREATE DATABASE movies;
USE movies;

# --- 11 ---

CREATE TABLE directors (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	director_name VARCHAR(50) NOT NULL, 
	notes TEXT
); 

INSERT INTO directors(id, director_name, notes)
VALUES (1, 'Director 1', 'Note 1 in directors'),
(2, 'Director 2', 'Note 2 in directors'),
(3, 'Director 3', 'Note 3 in directors'),
(4, 'Director 4', 'Note 4 in directors'),
(5, 'Director 5', 'Note 5 in directors');

CREATE TABLE genres (
	id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL,
    notes TEXT
);

INSERT INTO genres(id, genre_name, notes)
VALUES (1, 'Genre 1', 'Note 1 in genres'),
(2, 'Genre 2', 'Note 2 in genres'),
(3, 'Genre 3', 'Note 3 in genres'),
(4, 'Genre 4', 'Note 4 in genres'),
(5, 'Genre 5', 'Note 5 in genres');

CREATE TABLE categories (
	id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    notes TEXT
);

INSERT INTO categories(id, category_name, notes)
VALUES (1, 'Category 1', 'Note 1 in categories'),
(2, 'Category 2', 'Note 2 in categories'),
(3, 'Category 3', 'Note 3 in categories'),
(4, 'Category 4', 'Note 4 in categories'),
(5, 'Category 5', 'Note 5 in categories');

CREATE TABLE movies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    director_id INT,
    copyright_year INT,
    length FLOAT,
    genre_id INT,
    category_id INT,
    rating INT,
    notes TEXT
);

INSERT INTO movies(id, title, director_id, copyright_year, genre_id, category_id, rating, notes)
VALUES (1, 'Title 1', null, year(now()), null, null, 0,'Note 1 in movies'),
(2, 'Title 2', null, year(now()), null, null, 0,'Note 2 in movies'),
(3, 'Title 3', null, year(now()), null, null, 0,'Note 3 in movies'),
(4, 'Title 4', null, year(now()), null, null, 0,'Note 4 in movies'),
(5, 'Title 5', null, year(now()), null, null, 0,'Note 5 in movies');

# ALTER TABLE movies ADD CONSTRAINT fk_director_id FOREIGN KEY (director_id) REFERENCES directors(id);
# ALTER TABLE movies ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id);
# ALTER TABLE movies ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES categories(id);
