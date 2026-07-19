/*
    Question: What are the most in-demand skills for data analysts?
    -- Join job postings to inner join table similar to query 2
    Identify the top  in-demand skills for the a data analyst.
    Focus on all job postings.
    Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for the job seekers.
*/

SELECT 
      s.skills AS skill_name,
      COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim AS sk ON sk.job_id = job_postings_fact.job_id
INNER JOIN skills_dim AS s ON s.skill_id = sk.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY s.skills
ORDER BY demand_count DESC
LIMIT 5;