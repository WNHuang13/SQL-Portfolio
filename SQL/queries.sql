-- Basic Overview

-- Top 10 records (total score in descending order)
SELECT *
FROM student_performance
ORDER BY (math_score + reading_score + writing_score) DESC
LIMIT 10;

-- Average scores
SELECT AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing
FROM student_performance;

-- Group Comparisons

-- Average by gender
SELECT gender,
  COUNT(*) AS n,
  ROUND(AVG(math_score),2) AS avg_math,
  ROUND(AVG(reading_score),2) AS avg_reading,
  ROUND(AVG(writing_score),2) AS avg_writing
FROM student_performance
GROUP BY gender
ORDER BY avg_math DESC;

-- Variance and SD of math scores by parental education
SELECT parental_level_of_education,
  COUNT(*) AS n,
  ROUND(VAR_SAMP(math_score),2) AS var_math,
  ROUND(STDDEV_SAMP(math_score),2)  AS sd_math,
  ROUND(AVG(math_score),2) AS avg_math
FROM student_performance
GROUP BY parental_level_of_education
ORDER BY var_math DESC;

-- Pearson correlation
SELECT
  CORR(math_score, reading_score) AS corr_math_reading,
  CORR(math_score, writing_score) AS corr_math_writing,
  CORR(reading_score, writing_score) AS corr_reading_writing
FROM student_performance;

-- Performance & Risk Analysis

-- Students failing at least two subjects
SELECT
  COUNT(*) AS risk_count,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) 
  FROM student_performance), 2) AS pct_of_all
FROM student_performance
WHERE ((CASE WHEN math_score < 60 THEN 1 
     ELSE 0 END)
     + (CASE WHEN reading_score < 60 THEN 1 
     ELSE 0 END)
     + (CASE WHEN writing_score < 60 THEN 1 
     ELSE 0 END)) >= 2;
     
-- Math scores: stratified summary
SELECT 
  CASE 
    WHEN math_score < 50 THEN 'Fail'
    WHEN math_score BETWEEN 50 AND 69 THEN 'Pass'
    WHEN math_score BETWEEN 70 AND 89 THEN 'Good'
    ELSE 'Excellent'
  END AS math_category,
  COUNT(*) AS n,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM student_performance), 2) AS pct
FROM student_performance
GROUP BY math_category
ORDER BY pct DESC;

-- Top 3 math scores by race/ethnicity
SELECT *
FROM (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY race_ethnicity ORDER BY math_score desc) AS rank_in_group
  FROM student_performance
) t
WHERE rank_in_group <= 3
ORDER BY race_ethnicity, rank_in_group;

-- Top 10% of students by total score: distribution of their characteristics
WITH ranked_student AS (
  SELECT *,
    (math_score + reading_score + writing_score) AS total_score,
    PERCENT_RANK() OVER (ORDER BY (math_score + reading_score + writing_score) DESC) AS pct_rank
  FROM student_performance
)
SELECT gender, race_ethnicity, parental_level_of_education, COUNT(*) AS student_count
FROM ranked_student
WHERE pct_rank <= 0.10
GROUP BY gender, race_ethnicity, parental_level_of_education
ORDER BY student_count DESC;

-- Intervention & Educational Insights

-- Calculate group means (completed vs. none)
WITH grp AS (
  SELECT
    test_preparation_course,
    COUNT(*) AS n,
    ROUND(AVG(math_score),2) AS avg_math,
    ROUND(AVG(reading_score),2) AS avg_reading,
    ROUND(AVG(writing_score),2) AS avg_writing,
    ROUND(STDDEV_SAMP((math_score + reading_score + writing_score)/3.0),2) AS sd_avg
  FROM student_performance
  GROUP BY test_preparation_course
)
SELECT * 
FROM grp;

-- Differences between groups (completed vs. none)
WITH grp AS (
  SELECT test_preparation_course,
         AVG(math_score) AS avg_math,
         AVG(reading_score) AS avg_reading,
         AVG(writing_score) AS avg_writing
  FROM student_performance
  GROUP BY test_preparation_course
)
SELECT
  (SELECT avg_math FROM grp WHERE test_preparation_course = 'completed') -
  (SELECT avg_math FROM grp WHERE test_preparation_course = 'none') AS math_mean_diff,
  (SELECT avg_reading FROM grp WHERE test_preparation_course = 'completed') -
  (SELECT avg_reading FROM grp WHERE test_preparation_course = 'none') AS reading_mean_diff,
  (SELECT avg_writing FROM grp WHERE test_preparation_course = 'completed') -
  (SELECT avg_writing FROM grp WHERE test_preparation_course = 'none') AS writing_mean_diff;
