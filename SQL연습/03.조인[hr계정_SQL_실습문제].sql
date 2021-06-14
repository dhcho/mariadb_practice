-- 테이블간 조인(JOIN) SQL 문제입니다.

-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
SELECT A.emp_no AS '사번',
	   CONCAT(A.first_name, ' ' , A.last_name) AS '이름',
       B.salary AS '연봉'
  FROM employees A
  INNER JOIN salaries B ON A.emp_no = B.emp_no
  WHERE B.to_date = '9999-01-01'
  ORDER BY B.salary DESC;

-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
SELECT A.emp_no AS '사번',
	   CONCAT(A.first_name, ' ', A.last_name) AS '이름',
       B.title AS '직책'
  FROM employees A
  INNER JOIN titles B ON A.emp_no = B.emp_no
  WHERE B.to_date = '9999-01-01'
  ORDER BY A.first_name ASC;

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..
SELECT A.emp_no AS '사번',
	   CONCAT(A.first_name, ' ', A.last_name) AS '이름',
       C.dept_name AS '부서'
  FROM employees A
  INNER JOIN dept_emp B ON A.emp_no = B.emp_no
  INNER JOIN departments C ON B.dept_no = C.dept_no
  ORDER BY A.first_name ASC;

-- 문제4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.
SELECT A.emp_no AS '사번',
	   CONCAT(A.first_name, ' ', A.last_name) AS '이름',
       B.salary AS '연봉',
       C.title AS '직책',
       E.dept_name AS '부서'
  FROM employees A
  INNER JOIN salaries B ON A.emp_no = B.emp_no
  INNER JOIN titles C ON A.emp_no = C.emp_no
  INNER JOIN dept_emp D ON A.emp_no = D.emp_no
  INNER JOIN departments E ON D.dept_no = E.dept_no
  WHERE B.to_date = '9999-01-01'
    AND D.to_date = '9999-01-01'
  ORDER BY A.first_name;

-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력 합니다.
SELECT A.emp_no AS '사번',
	   CONCAT(A.first_name, ' ', A.last_name) AS '이름'
  FROM employees A
  INNER JOIN titles B ON A.emp_no = B.emp_no
  WHERE B.to_date != '9999-01-01'
	AND B.title = 'Technique Leader';

-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
SELECT CONCAT(A.first_name, ' ', A.last_name) AS '이름',
	   C.dept_name AS '부서명',
       D.title AS '직책'
  FROM employees A
  INNER JOIN dept_emp B ON A.emp_no = B.emp_no
  INNER JOIN departments C ON B.dept_no = C.dept_no
  INNER JOIN titles D ON A.emp_no = D.emp_no
  WHERE A.last_name LIKE 'S%'
    AND B.to_date = '9999-01-01'
    AND D.to_date = '9999-01-01';

-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
SELECT A.emp_no AS '사번',
	   CONCAT(A.first_name, ' ', A.last_name) AS '이름',
       B.title AS '직책',
       C.salary AS '급여'
  FROM employees A
  INNER JOIN titles B ON A.emp_no = B.emp_no
  INNER JOIN salaries C ON A.emp_no = C.emp_no
  WHERE B.to_date = '9999-01-01'
    AND C.to_date = '9999-01-01'
    AND B.title = 'Engineer'
    AND salary >= 40000
  ORDER BY salary DESC;

-- 문제8.
-- 현재 급여가 50000이 넘는 직책을 직책, 급여로 급여가 큰 순서대로 출력하시오.
SELECT A.emp_no AS '사번',
	   A.title AS '직책',
       B.salary AS '급여'
  FROM titles A
  INNER JOIN salaries B ON A.emp_no = B.emp_no
  WHERE A.to_date = '9999-01-01'
    AND B.to_date = '9999-01-01'
    AND B.salary > 50000
  ORDER BY salary DESC;

-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
SELECT B.dept_name AS '부서', 
	   AVG(C.salary) AS '평균연봉'
  FROM dept_emp A
  INNER JOIN departments B ON A.dept_no = B.dept_no
  INNER JOIN salaries C ON A.emp_no = C.emp_no
  WHERE A.to_date = '9999-01-01'
    AND C.to_date = '9999-01-01'
  GROUP BY A.dept_no
  ORDER BY AVG(C.salary) DESC;

-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
SELECT A.title AS '직책',
	   AVG(B.salary) AS '평균연봉'
  FROM titles A
  INNER JOIN salaries B ON A.emp_no = B.emp_no
  WHERE A.to_date = '9999-01-01'
    AND B.to_date = '9999-01-01'
  GROUP BY A.title
  ORDER BY AVG(B.salary) DESC;
  