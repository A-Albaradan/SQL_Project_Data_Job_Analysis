/*what top paying data analysts jobs?
-identify the top 10 highest paying DA jobs that are availabe remotely.
-remove nulls from salaries */

SELECT 
    jpf.job_id,
    jpf.job_title,
    company_dim.name AS company_name,
    jpf.job_location,
    jpf.job_schedule_type,
    jpf.salary_year_avg,
    jpf.job_posted_date :: DATE
FROM 
    job_postings_fact jpf
LEFT JOIN company_dim ON jpf.company_id = company_dim.company_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
ORDER BY
    salary_year_avg DESC
LIMIT 10