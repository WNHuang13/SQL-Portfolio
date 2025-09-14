SELECT * 
FROM student_performance 
LIMIT 10;

-- Average scores
SELECT AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing
FROM student_performance;

-- Order by math score descending
SELECT * 
FROM student_performance 
ORDER BY math_score DESC;

-- Top 5 students by math score
SELECT * 
FROM student_performance
ORDER BY math_score DESC
LIMIT 5;

-- Average math score by gender and test preparation
SELECT gender,
       test_preparation_course,
       AVG(math_score) AS avg_math
FROM student_performance
GROUP BY gender, test_preparation_course;

-- Count of students with math score > 90 by gender
SELECT gender,
       COUNT(*) AS high_math_count
FROM student_performance
WHERE math_score > 90
GROUP BY gender;

-- Students failing (score < 50) in any subject
SELECT * 
FROM student_performance
WHERE math_score < 50 OR reading_score < 50 OR writing_score < 50;
