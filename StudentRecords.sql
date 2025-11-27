DROP DATABASE IF EXISTS StudentDB;
CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Students (
  ID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Gender ENUM('MALE','FEMALE','OTHER') NOT NULL,
  Email VARCHAR(150) UNIQUE,
  Phone VARCHAR(20),
  City VARCHAR(50),
  CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Courses (
	CourseID INT PRIMARY KEY,
    Title VARCHAR(100),
    Credits INT
);

CREATE TABLE Enrollments (
	EnrollId INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT, 
    CourseID INT,
    EnrollDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(ID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);


INSERT INTO Courses (CourseID, Title, Credits) VALUES 
					(1, 'Introduction to Programming', 3),
                    (2, 'Database Systems', 4),
                    (3, 'Data Structures', 4);
                    
INSERT INTO Students (ID, Name, Gender, Email, Phone, City) VALUES
(101,'Akshay Bhat','MALE','akshay@example.com','9876500001','Bengaluru'),
(102,'Riya Sharma','FEMALE','riya@example.com','9876500002','Mysuru'),
(103,'Rahul Patel','MALE','rahul@example.com','9876500003','Hubli'),
(104,'Sneha Kumar','FEMALE','sneha@example.com','9876500004','Dharwad'),
(105,'Manish Rao','MALE','manish@example.com','9876500005','Karwar'),
(106,'Anita Nair','FEMALE','anita@example.com','9876500006','Bengaluru'),
(107,'Vikram Singh','MALE','vikram@example.com','9876500007','Mangalore'),
(108,'Pooja Iyer','FEMALE','pooja@example.com','9876500008','Bengaluru'),
(109,'Karan Mehta','MALE','karan@example.com','9876500009','Udupi'),
(110,'Divya S','FEMALE','divya@example.com','9876500010','Davanagere'),
(111,'Suman K','MALE','suman@example.com','9876500011','Bijapur'),
(112,'Meena L','FEMALE','meena@example.com','9876500012','Bellary'),
(113,'Amit P','MALE','amit@example.com','9876500013','Shivamogga'),
(114,'Nisha R','FEMALE','nisha@example.com','9876500014','Vijayapura'),
(115,'Tarun D','MALE','tarun@example.com','9876500015','Davangere'),
(116,'Kavya M','FEMALE','kavya@example.com','9876500016','Bengaluru'),
(117,'Rakesh J','MALE','rakesh@example.com','9876500017','Hassan'),
(118,'Sana Q','FEMALE','sana@example.com','9876500018','Kolar'),
(119,'Prakash V','MALE','prakash@example.com','9876500019','Chitradurga'),
(120,'Latha G','FEMALE','latha@example.com','9876500020','Shimoga');

INSERT INTO Enrollments (StudentId, CourseID, EnrollDate) VALUES
(101,2,'2025-06-01'),
(102,1,'2025-06-02'),
(103,3,'2025-06-03'),
(104,2,'2025-06-04'),
(105,1,'2025-06-05');

CREATE OR REPLACE VIEW View_StudentContacts AS
SELECT ID, Name, Email, Phone FROM Students;

DELIMITER $$
CREATE PROCEDURE GetStudentByID (IN sid INT)
BEGIN
	SELECT * FROM Students WHERE ID=sid;
END $$
DELIMITER ;


SHOW TABLES;

DESCRIBE Students;

SELECT COUNT(*) FROM Students;

SELECT * FROM Students LIMIT 5;

SELECT * FROM view_studentcontacts;

CALL GetStudentByID(101);
