CREATE USER 'root'@'db' IDENTIFIED BY '123';
CREATE DATABASE IF NOT EXISTS unmute;

USE unmute;

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS exercises (
    id INT NOT NULL AUTO_INCREMENT,
    level INT,
    title VARCHAR(50) UNIQUE,
    name VARCHAR(50),
    description VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO users (email, password) VALUES ("test@mail.com", "12345");

INSERT INTO exercises (level, title, name, description) VALUES (1, "Exercise 1", "Picture Perfect", "Match the picture of a signing hand to the corresponding letter. Can you identify the correct ASL handshape for each letter? Multiple choice");
INSERT INTO exercises (level, title, name, description) VALUES (1, "Exercise 2", "Test Your Sign Memory", "Ready for a memory challenge? Watch a series of ASL signs displayed on screen. Once they disappear, tap the signs in the exact order you saw them. Can you remember the sequence?");
INSERT INTO exercises (level, title, name, description) VALUES (1, "Exercise 3", "Sign Charades", "Put your observation skills to the test! You'll see a picture of a hand displaying an ASL sign. Can you identify the letter it represents?");
INSERT INTO exercises (level, title, name, description) VALUES (1, "Exercise 4", "Sign It Like You Mean It", "Time to shine! The app will display a random letter. Sign the letter clearly and accurately using the correct handshape. Don't be shy – show us your best ASL!");

INSERT INTO exercises (level, title, name, description) VALUES (2, "Exercise 5", "Exercise 5 placeholder", "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (2, "Exercise 6", "Exercise 6 placeholder", "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (2, "Exercise 7", "Exercise 7 placeholder", "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (2, "Exercise 8", "Exercise 8 placeholder", "placeholder");

INSERT INTO exercises (level, title, name, description) VALUES (3, "Exercise 9",  "Exercise 9 placeholder",  "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (3, "Exercise 10", "Exercise 10 placeholder", "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (3, "Exercise 11", "Exercise 11 placeholder", "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (3, "Exercise 12", "Exercise 12 placeholder", "placeholder");

INSERT INTO exercises (level, title, name, description) VALUES (4, "Exercise 13", "Exercise 13 placeholder", "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (4, "Exercise 14", "Exercise 14 placeholder", "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (4, "Exercise 15", "Exercise 15 placeholder", "placeholder");
INSERT INTO exercises (level, title, name, description) VALUES (4, "Exercise 16", "Exercise 16 placeholder", "placeholder");