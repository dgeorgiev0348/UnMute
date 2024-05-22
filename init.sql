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
INSERT INTO exercises (level, title, name, description) VALUES (1, "Exercise 02", "Test Your Sign Memory", "Ready for a memory challenge? Watch a series of ASL signs displayed on screen. Once they disappear, tap the signs in the exact order you saw them. Can you remember the sequence?");
INSERT INTO exercises (level, title, name, description) VALUES (1, "Exercise 03", "Sign Charades", "Put your observation skills to the test! You'll see a picture of a hand displaying an ASL sign. Can you identify the letter it represents?");
INSERT INTO exercises (level, title, name, description) VALUES (1, "Exercise 04", "Sign It Like You Mean It", "Time to shine! The app will display a random letter. Sign the letter clearly and accurately using the correct handshape. Don't be shy – show us your best ASL!");