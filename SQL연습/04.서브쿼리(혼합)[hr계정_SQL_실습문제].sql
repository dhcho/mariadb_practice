-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
SELECT COUNT(*)
  FROM salaries
 WHERE salary > (SELECT AVG(salary) FROM salaries WHERE to_date = '9999-01-01')
   AND to_date = '9999-01-01';

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
SELECT A.emp_no, 
	   CONCAT(C.first_name, ' ', C.last_name) AS name,
       D.dept_name,
	   MAX(A.salary)
FROM salaries A
	INNER JOIN dept_emp B ON A.emp_no = B.emp_no
    INNER JOIN employees C ON A.emp_no = C.emp_no
    INNER JOIN departments D ON B.dept_no = D.dept_no
    WHERE A.to_date = '9999-01-01'
      AND B.to_date = '9999-01-01'
    GROUP BY B.dept_no
    ORDER BY MAX(A.salary) DESC;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
SELECT C.emp_no,
	   CONCAT(C.first_name, ' ', C.last_name) AS name,
       A.salary
  FROM salaries A
  INNER JOIN dept_emp B ON A.emp_no = B.emp_no
  INNER JOIN employees C ON A.emp_no = C.emp_no
  INNER JOIN (SELECT B.dept_no, AVG(A.salary) AS avg_salary
	FROM salaries A
	INNER JOIN dept_emp B ON A.emp_no = B.emp_no
	WHERE A.to_date = '9999-01-01'
		AND B.to_date = '9999-01-01'
	GROUP BY B.dept_no) D ON B.dept_no = D.dept_no
  WHERE A.to_date = '9999-01-01'
    AND B.to_date = '9999-01-01'
    AND A.salary > D.avg_salary;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
SELECT A.emp_no,
	   CONCAT(A.first_name, ' ', A.last_name) AS name,
       CONCAT(D.first_name, ' ', D.last_name) AS manager_name,
       E.dept_name
  FROM employees A
  INNER JOIN dept_emp B ON A.emp_no = B.emp_no
  INNER JOIN dept_manager C ON B.dept_no = C.dept_no
  INNER JOIN employees D ON C.emp_no = D.emp_no
  INNER JOIN departments E ON B.dept_no = E.dept_no
  WHERE B.to_date = '9999-01-01'
    AND C.to_date = '9999-01-01';

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
SELECT C.dept_name,
	   D.emp_no,
	   CONCAT(D.first_name, ' ', D.last_name) AS name,
       E.title,
       A.salary
  FROM salaries A
  INNER JOIN dept_emp B ON A.emp_no = B.emp_no
  INNER JOIN departments C ON B.dept_no = C.dept_no
  INNER JOIN employees D ON A.emp_no = D.emp_no
  INNER JOIN titles E ON D.emp_no = E.emp_no
  WHERE B.dept_no = (SELECT TX.dept_no
						FROM (
							SELECT X.dept_no,
							MAX(X.avg_salary) AS MAX_AVG_SALARY
							FROM (
								SELECT B.dept_no,
									AVG(A.salary) as avg_salary
								FROM salaries A
								INNER JOIN dept_emp B ON A.emp_no = B.emp_no
								WHERE A.to_date = '9999-01-01'
								  AND B.to_date = '9999-01-01'
								GROUP BY B.dept_no
								) X
							) TX
						)
	ORDER BY A.salary DESC;

-- 문제6.
-- 평균 연봉이 가장 높은 부서는?
SELECT max_dept.dept_nm, 
	   MAX(max_dept.avg_salary)
  FROM (
		SELECT AVG(salary) AS avg_salary,
			   C.dept_name AS dept_nm
		  FROM salaries A
		INNER JOIN dept_emp B ON A.emp_no = B.emp_no
        INNER JOIN departments C ON B.dept_no = C.dept_no
		GROUP BY B.dept_no
) max_dept;

-- 문제7.
-- 평균 연봉이 가장 높은 직책?
SELECT max_title.title_nm, 
	   MAX(max_title.avg_salary)
  FROM (
		SELECT AVG(salary) AS avg_salary,
			   B.title AS title_nm
		  FROM salaries A
		INNER JOIN titles B ON A.emp_no = B.emp_no
		GROUP BY B.title
) max_title;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

SELECT F.dept_name,
	   CONCAT(C.first_name, ' ', C.last_name) AS name,
       A.salary,
       CONCAT(E.first_name, ' ', E.last_name) AS manager_name,
       D.salary AS manager_salary
  FROM salaries A
  INNER JOIN dept_emp B ON A.emp_no = B.emp_no
  INNER JOIN employees C ON A.emp_no = C.emp_no
  INNER JOIN (SELECT B.dept_no, B.emp_no, A.salary
	FROM salaries A
	INNER JOIN dept_manager B ON A.emp_no = B.emp_no
	WHERE A.to_date = '9999-01-01'
		AND B.to_date = '9999-01-01'
	GROUP BY B.dept_no) D ON B.dept_no = D.dept_no
  INNER JOIN employees E ON D.emp_no = E.emp_no
  INNER JOIN departments F ON B.dept_no = F.dept_no
  WHERE A.to_date = '9999-01-01'
    AND B.to_date = '9999-01-01'
    AND A.salary > D.salary;