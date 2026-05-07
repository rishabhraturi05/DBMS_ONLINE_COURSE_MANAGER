-- STUDENT TABLE

CREATE TABLE Student(
    Student_Id INT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Date_of_Birth DATE
);

-- INSTRUCTOR TABLE

CREATE TABLE Instructor(
    Instructor_Id INT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Specialization VARCHAR(30)
);

-- COURSE TABLE

CREATE TABLE Course(
    Course_Id INT PRIMARY KEY,
    Course_Name VARCHAR(20) NOT NULL,
    Descriptions VARCHAR(30),
    Duration VARCHAR(30),
    Instructor_Id INT,
    FOREIGN KEY (Instructor_Id) REFERENCES Instructor(Instructor_Id)
);

-- MODULE TABLE

CREATE TABLE Module(
    Module_Id INT,
    Course_Id INT,
    Module_Name VARCHAR(30),
    PRIMARY KEY (Module_Id, Course_Id),
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);

-- =====================================================
-- ASSIGNMENT TABLE
-- =====================================================

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

-- EXAM TABLE

CREATE TABLE Exam(
    Exam_Id INT PRIMARY KEY,
    Exam_Date DATE,
    Total_Marks INT,
    Course_Id INT,
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);

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

-- STUDENT PHONE TABLE

CREATE TABLE Student_Phone(
    Student_Id INT,
    Phone VARCHAR(20),
    PRIMARY KEY (Student_Id, Phone),
    FOREIGN KEY(Student_Id) REFERENCES Student(Student_Id)
);

-- ENROLLS TABLE

CREATE TABLE Enrolls(
    Student_Id INT,
    Course_Id INT,
    PRIMARY KEY (Student_Id, Course_Id),
    FOREIGN KEY(Student_Id) REFERENCES Student(Student_Id),
    FOREIGN KEY(Course_Id) REFERENCES Course(Course_Id)
);