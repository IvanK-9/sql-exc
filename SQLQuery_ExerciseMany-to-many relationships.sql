/*******************************************************************************
    1. DATA SETUP (CLEANUP & POPULATION)
    Prepare the tables with some sample data using your specific column names.
*******************************************************************************/

-- Optional: Clear existing data to start fresh (uncomment if needed)
-- DELETE FROM Ivan.Enrollments;
-- DELETE FROM Ivan.Courses;

-- Insert sample courses (using your 'Title' and 'Description' columns)
INSERT INTO Ivan.Courses (Title, Description)
VALUES 
('SQL Basics', 'Introduction to relational databases and queries'),
('C# Programming', 'Learning OOP and .NET development'),
('Web Design', 'UI/UX principles and frontend basics');

-- Insert enrollments (mapping Students 1-5 to Courses 1-3)
-- Note: We skip EnrollmentID because it is an IDENTITY column
INSERT INTO Ivan.Enrollments (StudentID, CourseID)
VALUES 
(1, 1), -- Student 1 in SQL
(2, 1), -- Student 2 in SQL
(3, 2), -- Student 3 in C#
(4, 3), -- Student 4 in Web
(5, 1); -- Student 5 in SQL

GO

/*******************************************************************************
    2. PRACTICAL EXERCISES
*******************************************************************************/

-- EXERCISE 1: Filtering and Sorting
-- Find students with LastNames starting with 'H' or 'D', sorted alphabetically.
SELECT FirstName, LastName 
FROM Ivan.Students 
WHERE LastName LIKE 'H%' OR LastName LIKE 'D%'
ORDER BY FirstName ASC;

-- EXERCISE 2: Inner Join (Relationships)
-- Combine Students, Enrollments, and Courses to see who is studying what.
SELECT 
    S.FirstName, 
    S.LastName, 
    C.Title AS [Enrolled Course]
FROM Ivan.Students S
JOIN Ivan.Enrollments E ON S.StudentID = E.StudentID
JOIN Ivan.Courses C ON E.CourseID = C.CourseID;

-- EXERCISE 3: Aggregation (Counting)
-- Count how many students are enrolled in each specific course.
SELECT 
    C.Title, 
    COUNT(E.StudentID) AS StudentCount
FROM Ivan.Courses C
LEFT JOIN Ivan.Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.Title;

-- EXERCISE 4: Left Join (Finding "Empty" Records)
-- Identify courses that currently have zero students enrolled.
SELECT C.Title, C.Description
FROM Ivan.Courses C
LEFT JOIN Ivan.Enrollments E ON C.CourseID = E.CourseID
WHERE E.StudentID IS NULL;

-- EXERCISE 5: Subquery
-- List names of students who have at least one enrollment record.
SELECT FirstName, LastName
FROM Ivan.Students
WHERE StudentID IN (SELECT StudentID FROM Ivan.Enrollments);

/*******************************************************************************
    3. SCHEMA VERIFICATION
    Quick checks to ensure everything is linked correctly.
*******************************************************************************/

-- Check the structure of your Courses table again
EXEC sp_help 'Ivan.Courses';

-- View all records in the Courses table
SELECT * FROM Ivan.Courses;