Bug Tracking System (BTS)
A Simple SQL-Based Bug Management System
📌 Project Overview
The Bug Tracking System (BTS) is a database-driven solution that helps software teams efficiently log, track, and resolve software bugs. It enables QA testers to report bugs, developers to update their statuses, and managers to monitor project progress.

Built using MySQL, this system ensures structured bug reporting, role-based access, and efficient tracking of software defects across multiple projects.

🚀 Features
✅ User Roles: Tester, Developer, Manager
✅ Bug Management: Report, Assign, Update, and Close Bugs
✅ Severity Levels: Low, Medium, High, Critical
✅ Status Tracking: Open → In Progress → Resolved → Closed
✅ Project Association: Bugs are linked to specific projects
✅ Optimized SQL Queries for Reporting

🛠 Technologies Used
Database: MySQL
Tools: MySQL Workbench, SQL Queries

📂 Database Schema
The system consists of three main tables:

1️⃣ Users Table

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role ENUM('Tester', 'Developer', 'Manager') NOT NULL
);
2️⃣ Projects Table

CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
3️⃣ Bugs Table

CREATE TABLE Bugs (
    bug_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    severity ENUM('Low', 'Medium', 'High', 'Critical') NOT NULL,
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') DEFAULT 'Open',
    created_by INT,
    assigned_to INT,
    project_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Users(user_id),
    FOREIGN KEY (assigned_to) REFERENCES Users(user_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

🔹 SQL Queries Section

📌 Get all open bugs:
SELECT * FROM Bugs WHERE status = 'Open';

📌 Find all bugs assigned to a specific developer:
SELECT * FROM Bugs WHERE assigned_to = (SELECT user_id FROM Users WHERE name = 'Bob Smith');

📌 Count bugs per severity level:
SELECT severity, COUNT(*) AS bug_count FROM Bugs GROUP BY severity;

📌 Fetch all bugs for a specific project:
SELECT * FROM Bugs WHERE project_id = 1;

📌 Update a bug’s status to Resolved:
UPDATE Bugs SET status = 'Resolved' WHERE bug_id = 2;

📌 Delete a bug (Use with caution!):
DELETE FROM Bugs WHERE bug_id = 3;

📖 How to Run This Project
Step 1: Setup MySQL Database
Install MySQL and MySQL Workbench.
Open MySQL Workbench and create the database:

CREATE DATABASE BugTrackingSystem;
USE BugTrackingSystem;

Copy-paste and execute the SQL scripts from the Database Schema section above.

Step 2: Insert Sample Data
Run the following SQL commands to insert sample users, projects, and bugs:

INSERT INTO Users (name, email, role) VALUES 
('Alice Johnson', 'alice@example.com', 'Tester'),
('Bob Smith', 'bob@example.com', 'Developer'),
('Charlie Brown', 'charlie@example.com', 'Manager');

INSERT INTO Projects (project_name) VALUES 
('E-Commerce Website'), 
('Mobile Banking App');

INSERT INTO Bugs (title, description, severity, created_by, assigned_to, project_id) VALUES 
('Login page crash', 'App crashes on invalid login', 'High', 1, 2, 1),
('Payment gateway error', 'Payment fails intermittently', 'Critical', 1, 2, 2);

Step 3: Test SQL Queries
Run the sample queries mentioned above to validate data retrieval and bug tracking.

📌 Future Improvements
As this is a basic project, the following features can be added in future iterations:

🔹 Add a Frontend (React, Angular, or Vue.js) to create a web-based UI.
🔹 Implement Stored Procedures for automatic bug assignment.
🔹 Introduce Authentication & User Login to restrict access.
🔹 Build REST APIs using Node.js or Python Flask for integration with web/mobile apps.
🔹 Generate Bug Reports with summary analytics.
🔹 Enhance Security with role-based access control (RBAC).

💡 Contributions
🚀 Feel free to contribute! If you find any bugs (ironically 😄) or want to improve the project, submit a pull request or open an issue.

📜 License
This project is open-source and available under the MIT License.

📞 Contact
For any questions, reach out to me on:
📩 Email: sanatariq001122@gmail.com
🔗 LinkedIn: https://www.linkedin.com/in/sana-tariq-44875b205/
🌍 GitHub: https://github.com/sanatariq-dev

