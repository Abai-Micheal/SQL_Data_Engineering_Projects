SELECT column_name,column_name,data_type
FROM information_schema.columns
WHERE table_name = 'job_postings_fact';

DESCRIBE job_postings_fact;

SELECT 123 :: VARCHAR;

SELECT 
CAST (job_id AS VARCHAR) job_id,
CAST (company_id AS VARCHAR) company_id,
CAST (salary_year_avg AS INT) salary_year_avg,
job_work_from_home :: INT job_work_from_home,
job_posted_date :: DATE job_posted_date,
job_id :: VARCHAR || '-' ||  company_id :: VARCHAR AS Unique_Id
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 10;