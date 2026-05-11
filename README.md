# 📚 Online Course Management System

## 🚀 Overview

The Online Course Management System is a MySQL-based DBMS project designed to manage students, instructors, courses, enrollments, assignments, submissions, and grades in an online learning platform. The project focuses on relational database design and implementation of advanced MySQL concepts.

---

# 🛠️ Tech Stack

* MySQL Workbench
* Relational Database Design
* SQL (DDL & DML)

---

# ✨ Features

*  Stored Procedures
*  Triggers
*  Views

---

# 🗂️ Database Tables

* Student
* Instructor
* Course
* Module
* Assignment
* Submission
* Exam
* Grades
* Student_Phone
* Enrolls

---

#  Procedures

* Enroll_Student
* Add_Course
* Update_Email
* Delete_Student

---

# Trigger

### Auto_Grade

Automatically assigns grades based on marks.

---

# View

### Grade_Report

Displays student marks and grades.

---

#  Transaction

### Safe Student Delete

Deletes student-related records safely using transaction management.

---

#  ER Diagram

```text
ER_Diagram.png
```

---

# 📁 Project Structure

```text
Online-Course-Management-System/
├── tables.sql
├── README.md
├── sample_data.sql
├── Queries.sql
├── PL_SQL.sql
├── ER_Diagram.png
```

---

# ▶️ How to Run

```sql
CREATE DATABASE OnlineCourseDB;
USE OnlineCourseDB;
```

Run:

1. `sample_data.sql`
2. `Queries.sql`
3. `PL_SQL.sql`

---

# 📌 Conclusion

This project demonstrates efficient relational database design and advanced MySQL concepts including procedures, triggers, views, and transaction management.
