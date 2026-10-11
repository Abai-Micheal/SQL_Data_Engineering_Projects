SELECT 
    *
FROM 
    company_dim
LIMIT 10;

SELECT 
    *
FROM 
    skills_job_dim
LIMIT 10;

SELECT 
    *
FROM 
    skills_dim
LIMIT 10;

SELECT * 
FROM information_schema.tables
WHERE table_catalog = 'data_jobs';

PRAGMA show_tables;

DESCRIBE job_postings_fact;

SELECT 
    jpf.*,
    cd.*
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
LIMIT 10;

EXPLAIN ANALYZE
SELECT 
    cd.name AS company_name,
    COUNT(jpf.*) AS posting_count
FROM
    job_postings_fact AS jpf
LEFT JOIN
    company_dim AS cd
ON
    jpf.company_id = cd.company_id
WHERE
    jpf.job_country = 'United States'
GROUP BY
    cd.name
HAVING
    COUNT(jpf.job_id)>3000
ORDER BY
    posting_count DESC
LIMIT 10;