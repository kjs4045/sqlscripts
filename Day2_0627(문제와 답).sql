/*
1. hire_date가 2006년 1월 1일 이전인 직원의 이름,성,이메일

2. lastname이 'Jones' 인 직원의 모든 컬럼

3. salary 가 5000 이상인 직원의 이름,성,JOB_ID 조회

4. JOB_ID 에 ACCOUNT 가 들어가는 직원의 이름,성,salary 조회

5. 부서_ID 가 50 ,60, 80,90 인 직원의 직원_ID, 이름,성 조회
*/

--1
SELECT FIRST_NAME ,LAST_NAME ,EMAIL  FROM EMPLOYEES e  WHERE HIRE_DATE  <'2006-01-01';

--2
SELECT * FROM EMPLOYEES e  WHERE LAST_NAME  = 'Jones';
--대소문자 검사는 조건식에 주의해야합니다.
--칼럼값을 대소문자 변환 후 조건 값 비교 -> 대소문자 무관하게 검사하는 방법
SELECT * FROM EMPLOYEES e WHERE UPPER(LAST_NAME)  = 'JONES';
SELECT * FROM EMPLOYEES e WHERE LOWER(LAST_NAME)  = 'jones';


--3
SELECT FIRST_NAME ,LAST_NAME ,JOB_ID  FROM EMPLOYEES e WHERE SALARY >=5000;

--4
SELECT FIRST_NAME ,LAST_NAME ,SALARY  FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';

--5
SELECT EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME  FROM EMPLOYEES e WHERE DEPARTMENT_ID IN(50,60,80,90);

SELECT * FROM EMPLOYEES e WHERE DEPARTMENT_ID =60;
SELECT * FROM EMPLOYEES e WHERE DEPARTMENT_ID ='60'; -- 컬럼 형식에 따라 변환

--통계 함수 : COUNT,AVG,MAX,MIN, 통계함수는 그룹함수라고도 합니다.
--			해당 함수 결과값을 구하기 위해 특정 컬럼 사용하여 여러 데이터를 그룹화한 후 실행.

SELECT COUNT(*) FROM EMPLOYEES e ;			--테이블 전체 데이터 갯수	: 107
SELECT MAX(salary) FROM EMPLOYEES e ;		--salary 컬럼의 최대값	: 24000
SELECT min(salary) FROM EMPLOYEES e ;		--			최소값  	: 2100
SELECT avg(salary) FROM EMPLOYEES e ;		--			평균값	: 6461.83...
SELECT SUM (salary) FROM EMPLOYEES e ;		--			합계		: 691,416...

--위 5개 통계함수를 job_id = 'it_prog' 값을 조건식으로 독같이 실행해보기
SELECT COUNT(*) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--5
SELECT max(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--9000
SELECT min(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--4200
SELECT avg(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--5760
SELECT sum(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--28800

--통계함수 결과는 다른 컬럼값가 같이 조회 못합니다 (그룹함수이기 떄문입니다.)
SELECT JOB_ID , COUNT(*) FROM EMPLOYEES e 
WHERE JOB_ID ='IT PROG';


--오늘의 요약 : create table, insert into, select ~ where ~ 기본형식

--참고 : 별칭(alias). 컬럼 또는 테이블 이름이 길 때 짧게 줄여서 쓰는 이름.
SELECT * FROM  EMPLOYEES e ;       --EMPLOYEES 테이블의 별칭 e
SELECT * FROM  DEPARTMENTS d ; 	   --DEPARTMENTS 테이블의 별칭 d
