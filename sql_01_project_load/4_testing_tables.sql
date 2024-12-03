--Testing and confirming all tables 
SELECT  * 
FROM company_dim
limit 50;

SELECT * 
FROM job_postings_fact
limit 50;

SELECT * 
FROM skills_dim
limit 50;

SELECT * 
FROM skills_job_dim
limit 50;