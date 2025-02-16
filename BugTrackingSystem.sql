CREATE DATABASE BugTrackingSystem;
USE BugTrackingSystem;
CREATE TABLE Users(
	user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role ENUM('Tester', 'Developer', 'Manager') NOT NULL
);

CREATE TABLE Projects(
	project_id INT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT current_timestamp
);

CREATE TABLE Bugs(
	bug_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    severity ENUM('Critical', 'High', 'Medium', 'Low'),
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed'),
    created_by INT,
    assigned_to INT, 
    project_id INT,
    created_at timestamp DEFAULT current_timestamp,
    FOREIGN KEY (created_by) REFERENCES Users(user_id),
    FOREIGN KEY (assigned_to) REFERENCES Users(user_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- to show the constraints -- 
SHOW CREATE TABLE Bugs;

-- dropped user_id foregin constraint to add auto increment in Users table-- 
ALTER TABLE Bugs DROP FOREIGN KEY bugs_ibfk_1;
ALTER TABLE Bugs DROP FOREIGN KEY bugs_ibfk_2;
ALTER TABLE Bugs DROP FOREIGN KEY bugs_ibfk_3;


-- to add auto increments for id's modified it --  
ALTER TABLE Users
MODIFY column user_id INT AUTO_INCREMENT;

ALTER TABLE Projects
MODIFY column project_id INT AUTO_INCREMENT;

ALTER TABLE Bugs
MODIFY column bug_id INT AUTO_INCREMENT;

INSERT INTO Users(name, email, role) VALUES
('Mutahra Ghulam', 'mutahra@example.com', 'Tester'),
('Ali Raza','raza@example.com', 'Developer'),
('Qurat-ul-Ain', 'qurat@example.com', 'Manager');

INSERT INTO Projects(project_name) VALUES
('E-Commerce Website'),
('Mobile Banking App');

INSERT INTO Bugs(title, description, severity, created_by, assigned_to, project_id) VALUES
('Login Page Crash', 'Application is being crashed upon invalid login', 'High', 1, 2, 3),
('Payment gateway error', 'Payment Fails', 'Critical', 1, 2, 2);

-- DESCRIBE Users;
-- SHOW COLUMNS FROM Users;
SELECT * FROM Users;
SELECT * FROM Projects;

-- update bugs statuses-- 
UPDATE Bugs
SET status = 'In Progress' WHERE bug_id = 3;

UPDATE Bugs
SET status = 'Open' WHERE bug_id = 4;

-- fetch all open bugs
SELECT * FROM Bugs WHERE status = 'Open';

-- Count bugs per severity level
SELECT severity, COUNT(*) AS bug_count FROM Bugs GROUP BY severity;

-- Find bugs assigned to a specific developer
SELECT * FROM Bugs WHERE assigned_to = (SELECT user_id FROM Users WHERE name = 'Ali Raza');

-- Testing Queries
-- Update a bug's status
UPDATE Bugs SET status = 'Resolved' WHERE bug_id = 3;
SELECT * FROM Bugs;

-- Delete a specific bug (use carefully)
DELETE FROM Bugs WHERE bug_id = 3;

-- add another bug
INSERT INTO Bugs(title, description, severity, status, created_by, assigned_to, project_id) VALUES
('Add to Cart Button', 'Add to Cart Button is not working', 'High', 'Open', 1, 2, 1);
SELECT * FROM Bugs;
