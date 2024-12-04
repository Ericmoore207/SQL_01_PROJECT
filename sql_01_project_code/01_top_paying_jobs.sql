/* what are the top-paying data analysis jobs
 -what are the highest-paying data analysis jobs roles taht are avaliable remotely
 -focuses on jobs posting with satified salaries (remove null)
 -why? highlight the the top-paying opportunities for dat analysis offering insight into employment opportunities
 */

SELECT 
  jp.job_id,
  jp.job_title,
  jp.job_title_short,
  jp.job_location,
  jp.job_country,
  jp.job_schedule_type,
  jp.salary_year_avg,
  jp.job_posted_date,
  cd.name AS company_name,
  cd.link AS company_link
FROM 
  job_postings_fact AS jp
LEFT JOIN 
  company_dim AS cd 
ON 
  jp.job_id = cd.company_id
WHERE 
  jp.job_title_short = 'Data Analyst' 
  AND jp.job_location = 'Anywhere' 
  AND jp.salary_year_avg IS NOT NULL 
  AND cd.link IS NOT NULL
ORDER BY 
  jp.salary_year_avg DESC
LIMIT 10;
