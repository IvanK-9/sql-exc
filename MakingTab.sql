-- 1. Создание схемы (используй свое имя, например, User)
CREATE SCHEMA UserSchema;
GO

-- 2. Таблица студентов
CREATE TABLE UserSchema.Students (
    StudentId INT PRIMARY KEY IDENTITY(1,1),
    LastName NVARCHAR(50),
    FirstName NVARCHAR(50)
);

-- 3. Таблица курсов
CREATE TABLE UserSchema.Courses (
    CourseId INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100),
    Description NVARCHAR(MAX)
);

-- 4. Таблица регистраций (Enrollments) — это мост для связи многие-ко-многим
CREATE TABLE UserSchema.Enrollments (
    EnrollmentId INT PRIMARY KEY IDENTITY(1,1),
    StudentId INT FOREIGN KEY REFERENCES UserSchema.Students(StudentId),
    CourseId INT FOREIGN KEY REFERENCES UserSchema.Courses(CourseId),
    Started DATE,
    Ended DATE
);