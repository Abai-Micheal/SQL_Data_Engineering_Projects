
/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/

 SELECT 
 sd.skills,
 COUNT(jpf.*) AS demand_count, 
 ROUND(LN(COUNT(jpf.*)),1) AS ln_demand_count,
 ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
 ROUND((LN(COUNT(jpf.*)) * ROUND(MEDIAN(jpf.salary_year_avg),0) )/ 1000000 ,2) AS optimal_score
 FROM job_postings_fact AS jpf
 INNER JOIN skills_job_dim AS sjd 
 ON jpf.job_id = sjd.job_id
 INNER JOIN skills_dim AS sd 
 ON sjd.skill_id = sd.skill_id
 WHERE jpf.job_title_short = 'Data Engineer' AND jpf.job_work_from_home = True AND jpf.salary_year_avg IS NOT NULL
 GROUP BY sd.skills
 HAVING demand_count >= 100
 ORDER BY optimal_score DESC
 LIMIT 25;