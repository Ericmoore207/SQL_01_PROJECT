/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
v - Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT 
      jp.job_id,
      jp.job_title,
      jp.salary_year_avg,
      cd.name AS company_name
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
     LIMIT 10
)
SELECT 
  top_paying_jobs.*,
  skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
;

/* 
RESULT::::
Here is the breakdown of the most demanded skills for data analyst , based on job posting:
1. SQL: Required for 9 roles (most in-demand skill).
2. Tableau: Required for 7 roles (popular for visualization).
3. Python: Required for 6 roles (critical for analysis and scripting).
4. R: Required for 5 roles (useful for statistical computing).
5. SAS: Required for 4 roles (used for advanced analytics).
6. Power BI: Required for 4 roles (another popular visualization tool).
7. MongoDB: Required for 2 roles (indicates database handling).
8. Excel: Required for 2 roles (classic spreadsheet tool).
9. Oracle: Required for 2 roles (database management).
10. PostgreSQL: Required for 1 role (another database tool).

[
  {
    "job_id": 262837,
    "job_title": "Quantitative Scientist (Remote)",
    "salary_year_avg": "132500.0",
    "company_name": "Portas Consulting",
    "skills": "sql"
  },
  {
    "job_id": 262837,
    "job_title": "Quantitative Scientist (Remote)",
    "salary_year_avg": "132500.0",
    "company_name": "Portas Consulting",
    "skills": "python"
  },
  {
    "job_id": 262837,
    "job_title": "Quantitative Scientist (Remote)",
    "salary_year_avg": "132500.0",
    "company_name": "Portas Consulting",
    "skills": "r"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Title Resources",
    "skills": "sql"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Title Resources",
    "skills": "sql server"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Title Resources",
    "skills": "azure"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Title Resources",
    "skills": "databricks"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Title Resources",
    "skills": "oracle"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Title Resources",
    "skills": "tableau"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Title Resources",
    "skills": "power bi"
  },
  {
    "job_id": 467403,
    "job_title": "Healthcare Analytics Expert",
    "salary_year_avg": "114948.0",
    "company_name": "Mattel, Inc.",
    "skills": "python"
  },
  {
    "job_id": 467403,
    "job_title": "Healthcare Analytics Expert",
    "salary_year_avg": "114948.0",
    "company_name": "Mattel, Inc.",
    "skills": "r"
  },
  {
    "job_id": 467403,
    "job_title": "Healthcare Analytics Expert",
    "salary_year_avg": "114948.0",
    "company_name": "Mattel, Inc.",
    "skills": "sas"
  },
  {
    "job_id": 467403,
    "job_title": "Healthcare Analytics Expert",
    "salary_year_avg": "114948.0",
    "company_name": "Mattel, Inc.",
    "skills": "tableau"
  },
  {
    "job_id": 467403,
    "job_title": "Healthcare Analytics Expert",
    "salary_year_avg": "114948.0",
    "company_name": "Mattel, Inc.",
    "skills": "power bi"
  },
  {
    "job_id": 467403,
    "job_title": "Healthcare Analytics Expert",
    "salary_year_avg": "114948.0",
    "company_name": "Mattel, Inc.",
    "skills": "sas"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "sql"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "python"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "r"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "sas"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "javascript"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "sqlite"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "excel"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "tableau"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "sas"
  },
  {
    "job_id": 71065,
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "112500.0",
    "company_name": "Razorfish logo",
    "skills": "spss"
  },
  {
    "job_id": 43545,
    "job_title": "Data Analyst - Healthcare",
    "salary_year_avg": "100000.0",
    "company_name": "HeartFlow, Inc",
    "skills": "sql"
  },
  {
    "job_id": 43545,
    "job_title": "Data Analyst - Healthcare",
    "salary_year_avg": "100000.0",
    "company_name": "HeartFlow, Inc",
    "skills": "python"
  },
  {
    "job_id": 43545,
    "job_title": "Data Analyst - Healthcare",
    "salary_year_avg": "100000.0",
    "company_name": "HeartFlow, Inc",
    "skills": "r"
  },
  {
    "job_id": 43545,
    "job_title": "Data Analyst - Healthcare",
    "salary_year_avg": "100000.0",
    "company_name": "HeartFlow, Inc",
    "skills": "tableau"
  },
  {
    "job_id": 43545,
    "job_title": "Data Analyst - Healthcare",
    "salary_year_avg": "100000.0",
    "company_name": "HeartFlow, Inc",
    "skills": "power bi"
  },
  {
    "job_id": 735880,
    "job_title": "Data Analyst Lead - Remote",
    "salary_year_avg": "95500.0",
    "company_name": "MedOrion",
    "skills": "sql"
  },
  {
    "job_id": 735880,
    "job_title": "Data Analyst Lead - Remote",
    "salary_year_avg": "95500.0",
    "company_name": "MedOrion",
    "skills": "python"
  },
  {
    "job_id": 735880,
    "job_title": "Data Analyst Lead - Remote",
    "salary_year_avg": "95500.0",
    "company_name": "MedOrion",
    "skills": "vba"
  },
  {
    "job_id": 735880,
    "job_title": "Data Analyst Lead - Remote",
    "salary_year_avg": "95500.0",
    "company_name": "MedOrion",
    "skills": "excel"
  },
  {
    "job_id": 735880,
    "job_title": "Data Analyst Lead - Remote",
    "salary_year_avg": "95500.0",
    "company_name": "MedOrion",
    "skills": "tableau"
  },
  {
    "job_id": 735880,
    "job_title": "Data Analyst Lead - Remote",
    "salary_year_avg": "95500.0",
    "company_name": "MedOrion",
    "skills": "unity"
  },
  {
    "job_id": 354407,
    "job_title": "Data Analyst",
    "salary_year_avg": "95329.0",
    "company_name": "Néo Soft Groupe",
    "skills": "sql"
  },
  {
    "job_id": 354407,
    "job_title": "Data Analyst",
    "salary_year_avg": "95329.0",
    "company_name": "Néo Soft Groupe",
    "skills": "oracle"
  },
  {
    "job_id": 354407,
    "job_title": "Data Analyst",
    "salary_year_avg": "95329.0",
    "company_name": "Néo Soft Groupe",
    "skills": "tableau"
  },
  {
    "job_id": 354407,
    "job_title": "Data Analyst",
    "salary_year_avg": "95329.0",
    "company_name": "Néo Soft Groupe",
    "skills": "power bi"
  },
  {
    "job_id": 369634,
    "job_title": "Data Analyst - Looker",
    "salary_year_avg": "95000.0",
    "company_name": "Isthmus Software",
    "skills": "sql"
  },
  {
    "job_id": 369634,
    "job_title": "Data Analyst - Looker",
    "salary_year_avg": "95000.0",
    "company_name": "Isthmus Software",
    "skills": "mongodb"
  },
  {
    "job_id": 369634,
    "job_title": "Data Analyst - Looker",
    "salary_year_avg": "95000.0",
    "company_name": "Isthmus Software",
    "skills": "postgresql"
  },
  {
    "job_id": 369634,
    "job_title": "Data Analyst - Looker",
    "salary_year_avg": "95000.0",
    "company_name": "Isthmus Software",
    "skills": "mongodb"
  },
  {
    "job_id": 369634,
    "job_title": "Data Analyst - Looker",
    "salary_year_avg": "95000.0",
    "company_name": "Isthmus Software",
    "skills": "looker"
  },
  {
    "job_id": 258262,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Princess Sumaya University for Technology",
    "skills": "sql"
  },
  {
    "job_id": 258262,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Princess Sumaya University for Technology",
    "skills": "bigquery"
  },
  {
    "job_id": 258262,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Princess Sumaya University for Technology",
    "skills": "tableau"
  },
  {
    "job_id": 258262,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Princess Sumaya University for Technology",
    "skills": "ssrs"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Marriott Worldwide",
    "skills": "sql"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Marriott Worldwide",
    "skills": "python"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Marriott Worldwide",
    "skills": "java"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Marriott Worldwide",
    "skills": "r"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Marriott Worldwide",
    "skills": "c++"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Marriott Worldwide",
    "skills": "c#"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Marriott Worldwide",
    "skills": "matlab"
  }
]
*/