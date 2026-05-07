-- Display the first name, last name of students and the courses they are enrolled in.
select first_name, last_name, Course_Name
from student S join enrolls E
			   join course C
where(S.Student_ID=E.Student_Id 
&& C.Course_Id=E.Course_Id); 

-- Retrieve details of students who have scored more than 80 marks.
SELECT S.Student_Id, S.First_Name, S.Last_Name, S.Email, G.marks
FROM Student S
JOIN Grades G ON S.Student_ID = G.Student_Id
WHERE G.Marks > 80;

-- Find the number of students enrolled in each course
select C.Course_Name, count(C.Course_Id)
FROM course C 
JOIN enrolls E ON E.course_Id=C.course_Id
GROUP BY C.Course_Id;

-- Display courses that have more than one student enrolled
SELECT course_name, count(c.course_id)
FROM course C
JOIN enrolls E ON C.course_Id=E.course_Id
GROUP BY E.course_Id
having (count(c.course_id)>1);

-- List all students along with their marks in descending order
SELECT s.First_Name, s.Last_Name, g.marks
FROM student s
JOIN grades g ON s.student_id=g.student_id
order by g.marks desc;

-- Find students who scored above or equal average marks
SELECT First_Name, Last_Name
FROM student s
WHERE (s.student_id IN 
(SELECT g.student_id 
FROM grades g 
WHERE (g.marks > (SELECT AVG(marks) FROM grades))));

-- Display the first name of students, course name, and marks obtained by each student.
SELECT s.First_Name, c.Course_Name, g.marks
FROM student s
JOIN grades g ON g.Student_Id=s.Student_Id
JOIN course c ON g.Course_Id=c.Course_Id;

-- Find students who scored greater than or equal to the average marks of their respective course.
SELECT s.student_id, s.first_name, s.last_name, g.course_id, g.marks
FROM student s
JOIN grades g ON s.student_id = g.student_id
WHERE g.marks >= (
    SELECT AVG(g2.marks)
    FROM grades g2
    WHERE g2.course_id = g.course_id
);

-- Students Who Have Not Enrolled In Any Course
SELECT s.Student_Id, s.First_Name, s.Last_Name
FROM Student s
WHERE NOT EXISTS (
    SELECT *
    FROM Enrolls e
    WHERE e.Student_Id = s.Student_Id
);

-- Students Who Submitted Assignments Late
SELECT s.First_Name, a.Title, sub.Submission_Date, a.Deadline
FROM Submission sub
JOIN Student s ON sub.Student_Id = s.Student_Id
JOIN Assignment a ON sub.Assignment_Id = a.Assignment_Id AND sub.Course_Id = a.Course_Id
WHERE (sub.Submission_Date > a.Deadline);

-- Students Having More Than One Phone Number
SELECT Student_Id, COUNT(Phone) AS Total_Phones
FROM Student_Phone
GROUP BY Student_Id
HAVING COUNT(Phone) > 1;

-- Average Marks Per Course
SELECT c.Course_Name, AVG(g.Marks) AS Average_Marks
FROM Course c
JOIN Grades g
ON c.Course_Id = g.Course_Id
GROUP BY c.Course_Id;

-- Find Courses Without Assignments
SELECT c.Course_Name
FROM Course c
LEFT JOIN Assignment a
ON c.Course_Id = a.Course_Id
WHERE a.Assignment_Id IS NULL;
