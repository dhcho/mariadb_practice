-- 기본 SQL 문제입니다.

-- 문제1.
-- 사번이 10944인 사원의 이름은(전체 이름)
SELECT concat(first_name, ' ' , last_name) AS '전체이름' 
FROM employees 
WHERE emp_no = '10944';

-- 문제2. 
-- 전체직원의 다음 정보를 조회하세요. 가장 선임부터 출력이 되도록 하세요. 출력은 이름, 성별,  입사일 순서이고 “이름”, “성별”, “입사일로 컬럼 이름을 대체해 보세요.
SELECT concat(first_name, ' ', last_name) AS '이름',
	   gender AS '성별',
       hire_date AS '입사일'
FROM employees
ORDER BY hire_date ASC;

-- 문제3.
-- 여직원과 남직원은 각 각 몇 명이나 있나요?
SELECT gender AS 성별,
	   COUNT(*) AS 인원수
FROM employees
GROUP BY gender;

-- 문제4.
-- 현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.) 
SELECT COUNT(EMP_NO) 
FROM (
	SELECT DISTINCT(emp_no) AS EMP_NO
	FROM salaries
	WHERE to_date = '9999-01-01'
	GROUP BY emp_no
) AS TEMP_EMP;

-- 문제5.
-- 부서는 총 몇 개가 있나요?
SELECT COUNT(dept_no) AS 부서수
FROM departments;

-- 문제6.
-- 현재 부서 매니저는 몇 명이나 있나요?(역임 매너저는 제외)
SELECT COUNT(*) 
FROM dept_manager
WHERE TO_DATE = '9999-01-01';

-- 문제7.
-- 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요.
SELECT *
FROM departments
ORDER BY length(dept_name) DESC;

-- 문제8.
-- 현재 급여가 120,000이상 받는 사원은 몇 명이나 있습니까?
SELECT COUNT(EMP_NO)
FROM (
	SELECT DISTINCT(emp_no) AS EMP_NO
	FROM salaries
	WHERE salary > 120000
	AND to_date = '9999-01-01'
) AS TEMP_EMP_NO;

-- 문제9.
-- 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해 보세요.
SELECT DISTINCT(TITLE) 
FROM titles
ORDER BY length(title) DESC;

-- 문제10
-- 현재 Enginner 직책의 사원은 총 몇 명입니까?
SELECT COUNT(*)
FROM titles
WHERE title = 'Engineer'
AND to_date = '9999-01-01';

-- 문제11
-- 사번이 13250(Zeydy)인 지원이 직책 변경 상황을 시간순으로 출력해보세요.
SELECT *
FROM titles
WHERE emp_no = 13250
ORDER BY FROM_DATE;
