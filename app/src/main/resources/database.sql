-- Sybase Database Schema
-- Sample table for the application

-- Create users table
CREATE TABLE users (
    id INT IDENTITY PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100) NOT NULL,
    created_date DATETIME DEFAULT GETDATE()
);

-- Create index on username
CREATE INDEX idx_username ON users(username);

-- Sample data
INSERT INTO users (username, firstname, lastname, email) VALUES ('john_doe', 'John', 'Doe', 'john@example.com');
INSERT INTO users (username, firstname, lastname, email) VALUES ('jane_smith', 'Jane', 'Smith', 'jane@example.com');
INSERT INTO users (username, firstname, lastname, email) VALUES ('bob_wilson', 'Bob', 'Wilson', 'bob@example.com');

-- Grant permissions (adjust as needed)
-- GRANT SELECT, INSERT, UPDATE, DELETE ON users TO your_username;

-- TEXT and IMAGE Data Types (Sybase ASE)
CREATE TABLE documents (
    id INT IDENTITY PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    attachment IMAGE,
    created_date DATETIME DEFAULT GETDATE()
);

-- DATETIME vs DATETIME2 (Sybase ASE)
CREATE TABLE events (
    id INT IDENTITY PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    event_date DATETIME,  -- Sybase DATETIME - 1/300 second precision
    small_date SMALLDATETIME,  -- 1 minute precision
    created_at DATETIME DEFAULT GETDATE()
);