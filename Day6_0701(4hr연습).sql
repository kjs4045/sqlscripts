--조인과 grou by 를 포함해서 select 로 검색하는 문제 10 개만들기
--group by 결과로도 조인 할 수 있습니다. ex) 부서 인원이 가장 많은 무서는?

--매니저가 2명 이상인 부서 명
SELECT 
department_name,
	count(*)
	FROM DEPARTMENTS d  
	GROUP BY department_name
	HAVING count(*) >= 2;
	
--월급이 10000 이상인 것만 조회2
SELECT salary,
	COUNT(*)
	FROM EMPLOYEES e  
	GROUP BY salary 
	HAVING SALARY >= 10000;
	
--매니저인 직원 조회3
SELECT * FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE e.EMPLOYEE_ID = d.MANAGER_ID  ;
	
-- 특정 사원이 근무하는 부서 이름 조회,id 조회
SELECT d.DEPARTMENT_NAME  , 
		d.department_id,
		e.FIRST_name
	FROM DEPARTMENTS d , EMPLOYEES e 
	WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
		AND e.first_name ='Den';

--평균 급여  적은순으로 정리5
SELECT e.salary,
		e.first_name
		FROM EMPLOYEES e 
		GROUP BY SALARY ,FIRST_NAME 
		ORDER BY avg(SALARY) ASC ;

	--급여 5천이하 6
SELECT e.salary,
		e.first_name
		FROM EMPLOYEES e 
		GROUP BY SALARY ,FIRST_NAME 
		HAVING SALARY <=5000;

--d.id가 30인 직원들 이름,부서 id //부서이름을 넣고싶은데 어떻게하죠?7
SELECT  e.first_name,
		e.DEPARTMENT_ID 
		--d.department_name
	FROM EMPLOYEES e--,DEPARTMENTS d 
	GROUP BY FIRST_NAME, DEPARTMENT_ID--,department_name
	HAVING DEPARTMENT_ID=30;

-- 각 직업 별 최저임금 평균 순서 조회, (직업id,직업이름,최저임금)8
SELECT job_id,
		j.JOB_TITLE,
		j.MIN_SALARY 
		FROM JOBS j 
		GROUP BY JOB_ID,j.JOB_TITLE ,j.MIN_SALARY 
		ORDER BY AVG(j.min_salary) ASC; 
		
-- 부서 별 사원수 출력	
SELECT d.department_name
	, count(*)
	FROM EMPLOYEES e ,DEPARTMENTS d 
	WHERE d.DEPARTMENT_ID =e.DEPARTMENT_ID 
	GROUP BY d.DEPARTMENT_ID, e.DEPARTMENT_ID,d.DEPARTMENT_NAME ;
	
-- 부서 인원이 10명이 넘는 부서 출력 은~ 왜안될까
SELECT d.department_name,
	count(*)
	FROM EMPLOYEES e ,DEPARTMENTS d 
	WHERE d.DEPARTMENT_ID =e.DEPARTMENT_ID 
	GROUP BY d.DEPARTMENT_ID, e.DEPARTMENT_ID,d.DEPARTMENT_NAME 
	HAVING count(*)=>10;
	
-- IT 사원들의 모든 정보 조회
SELECT *
FROM EMPLOYEES e, DEPARTMENTS d 
WHERE d.DEPARTMENT_NAME='IT';

--IT 매니저의 모든 정보 조회??
SELECT *
FROM EMPLOYEES e ,DEPARTMENTS d 
WHERE d.DEPARTMENT_NAME ='IT'
AND d.MANAGER_ID=e.EMPLOYEE_ID ;

--IT 사원중 급여가 10000이 넘는 사원 이름 조회
SELECT FIRST_NAME,LAST_NAME 
	FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE d.DEPARTMENT_NAME ='IT'
	AND e.SALARY >=10000;

--최소 급여를 받는 사람의 first_last_nmae 컬럼 조회
SELECT FIRST_name, last_name,salary FROM EMPLOYEES e 
WHERE salary= (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG');

--부서별 평균급여를 조회합니다. 정렬은 평균급여 내림차순으로 부서_id, 부서명, 평균급여
--오라클 소수점 관련 함수 :round(반올림) , trunc(버림) , ceil(내림)

--그룹함수 조회하ㅓㄹ떄 group by 를 써야 그룹바이에 쓴 컬럼을 select 로 조회할 수 있습니다.
--  	그룹바이 컬럼외에는 다름 컬럼 셀렉 할 수 없습니다. join, 서브쿼리
--1단계 : 사용할 그룹함수  실행하기
 
SELECT DEPARTMENT_ID ,AVG(SALARY) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

--2단계: 조인하기
SELECT * FROM DEPARTMENTS d JOIN
	(SELECT DEPARTMENT_ID,AVG(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID =tavg.department_id;

--3단계: 컬럼 지정하기
SELECT d.department_id, d.department_name, ROUND(tavg.cavg,1) FROM DEPARTMENTS d 
	JOIN
	(SELECT DEPARTMENT_ID, AVG(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID  =tavg.department_id
		ORDER BY tavg.cavg DESC;
	
--4단계 : 정렬한 결과로 특정 위치 지정 : first n 은 상위 n개를 조회
SELECT d.department_id, d.department_name , ROUND(tavg.cavg,1) FROM DEPARTMENTS d 
	JOIN
	(SELECT DEPARTMENT_ID, AVG(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
	ON d. DEPARTMENT_ID = tavg.department_id
	ORDER BY tavg.cavg DESC 
	FETCH FIRST 1 ROWS ONLY;

--소수점 관련 함수: round(반올림), trunc(버림), ceil (내림)

--rownum은 가사의 컬럼으로 조회된 결과에 순차적으로 오라클이 부여하는 값입니다.
SELECT rownum,tcnt.* FROM
(SELECT department_id, count(*) cnt FROM EMPLOYEES
	gROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
    WHERE rownum >5;
   
 SELECT Rownum,tcnt. *FROM
 (SELECT department_id, count(*) cnt FROM EMPLOYEES e 
 	GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
 	WHERE rwonum = 1 ;
 
 --rownum 사용할 때 결과 확인이 안되는 예시 : rownum 1부터 시작해서 찾아갈 수 있는 조건식만 가능.
 --where rownum =3;
 --where rownum >5;
 SELECT * FROM 
 	(SELECT rownum rn,tcnt. * FROM
 	(SELECT department_id, count(*) cnt FROM EMPLOYEES e 
 	GROUP BY DEPARTMENT_ID ORDER BY cnt desc) tcnt)
 	WHERE rn BETWEEN 5 AND 9;
	