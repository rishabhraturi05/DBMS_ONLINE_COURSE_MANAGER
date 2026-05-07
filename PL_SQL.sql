-- PL SQL
-- Procedure — Enroll Student
DELIMITER //
CREATE PROCEDURE Enroll_Student(
    IN p_student_id INT,
    IN p_course_id INT
)
BEGIN
    INSERT INTO Enrolls(Student_Id, Course_Id)
    VALUES(p_student_id, p_course_id);
END //
DELIMITER ;

CALL Enroll_Student(11,3);


-- Procedure — Add New Course
DELIMITER //
CREATE PROCEDURE Add_Course(
    IN p_course_id INT,
    IN p_course_name VARCHAR(20),
    IN p_description VARCHAR(20),
    IN p_duration VARCHAR(30),
    IN p_instructor_id INT
)
BEGIN
    INSERT INTO Course
    VALUES(p_course_id,p_course_name,p_description,p_duration,p_instructor_id);
END //
DELIMITER ;

CALL Add_Course(16, 'React', 'Frontend', '3 Months', 1);


-- Procedure — Update Student Email
DELIMITER //
CREATE PROCEDURE Update_Email(
	IN p_student_id INT, 
	IN p_new_email VARCHAR(30))
BEGIN
    UPDATE Student
    SET Email = p_new_email
    WHERE Student_Id = p_student_id;
END //
DELIMITER ;

CALL Update_Email(1, 'ravi_new@gmail.com');


-- Trigger — Automatic Grade Assignment
DELIMITER //
CREATE TRIGGER Auto_Grade
BEFORE INSERT
ON Grades
FOR EACH ROW
BEGIN
    IF NEW.Marks >= 85 
    THEN SET NEW.Grade = 'A+';
    ELSEIF NEW.Marks >= 80 
    THEN SET NEW.Grade = 'A';
    ELSEIF NEW.Marks >= 70 
    THEN SET NEW.Grade = 'B';
    ELSEIF NEW.Marks >= 50 
    THEN SET NEW.Grade = 'C';
    ELSE SET NEW.Grade = 'F';
    END IF;
END //
DELIMITER ;


-- View — Grade Report
CREATE VIEW Grade_Report AS
SELECT s.First_Name, c.Course_Name, g.Marks, g.Grade
FROM Grades g
JOIN Student s ON g.Student_Id = s.Student_Id
JOIN Course c ON g.Course_Id = c.Course_Id;

SELECT * FROM Grade_Report;


-- Procedure + Transaction — Safe Student Delete
DELIMITER //
CREATE PROCEDURE Delete_Student(IN p_student_id INT)
BEGIN
    START TRANSACTION;
    DELETE FROM Grades
    WHERE Student_Id = p_student_id;
    DELETE FROM Enrolls
    WHERE Student_Id = p_student_id;
    DELETE FROM Submission
    WHERE Student_Id = p_student_id;
    DELETE FROM Student
    WHERE Student_Id = p_student_id;
    COMMIT;
END //
DELIMITER ;

CALL Delete_Student(16);
