/* 
    Question: What are the top skills based on salary for data analysts?
*/

SELECT  
    sd.skills AS skill_name,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary

FROM job_postings_fact
INNER JOIN skills_job_dim AS sjd ON sjd.job_id = job_postings_fact.job_id   
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY
 sd.skills
ORDER BY
    avg_salary DESC
LIMIT 25;
/*
    SVN offers the highest average salary ($400,000), followed by Solidity ($179,000) and Couchbase ($160,515).
Specialized skills such as DataRobot, Golang, and Terraform are associated with salaries above $146,000.
High-paying Data Analyst roles often reward expertise in cloud, AI, and backend technologies in addition to core analytics skills.      

[
  {
    "skill_name": "svn",
    "avg_salary": "400000"
  },
  {
    "skill_name": "solidity",
    "avg_salary": "179000"
  },
  {
    "skill_name": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skill_name": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skill_name": "golang",
    "avg_salary": "155000"
  },
  {
    "skill_name": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skill_name": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skill_name": "vmware",
    "avg_salary": "147500"
  },
  {
    "skill_name": "terraform",
    "avg_salary": "146734"
  },
  {
    "skill_name": "twilio",
    "avg_salary": "138500"
  },
  {
    "skill_name": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skill_name": "kafka",
    "avg_salary": "129999"
  },
  {
    "skill_name": "puppet",
    "avg_salary": "129820"
  },
  {
    "skill_name": "keras",
    "avg_salary": "127013"
  },
  {
    "skill_name": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skill_name": "perl",
    "avg_salary": "124686"
  },
  {
    "skill_name": "ansible",
    "avg_salary": "124370"
  },
  {
    "skill_name": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skill_name": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skill_name": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skill_name": "notion",
    "avg_salary": "118092"
  },
  {
    "skill_name": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skill_name": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skill_name": "airflow",
    "avg_salary": "116387"
  },
  {
    "skill_name": "scala",
    "avg_salary": "115480"
  }
]

*/