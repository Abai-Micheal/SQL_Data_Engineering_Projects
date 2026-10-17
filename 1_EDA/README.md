# HEADING 1

## HEADING 1

### HEADING 1

Normal Text  
**Bold text**  
`This is code`

- Bullet 1
- Bullet 2

[Link Text](https://www.google.com/search?q=google&rlz=1C1CHBF_enNG1126NG1126&oq=google&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIGCAEQRRg8MgYIAhBFGDwyBggDEEUYPDIGCAQQRRg8MgYIBRBFGEEyBggGEEUYQTIGCAcQRRg80gEJMTE3MWowajE1qAIIsAIB&sourceid=chrome&source=chrome.rb&ie=UTF-8)

![PROJECT OVERVIEW](../Images\1_1_Project1_EDA.png)

```sql
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
```

**[MARKDOWN CHEAT SHEET](https://www.markdownguide.org/cheat-sheet/)**
