-- a. Retrieving all Homework records
SELECT *
FROM homework;
SELECT name, description
FROM homework;

-- b. Retrieving all Lesson records, including Homework data
SELECT lesson.name AS lesson_name, updated_at, homework.name AS homework_name, description
FROM lesson
         LEFT JOIN homework ON lesson.homework_id = homework.id;

-- c. Get all Lesson records (including Homework data) sorted by update time
SELECT lesson.name AS lesson_name, updated_at, homework.name AS homework_name, description
FROM lesson
         LEFT JOIN homework ON lesson.homework_id = homework.id
ORDER BY updated_at;

-- d. Retrieving all Schedule records, including Lesson data
SELECT s.name       schedule_name,
       s.updated_at schedule_updated_at,
       l.name       lesson_name,
       l.updated_at lesson_updated_at,
       homework_id
FROM schedule s
         LEFT JOIN lesson_schedule ls ON s.id = ls.schedule_id
         LEFT JOIN lesson l ON ls.lesson_id = l.id;

-- e. Getting the number of Lessons for each Schedule
SELECT s.name schedule_name, COUNT(l.id) lesson_count
FROM schedule s
         LEFT JOIN lesson_schedule ls ON s.id = ls.schedule_id
         LEFT JOIN lesson l on ls.lesson_id = l.id
GROUP BY s.id;