use trainingDB;

-- Trainee
INSERT INTO Trainee VALUES
('Aisha Al-Harthy', 'Female', 'aisha@example.com', 'Engineering'),
('Sultan Al-Farsi', 'Male', 'sultan@example.com', 'Business'),
('Mariam Al-Saadi', 'Female', 'mariam@example.com', 'Marketing'),
('Omar Al-Balushi', 'Male', 'omar@example.com', 'Computer Science'),
('Fatma Al-Hinai', 'Female', 'fatma@example.com', 'Data Science');

-- Trainer
INSERT INTO Trainer VALUES
('Khalid Al-Maawali', 'Databases', '96891234567', 'khalid@example.com'),
('Noura Al-Kindi', 'Web Development', '96892345678', 'noura@example.com'),
('Salim Al-Harthy', 'Data Science', '96893456789', 'salim@example.com');

-- Course
INSERT INTO Course VALUES
('Database Fundamentals', 'Databases', 20, 'Beginner'),
('Web Development Basics', 'Web', 30, 'Beginner'),
('Data Science Introduction', 'Data Science', 25, 'Intermediate'),
('Advanced SQL Queries', 'Databases', 15, 'Advanced');

-- Schedule
INSERT INTO Schedule VALUES
(1, 1, '2025-07-01', '2025-07-10', 'Morning'),
(2, 2, '2025-07-05', '2025-07-20', 'Evening'),
(3, 3, '2025-07-10', '2025-07-25', 'Weekend'),
(4, 1, '2025-07-15', '2025-07-22', 'Morning');

-- Enrollment
INSERT INTO Enrollment VALUES
(1, 1, '2025-06-01'),
(2, 1, '2025-06-02'),
(3, 2, '2025-06-03'),
(4, 3, '2025-06-04'),
(5, 3, '2025-06-05'),
(1, 4, '2025-06-06');

