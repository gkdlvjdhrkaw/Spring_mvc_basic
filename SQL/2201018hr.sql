
SELECT * FROM employees;

-- 실습 
-- 1. employees테이블에서 first_name, last_name, salary를 조회하세요.
SELECT
    first_name, last_name, salary
FROM employees;

-- 2. departments테이블에서 department_id, department_name, manager_id, location_id를 조회하세요.
SELECT
    department_id
    , department_name
    , manager_id
    , location_id
FROM departments;

-- 3. employees테이블에서 job_id가 'IT_PROG'인 사원의 first_name, job_id, department_id를 조회하세요.
SELECT 
    first_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

-- 4. employees테이블에서 last_name이 'King'인 사원의 first_name, last_name, hire_date를 조회하세요.
SELECT 
    first_name, last_name, hire_date
FROM employees
WHERE last_name = 'King';

-- 5. employees테이블에서 salary가 15000보다 크거나 같은 사원의 first_name, salary, hire_date를 조회하세요.
SELECT 
    first_name, salary, hire_date
FROM employees
WHERE salary >= 15000;

-- 6. employees테이블에서 job_id가 'IT'로 시작하는 사원의 first_name, last_name, job_id를 조회하세요.
SELECT 
    first_name, last_name, job_id
FROM employees
WHERE job_id LIKE 'IT%';

-- 7. employees테이블에서 job_id가 'IT_PROG'이고 salary가 5000이상인 사원의
--     first_name, job_id, salary를 조회하세요.
SELECT 
    first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'
    AND salary >= 5000;
    
-- 8. employees테이블에서 job_id가 'IT_PROG'이거나 salary가 5000이상인 사원의
--     first_name, job_id, salary를 조회하세요.
SELECT 
    first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'
    OR salary >= 5000;