-- Добавляем студентов
INSERT INTO UserSchema.Students (FirstName, LastName)
VALUES ('Tom', 'Hanks'), ('Leonardo', 'DiCaprio'), ('Denzel', 'Washington'), 
       ('Scarlett', 'Johansson'), ('Brad', 'Pitt'), ('Natalie', 'Portman');

-- Добавляем курсы
INSERT INTO UserSchema.Courses (CourseName)
VALUES ('Cybersecurity Essentials'), ('Database Design and SQL'), 
       ('Introduction to Programming'), ('Network Fundamentals'), 
       ('Web Development Basics');

-- Добавляем записи об обучении (согласно второй картинке)
INSERT INTO UserSchema.Enrollments (StudentId, CourseId, Started, Ended)
VALUES 
(4, 1, '2025-05-02', '2025-06-28'), -- Johansson на Cybersecurity
(5, 1, '2025-05-02', '2025-06-28'), -- Pitt на Cybersecurity
(1, 2, '2025-01-02', '2025-02-28'); -- Hanks на Database Design