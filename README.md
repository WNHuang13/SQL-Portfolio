# Students Performance Analysis

## Executive Summary
Using SQL and Power BI, I analysed student performance data across math, reading, and writing, along with demographic factors. Future actions based on the results include:  
- Provide additional support for students failing two or more subjects  
- Recognize and provide enrichment opportunities for top 10% students  
- Expand or optimize test preparation courses to maximize learning gains  

## Problem
A significant number of students are at risk of failing multiple subjects. Educators and school administrators need insights to:  
- Identify students who are underperforming or at risk of failing  
- Understand how demographic factors (gender, parental education, race/ethnicity, lunch type) influence academic outcomes  
- Evaluate the impact of test preparation on student performance  
The goal is to provide data-driven recommendations to support at-risk students, recognize high-performing students, and interventions such as test preparation.  

## Methodology  
1.	Data Source  
  `Student_Performance.csv` with demographic and score information  
2.	Data Analysis and Workflow  
  Using SQL queries (all SQL scripts are in the `SQL\`), we conducted exploratory analysis and aggregation to:  
    •	Overview of the dataset and summary statistics  
    •	Group comparisons (gender, parental education, lunch type)  
    •	Identification of at-risk and top-performing students  
    •	Evaluation of intervention impact (test preparation)  
3.	Visualization  
  Using Power BI  

## Skills 
- SQL: CASE WHEN, ROW_NUMBER(),CTE, aggregate functions, and window functions  
- Power BI  

## Results & Recommendations
Key findings:  
  - Approximately 27% of students are failing two or more subjects, highlighting the at-risk population.  
  - Students who completed the test preparation course scored on average 5.62 points higher in math, 7.36 points higher in reading, and 9.91 points higher in writing than those who did not.  
  - Performance varies across demographic groups, indicating areas where targeted support may be needed.  

Recommendations based on these insights:  
  - Provide targeted support and intervention programs for students failing multiple subjects.  
  - Recognize and offer enrichment opportunities for top-performing students to encourage continued achievement.  
  - Optimize test preparation courses and provide additional guidance to maximize their effectiveness.  
These actions aim to reduce failure rates, improve overall student outcomes, and enable educators to allocate resources more effectively.  

## Power BI Visualization
All Power BI work is in the `PowerBI/` folder:  

Visualizations include:

- Overall Performance Distribution
  
  ![Overall Performance Distribution](PowerBI/OverallPerformanceDistribution.png)

- At-Risk Students by Parental Education Level

  ![At Risk Students by Parental Education Level](PowerBI/AtRiskStudentsbyParentalEducationLevel.png)

- Impact of Test Preparation on Student Performance
  
  ![Impact of Test Preparation on Student Performance](PowerBI/ImpactofTestPreparationonStudentPerformance.png)

- Demographics of High-Performing Students (Top 10%)
  
  ![Demographics of High-Performing Students](PowerBI/DemographicsofHighPerformingStudents.png)


## Next Steps  
- Predictive modelling for at-risk students: Build models to identify students likely to fail in advance, allowing for earlier interventions.  
- Monitor intervention effectiveness over time: Track how test preparation impacts student performance longitudinally.  
- Expand comparative analysis: Compare performance across different schools, areas, or demographic groups to uncover broader trends.  



