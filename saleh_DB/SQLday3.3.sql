Use ITI



-- Display instructor Name and Department Name 
-- Note: display all the instructors if they are attached to a department or not
SELECT i.Ins_Name, d.Dept_Name
FROM Instructor AS i
LEFT JOIN Ins_Course AS ic ON i.Ins_ID = ic.Ins_ID
LEFT JOIN Course AS c ON ic.Crs_ID = c.Crs_ID
LEFT JOIN Department AS d ON c.Crs_Id = d.Dept_ID;


-- Display student full name and the name of the course he is taking
-- For only courses which have a grade  
SELECT s.St_Fname + ' ' + s.St_Lname AS StudentFullName, c.Crs_Name AS CourseName
FROM Student AS s
JOIN Stud_Course AS sc ON s.St_ID = sc.St_ID
JOIN Course AS c ON sc.Crs_ID = c.Crs_ID
WHERE sc.Grade IS NOT NULL;



-- Display number of courses for each topic name
SELECT t.Top_Name, COUNT(DISTINCT c.Crs_ID) AS NumberOfCourses
FROM Topic AS t
JOIN Course AS c ON t.Top_ID = c.Top_ID
GROUP BY t.Top_Name;



-- Display max and min salary for instructors
SELECT MAX(i.Salary) AS MaxSalary, MIN(i.Salary) AS MinSalary
FROM Instructor AS i;



-- Display the Department name that contains the instructor who receives the minimum salary.
SELECT d.Dept_Name
FROM Instructor AS i
JOIN Ins_Course AS ic ON i.Ins_ID = ic.Ins_ID
JOIN Course AS c ON ic.Crs_ID = c.Crs_ID
JOIN Department AS d ON d.Dept_Id = d.Dept_ID
WHERE i.Salary = (SELECT MIN(Salary) FROM Instructor);



-- Select instructor name and his salary but if there is no salary display instructor bonus keyword. “use coalesce Function” SELF Search
SELECT i.Ins_Name, COALESCE(i.Salary, 'Instructor Bonus') AS Salary
FROM Instructor AS i;



-- Write a query to select the highest two salaries in Each Department for instructors who have salaries. “using one of Ranking Functions”
SELECT d.Dept_Name, i.Ins_Name, i.Salary,
       DENSE_RANK() OVER (PARTITION BY d.Dept_Name ORDER BY i.Salary DESC) AS SalaryRank
FROM Instructor AS i
JOIN Ins_Course AS ic ON i.Ins_ID = ic.Ins_ID
JOIN Course AS c ON ic.Crs_ID = c.Crs_ID
JOIN Department AS d ON d.Dept_Id = d.Dept_ID
WHERE i.Salary IS NOT NULL
ORDER BY d.Dept_Name, SalaryRank;



-- Write a query to select a random student from each department.  “using one of Ranking Functions”
SELECT d.Dept_Name, s.St_Fname + ' ' + s.St_Lname AS StudentFullName,
       ROW_NUMBER() OVER (PARTITION BY d.Dept_Name ORDER BY Rand()) AS RandomRank
FROM Student AS s
JOIN Stud_Course AS sc ON s.St_ID = sc.St_ID
JOIN Course AS c ON sc.Crs_ID = c.Crs_ID
JOIN Department AS d ON d.Dept_Id = d.Dept_ID