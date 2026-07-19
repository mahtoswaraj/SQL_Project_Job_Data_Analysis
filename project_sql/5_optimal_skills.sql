/*
    QUERY:  What are the most optimal skills to learn (aka it's in high demand and a high-paying skills)?
    -- Identify skills in high demand and associated with high average salaries for Data Analysts rols.
    -- Concentrates on remote positions with specified salaries
    -- Why? Targets skills that offer job security (high deman) and financial stability benefits (high salary)., 
    offering strategic insights for career development in data analysis
*/

WITH top_demanded_skills AS (
    SELECT 
    s.skill_id,
      s.skills AS skill_name,
      COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim AS sk ON sk.job_id = job_postings_fact.job_id
INNER JOIN skills_dim AS s ON s.skill_id = sk.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_work_from_home = TRUE
GROUP BY s.skill_id 
ORDER BY demand_count DESC

), top_paying_skills AS (
        SELECT  
        sd.skill_id,
        sd.skills AS skill_name,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary

        FROM job_postings_fact
        INNER JOIN skills_job_dim AS sjd ON sjd.job_id = job_postings_fact.job_id   
        INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
        WHERE job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
        AND job_postings_fact.job_work_from_home = TRUE
        GROUP BY
        sd.skill_id

)

SELECT 
    top_demanded_skills.skill_id,
    top_demanded_skills.skill_name,
    top_demanded_skills.demand_count,
    top_paying_skills.avg_salary
FROM top_demanded_skills
INNER JOIN top_paying_skills ON top_demanded_skills.skill_id = top_paying_skills.skill_id
WHERE demand_count > 10
ORDER BY  top_paying_skills.avg_salary DESC,top_demanded_skills.demand_count
LIMIT 25;

-- rewrittent the same query concisely to avoid redundancy and improve readability

SELECT 
    sjd.skill_id,
    sk.skills,
    COUNT(jp.job_id) AS demand_count,
    ROUND(AVG(jp.salary_year_avg), 0) AS average_salary
FROM job_postings_fact AS jp
INNER JOIN skills_job_dim AS sjd ON sjd.job_id = jp.job_id
INNER JOIN skills_dim AS sk ON sk.skill_id = sjd.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    sjd.skill_id,sk.skills
HAVING 
    COUNT(jp.job_id)>10
ORDER BY
    average_salary DESC, demand_count ASC
LIMIT 25;
