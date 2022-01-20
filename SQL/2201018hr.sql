
SELECT * FROM employees;

-- �ǽ� 
-- 1. employees���̺��� first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT
    first_name, last_name, salary
FROM employees;

-- 2. departments���̺��� department_id, department_name, manager_id, location_id�� ��ȸ�ϼ���.
SELECT
    department_id
    , department_name
    , manager_id
    , location_id
FROM departments;

-- 3. employees���̺��� job_id�� 'IT_PROG'�� ����� first_name, job_id, department_id�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

-- 4. employees���̺��� last_name�� 'King'�� ����� first_name, last_name, hire_date�� ��ȸ�ϼ���.
SELECT 
    first_name, last_name, hire_date
FROM employees
WHERE last_name = 'King';

-- 5. employees���̺��� salary�� 15000���� ũ�ų� ���� ����� first_name, salary, hire_date�� ��ȸ�ϼ���.
SELECT 
    first_name, salary, hire_date
FROM employees
WHERE salary >= 15000;

-- 6. employees���̺��� job_id�� 'IT'�� �����ϴ� ����� first_name, last_name, job_id�� ��ȸ�ϼ���.
SELECT 
    first_name, last_name, job_id
FROM employees
WHERE job_id LIKE 'IT%';

-- 7. employees���̺��� job_id�� 'IT_PROG'�̰� salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'
    AND salary >= 5000;
    
-- 8. employees���̺��� job_id�� 'IT_PROG'�̰ų� salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT 
    first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'
    OR salary >= 5000;