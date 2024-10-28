Use ITI


--1
Create View StudentCourseGrades AS
SELECT 
    s.st_fname + ' ' + s.st_lname AS StudentFullName,
    c.crs_name AS CourseName
FROM 
    Student AS s
JOIN 
    Stud_Course AS sc ON s.st_id = sc.st_id
JOIN 
    Course AS c ON sc.crs_id = c.crs_id
WHERE 
    sc.Grade > 50;


--2
CREATE VIEW InstructorDepartment AS
SELECT
    i.Ins_Name AS InstructorName,
    d.dept_name AS DepartmentName
FROM 
    Instructor AS i
JOIN 
    Department AS d ON i.dept_id = d.dept_id
WHERE 
    d.dept_name IN ('SD', 'Java');



--3
CREATE VIEW V1 AS
SELECT 
    *
FROM 
    Student
WHERE 
    st_address IN ('Alex', 'Cairo');