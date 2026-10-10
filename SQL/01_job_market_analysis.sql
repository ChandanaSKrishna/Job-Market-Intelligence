SELECT * FROM job_market_intelligence.job_market_cleaned;
SELECT *
FROM job_postings
LIMIT 10;
SELECT COUNT(*) AS total_records
FROM job_market_intelligence.job_postings;
-- JOB POSTINGS BY STATE--

SELECT 
    state,
    COUNT(*) AS job_count
FROM job_postings
GROUP BY state
ORDER BY job_count DESC;

-- MOST COMMON JOB TITLES--

SELECT 
    job_title,
    COUNT(*) AS job_count
FROM job_postings
GROUP BY job_title
ORDER BY job_count DESC
LIMIT 15;

-- SALARY DISCLOSURE--

SELECT 
    salary_type,
    COUNT(*) AS job_count
FROM job_postings
GROUP BY salary_type
ORDER BY job_count DESC;

-- SALARY STATISTICS--

SELECT
    COUNT(average_annual_salary) AS salary_records,
    ROUND(AVG(average_annual_salary), 2) AS average_salary,
    MIN(average_annual_salary) AS minimum_salary,
    MAX(average_annual_salary) AS maximum_salary
FROM job_postings;

-- HIGHEST PAYING JOB POSTINGS--

SELECT
    job_title,
    state,
    annual_salary_min,
    annual_salary_max,
    average_annual_salary
FROM job_postings
WHERE average_annual_salary IS NOT NULL
ORDER BY average_annual_salary DESC
LIMIT 10;

-- Analyze Data Analyst-related jobs--

SELECT
    job_title,
    state,
    average_annual_salary
FROM job_postings
WHERE LOWER(job_title) LIKE '%data analyst%'
   OR LOWER(job_title) LIKE '%business analyst%'
   OR LOWER(job_title) LIKE '%bi analyst%'
   OR LOWER(job_title) LIKE '%business intelligence%'
   OR LOWER(job_title) LIKE '%reporting analyst%'
   OR LOWER(job_title) LIKE '%data analytics%'
   OR LOWER(job_title) LIKE '%analytics analyst%';
   
   -- HOW MANY ANALYTICS RELATED JOBS--
   
   SELECT
    COUNT(*) AS analytics_job_count
FROM job_postings
WHERE LOWER(job_title) LIKE '%data analyst%'
   OR LOWER(job_title) LIKE '%business analyst%'
   OR LOWER(job_title) LIKE '%bi analyst%'
   OR LOWER(job_title) LIKE '%business intelligence%'
   OR LOWER(job_title) LIKE '%reporting analyst%'
   OR LOWER(job_title) LIKE '%data analytics%'
   OR LOWER(job_title) LIKE '%analytics analyst%';
   
   -- PERCENTAGE--
   
   SELECT
    COUNT(*) AS analytics_jobs,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM job_postings),
        2
    ) AS percentage_of_all_jobs
FROM job_postings
WHERE LOWER(job_title) LIKE '%data analyst%'
   OR LOWER(job_title) LIKE '%business analyst%'
   OR LOWER(job_title) LIKE '%bi analyst%'
   OR LOWER(job_title) LIKE '%business intelligence%'
   OR LOWER(job_title) LIKE '%reporting analyst%'
   OR LOWER(job_title) LIKE '%data analytics%'
   OR LOWER(job_title) LIKE '%analytics analyst%';
   
   --- AVERAGE SALARY BY STATE--
   
   SELECT
    state,
    COUNT(average_annual_salary) AS salary_records,
    ROUND(AVG(average_annual_salary), 2) AS avg_annual_salary
FROM job_postings
WHERE average_annual_salary IS NOT NULL
GROUP BY state
HAVING COUNT(average_annual_salary) >= 5
ORDER BY avg_annual_salary DESC;


SELECT
    COUNT(average_annual_salary) AS salary_records,
    ROUND(AVG(average_annual_salary), 2) AS avg_analytics_salary,
    MIN(average_annual_salary) AS min_analytics_salary,
    MAX(average_annual_salary) AS max_analytics_salary
FROM job_postings
WHERE average_annual_salary IS NOT NULL
  AND (
       LOWER(job_title) LIKE '%data analyst%'
    OR LOWER(job_title) LIKE '%business analyst%'
    OR LOWER(job_title) LIKE '%bi analyst%'
    OR LOWER(job_title) LIKE '%business intelligence%'
    OR LOWER(job_title) LIKE '%reporting analyst%'
    OR LOWER(job_title) LIKE '%data analytics%'
    OR LOWER(job_title) LIKE '%analytics analyst%'
  );
  
  
 -- Average salary for analytics jobs--
 
 SELECT
    COUNT(average_annual_salary) AS salary_records,
    ROUND(AVG(average_annual_salary), 2) AS avg_analytics_salary,
    MIN(average_annual_salary) AS min_analytics_salary,
    MAX(average_annual_salary) AS max_analytics_salary
FROM job_postings
WHERE average_annual_salary IS NOT NULL
  AND (
       LOWER(job_title) LIKE '%data analyst%'
    OR LOWER(job_title) LIKE '%business analyst%'
    OR LOWER(job_title) LIKE '%bi analyst%'
    OR LOWER(job_title) LIKE '%business intelligence%'
    OR LOWER(job_title) LIKE '%reporting analyst%'
    OR LOWER(job_title) LIKE '%data analytics%'
    OR LOWER(job_title) LIKE '%analytics analyst%'
  );
  
  -- Remote analytics jobs--
  
  SELECT
    COUNT(*) AS remote_analytics_jobs
FROM job_postings
WHERE state = 'Remote'
  AND (
       LOWER(job_title) LIKE '%data analyst%'
    OR LOWER(job_title) LIKE '%business analyst%'
    OR LOWER(job_title) LIKE '%bi analyst%'
    OR LOWER(job_title) LIKE '%business intelligence%'
    OR LOWER(job_title) LIKE '%reporting analyst%'
    OR LOWER(job_title) LIKE '%data analytics%'
    OR LOWER(job_title) LIKE '%analytics analyst%'
  );
  
  
  SELECT
    state,
    COUNT(*) AS analytics_jobs
FROM job_postings
WHERE (
       LOWER(job_title) LIKE '%data analyst%'
    OR LOWER(job_title) LIKE '%business analyst%'
    OR LOWER(job_title) LIKE '%bi analyst%'
    OR LOWER(job_title) LIKE '%business intelligence%'
    OR LOWER(job_title) LIKE '%reporting analyst%'
    OR LOWER(job_title) LIKE '%data analytics%'
    OR LOWER(job_title) LIKE '%analytics analyst%'
)
GROUP BY state
ORDER BY analytics_jobs DESC;
