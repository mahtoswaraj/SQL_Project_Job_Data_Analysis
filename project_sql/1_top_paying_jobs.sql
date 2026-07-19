/*
    Question: What are the top paying data analyst jobs?
    -- Indentify the 10 highest paying Data Analyst roles that are availabe remotely.
    -- Focuses on job postings with specifies salaries (remove nulls)
    -- why? Highlight the top paying opportunities for Data Analysts, offering insights into employment opportunities
*/


SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    cp.name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim AS cp ON cp.company_id
 = job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
AND job_location = 'Anywhere'
 ORDER BY salary_year_avg DESC
LIMIT 10;