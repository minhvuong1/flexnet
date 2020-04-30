CREATE DATABASE flexnet;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    name TEXT,
    username TEXT,
    password_digest TEXT
);

INSERT INTO users (username, email, name, password_digest)
VALUES ();

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    description TEXT,
    image_url TEXT,
    comments TEXT,
    user_id INTEGER
);
