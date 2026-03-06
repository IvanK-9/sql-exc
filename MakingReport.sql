SELECT 
    c.CourseName AS [Course name],
    s.LastName,
    s.FirstName,
    e.Started,
    e.Ended
FROM UserSchema.Enrollments e
JOIN UserSchema.Students s ON e.StudentId = s.StudentId
JOIN UserSchema.Courses c ON e.CourseId = c.CourseId
ORDER BY c.CourseName, s.LastName;