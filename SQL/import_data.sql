COPY student_performance(
    gender,
    race_ethnicity,
    parental_level_of_education,
    lunch,
    test_preparation_course,
    math_score,
    reading_score,
    writing_score
)
FROM '/Users/wanning/Downloads/StudentsPerformance.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM student_performance LIMIT 10;