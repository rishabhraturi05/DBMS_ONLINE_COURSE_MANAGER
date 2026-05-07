-- STUDENT TABLE
CREATE TABLE Student(
    Student_Id INT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Date_of_Birth DATE
);

INSERT INTO Student VALUES
(1, 'Ravi', 'Kumar', 'ravi@gmail.com', '2004-03-15'),
(2, 'Anjali', 'Sharma', 'anjali@gmail.com', '2005-07-22'),
(3, 'Vikram', 'Singh', 'vikram@gmail.com', '2003-11-09'),
(4, 'Sneha', 'Patel', 'sneha@gmail.com', '2004-01-30'),
(5, 'Arjun', 'Reddy', 'arjun@gmail.com', '2005-09-18'),
(6, 'Priya', 'Nair', 'priya@gmail.com', '2004-06-11'),
(7, 'Karan', 'Mehta', 'karan@gmail.com', '2003-12-25'),
(8, 'Neha', 'Gupta', 'neha@gmail.com', '2005-04-14'),
(9, 'Rahul', 'Das', 'rahul@gmail.com', '2004-08-07'),
(10, 'Pooja', 'Verma', 'pooja@gmail.com', '2003-10-19'),
(11, 'Aman', 'Yadav', 'aman@gmail.com', '2005-02-28'),
(12, 'Divya', 'Rao', 'divya@gmail.com', '2004-05-05'),
(13, 'Nikhil', 'Jain', 'nikhil@gmail.com', '2003-09-13'),
(14, 'Sara', 'Ali', 'sara@gmail.com', '2005-12-01'),
(15, 'Rohan', 'Kapoor', 'rohan@gmail.com', '2004-07-27');

-- INSTRUCTOR TABLE

CREATE TABLE Instructor(
    Instructor_Id INT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Specialization VARCHAR(30)
);

INSERT INTO Instructor VALUES
(1, 'Rajesh', 'Kumar', 'rajesh@gmail.com', 'Database'),
(2, 'Meena', 'Sharma', 'meena@gmail.com', 'Networking'),
(3, 'Amit', 'Verma', 'amit@gmail.com', 'AI'),
(4, 'Suresh', 'Reddy', 'suresh@gmail.com', 'Machine Learning'),
(5, 'Kavita', 'Iyer', 'kavita@gmail.com', 'Operating Systems'),
(6, 'Manoj', 'Singh', 'manoj@gmail.com', 'Cyber Security'),
(7, 'Anita', 'Patel', 'anita@gmail.com', 'Data Science'),
(8, 'Vijay', 'Nair', 'vijay@gmail.com', 'Cloud Computing'),
(9, 'Pooja', 'Gupta', 'pooja@gmail.com', 'Software Engineering'),
(10, 'Rohit', 'Das', 'rohit@gmail.com', 'Web Development');

-- COURSE TABLE

CREATE TABLE Course(
    Course_Id INT PRIMARY KEY,
    Course_Name VARCHAR(20) NOT NULL,
    Descriptions VARCHAR(30),
    Duration VARCHAR(30),
    Instructor_Id INT,
    FOREIGN KEY (Instructor_Id) REFERENCES Instructor(Instructor_Id)
);

INSERT INTO Course VALUES
(1, 'DBMS', 'Database', '3 Months', 1),
(2, 'Networks', 'Networking', '4 Months', 2),
(3, 'AI Basics', 'AI Intro', '3 Months', 3),
(4, 'ML', 'Machine Learn', '5 Months', 4),
(5, 'OS', 'Operating Sys', '4 Months', 5),
(6, 'Security', 'Cyber Sec', '3 Months', 6),
(7, 'DataSci', 'Data Science', '6 Months', 7),
(8, 'Cloud', 'Cloud Comp', '4 Months', 8),
(9, 'WebDev', 'Web Dev', '3 Months', 10),
(10, 'SE', 'Software Eng', '2 Months', 9),
(11, 'Python', 'Programming', '3 Months', 1),
(12, 'Java', 'OOP', '4 Months', 2),
(13, 'C++', 'Programming', '3 Months', 3),
(14, 'DSA', 'DataStruct', '5 Months', 4),
(15, 'DevOps', 'Tools', '4 Months', 5);

-- MODULE TABLE

CREATE TABLE Module(
    Module_Id INT,
    Course_Id INT,
    Module_Name VARCHAR(30),
    PRIMARY KEY (Module_Id, Course_Id),
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);

INSERT INTO Module VALUES
(1, 1, 'IntroDB'),
(2, 1, 'SQL'),
(1, 2, 'BasicsNet'),
(2, 2, 'Routing'),
(1, 3, 'IntroAI'),
(2, 3, 'Search'),
(1, 4, 'IntroML'),
(2, 4, 'Models'),
(1, 5, 'IntroOS'),
(2, 5, 'Process'),
(1, 6, 'IntroSec'),
(2, 6, 'EthicalHack'),
(1, 7, 'IntroDS'),
(2, 7, 'Analytics'),
(1, 8, 'IntroCloud'),
(2, 8, 'AWS'),
(1, 9, 'HTMLCSS'),
(2, 9, 'JavaScript'),
(1, 10, 'SDLC'),
(2, 10, 'Testing'),
(1, 11, 'PythonBas'),
(2, 11, 'Functions'),
(1, 12, 'JavaIntro'),
(2, 12, 'OOPs'),
(1, 13, 'CppIntro'),
(2, 13, 'STL'),
(1, 14, 'Arrays'),
(2, 14, 'Trees'),
(1, 15, 'Linux'),
(2, 15, 'Docker');

-- ASSIGNMENT TABLE

CREATE TABLE Assignment(
    Assignment_Id INT,
    Module_Id INT NOT NULL,
    Course_Id INT NOT NULL,
    Title VARCHAR(50),
    Deadline DATE,
    PRIMARY KEY (Assignment_Id, Course_Id),
    FOREIGN KEY (Module_Id, Course_Id)
    REFERENCES Module(Module_Id, Course_Id)
);

INSERT INTO Assignment VALUES
(1, 1, 1, 'A1', '2026-04-10'),
(2, 2, 1, 'A2', '2026-04-15'),
(1, 1, 2, 'A1', '2026-04-12'),
(2, 2, 2, 'A2', '2026-04-18'),
(1, 1, 3, 'A1', '2026-04-11'),
(2, 2, 3, 'A2', '2026-04-17'),
(1, 1, 4, 'A1', '2026-04-13'),
(2, 2, 4, 'A2', '2026-04-20'),
(1, 1, 5, 'A1', '2026-04-14'),
(2, 2, 5, 'A2', '2026-04-22'),
(1, 1, 6, 'A1', '2026-04-10'),
(2, 2, 6, 'A2', '2026-04-15'),
(1, 1, 7, 'A1', '2026-04-11'),
(2, 2, 7, 'A2', '2026-04-16'),
(1, 1, 8, 'A1', '2026-04-12'),
(2, 2, 8, 'A2', '2026-04-17'),
(1, 1, 9, 'A1', '2026-04-13'),
(2, 2, 9, 'A2', '2026-04-18'),
(1, 1, 10, 'A1', '2026-04-14'),
(2, 2, 10, 'A2', '2026-04-19'),
(1, 1, 11, 'A1', '2026-04-15'),
(2, 2, 11, 'A2', '2026-04-20'),
(1, 1, 12, 'A1', '2026-04-16'),
(2, 2, 12, 'A2', '2026-04-21'),
(1, 1, 13, 'A1', '2026-04-17'),
(2, 2, 13, 'A2', '2026-04-22'),
(1, 1, 14, 'A1', '2026-04-18'),
(2, 2, 14, 'A2', '2026-04-23'),
(1, 1, 15, 'A1', '2026-04-19'),
(2, 2, 15, 'A2', '2026-04-24');

-- SUBMISSION TABLE

CREATE TABLE Submission(
    Submission_Id INT,
    Submission_Date DATE,
    File_URL VARCHAR(255),
    Student_Id INT,
    Course_Id INT,
    Assignment_Id INT,
    PRIMARY KEY (Student_Id, Course_Id, Submission_Id),
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id),
    FOREIGN KEY (Assignment_Id, Course_Id)
    REFERENCES Assignment(Assignment_Id, Course_Id)
);

INSERT INTO Submission VALUES
(1, '2026-04-11', 'url1', 1, 1, 1),
(2, '2026-04-16', 'url2', 2, 1, 2),
(3, '2026-04-13', 'url3', 3, 2, 1),
(4, '2026-04-19', 'url4', 4, 2, 2),
(5, '2026-04-12', 'url5', 5, 3, 1),
(6, '2026-04-18', 'url6', 6, 3, 2),
(7, '2026-04-14', 'url7', 7, 4, 1),
(8, '2026-04-21', 'url8', 8, 4, 2),
(9, '2026-04-15', 'url9', 9, 5, 1),
(10, '2026-04-23', 'url10', 10, 5, 2);

-- EXAM TABLE

CREATE TABLE Exam(
    Exam_Id INT PRIMARY KEY,
    Exam_Date DATE,
    Total_Marks INT,
    Course_Id INT,
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);

INSERT INTO Exam VALUES
(1, '2026-04-10', 100, 1),
(2, '2026-04-12', 100, 2),
(3, '2026-04-14', 100, 3),
(4, '2026-04-16', 100, 4),
(5, '2026-04-18', 100, 5),
(6, '2026-04-20', 100, 6),
(7, '2026-04-22', 100, 7),
(8, '2026-04-24', 100, 8),
(9, '2026-04-26', 100, 9),
(10, '2026-04-28', 100, 10);

-- GRADES TABLE

CREATE TABLE Grades(
    Student_Id INT,
    Course_Id INT,
    Marks INT,
    Grade VARCHAR(10),
    PRIMARY KEY (Student_Id, Course_Id),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id),
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);

INSERT INTO Grades VALUES
(1, 1, 95, 'A+'),
(2, 2, 60, 'C'),
(3, 3, 88, 'A'),
(4, 4, 45, 'D'),
(5, 5, 72, 'B'),
(6, 6, 91, 'A+'),
(7, 7, 55, 'D'),
(8, 8, 68, 'C'),
(9, 9, 82, 'A'),
(10, 10, 39, 'F');

-- STUDENT PHONE TABLE

CREATE TABLE Student_Phone(
    Student_Id INT,
    Phone VARCHAR(20),
    PRIMARY KEY (Student_Id, Phone),
    FOREIGN KEY(Student_Id) REFERENCES Student(Student_Id)
);

INSERT INTO Student_Phone VALUES
(1, '9876543210'),
(1, '9123456780'),
(2, '9234567890'),
(3, '9345678901'),
(4, '9456789012'),
(5, '9567890123'),
(6, '9678901234'),
(7, '9789012345'),
(8, '9890123456'),
(9, '9901234567');

-- ENROLLS TABLE

CREATE TABLE Enrolls(
    Student_Id INT,
    Course_Id INT,
    PRIMARY KEY (Student_Id, Course_Id),
    FOREIGN KEY(Student_Id) REFERENCES Student(Student_Id),
    FOREIGN KEY(Course_Id) REFERENCES Course(Course_Id)
);

INSERT INTO Enrolls VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(1, 3),
(11, 1),
(12, 1),
(13, 2);
