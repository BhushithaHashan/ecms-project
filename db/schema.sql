CREATE DATABASE cms;
USE cms;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(50),
    role VARCHAR(20) 
);

CREATE TABLE complaints (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100),
    description TEXT,
    status VARCHAR(20) DEFAULT 'Pending',
    remarks VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- sample users
INSERT INTO users (username, password, role) VALUES ('emp1','123','employee');
INSERT INTO users (username, password, role) VALUES ('admin','admin','admin');
