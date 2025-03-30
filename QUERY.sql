-----------------------------------------------------------
-- Завдання 2.
-----------------------------------------------------------

-- Порахувати кількість записів у таблиці Teachers
SELECT 'Teachers' AS TableName, COUNT(*) AS RecordCount
FROM dbo.Teachers;

-- Порахувати кількість записів у таблиці Groups
SELECT 'Groups' AS TableName, COUNT(*) AS RecordCount
FROM dbo.Groups;

-- Порахувати кількість записів у таблиці Subjects
SELECT 'Subjects' AS TableName, COUNT(*) AS RecordCount
FROM dbo.Subjects;

-- Порахувати кількість записів у таблиці Auditoriums
SELECT 'Auditoriums' AS TableName, COUNT(*) AS RecordCount
FROM dbo.Auditoriums;

-- Порахувати кількість записів у таблиці Schedule
SELECT 'Schedule' AS TableName, COUNT(*) AS RecordCount
FROM dbo.Schedule;





-----------------------------------------------------------
-- Завдання 3. Запити з використанням агрегатних функцій
-----------------------------------------------------------
-- 1. Порахувати кількість груп для кожного курсу.
SELECT course, COUNT(*) AS GroupCount
FROM Groups
GROUP BY course;

-- 2. Обчислити середню довжину імен викладачів.
SELECT AVG(LEN(full_name)) AS AvgNameLength
FROM Teachers;

-- 3. Порахувати кількість предметів, у назві яких зустрічається буква 'a' (без врахування регістру).
SELECT COUNT(*) AS SubjectCount
FROM Subjects
WHERE LOWER(name) LIKE '%a%';


-----------------------------------------------------------
-- Завдання 4. Запити з використанням віконних функцій
-----------------------------------------------------------
-- 1. Присвоїти кожному викладачу порядковий номер всередині своєї кафедри.
SELECT full_name, department,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY full_name) AS RowNum
FROM Teachers;

-- 2. Для кожного викладача показати його id і попередній id (якщо є) за порядком.
SELECT id, full_name,
       LAG(id, 1) OVER (ORDER BY id) AS PrevTeacherId
FROM Teachers;

-- 3. Для кожного викладача показати наступного викладача за алфавітним порядком.
SELECT id, full_name,
       LEAD(full_name, 1) OVER (ORDER BY full_name) AS NextTeacher
FROM Teachers;


-----------------------------------------------------------
-- Завдання 5. Запити з використанням рядкових функцій
-----------------------------------------------------------
-- 1. Перетворити імена викладачів на верхній регістр.
SELECT full_name, UPPER(full_name) AS UpperName
FROM Teachers;

-- 2. Витягнути останні два символи з group_number.
SELECT group_number, RIGHT(group_number, 2) AS LastTwoChars
FROM Groups;

-- 3. Замінити слово 'Engineering' на 'Eng.' у назвах предметів.
SELECT name, REPLACE(name, 'Engineering', 'Eng.') AS ShortName
FROM Subjects;


-----------------------------------------------------------
-- Завдання 6. Запити з використанням функцій для обробки дати
-----------------------------------------------------------
-- 1. Повернути поточну дату та час.
SELECT GETDATE() AS CurrentDate;

-- 2. Додати 30 днів до поточної дати.
SELECT DATEADD(day, 30, GETDATE()) AS DateAfter30Days;

-- 3. Обчислити різницю в днях між 1 січня 2025 року та поточною датою.
SELECT DATEDIFF(day, '2025-01-01', GETDATE()) AS DaysSinceStartOf2025;
