-- 주제 : 행을 그룹화 합니다. 사용하는 순서는 아래처럼 합니다.
-- SELECT 문
-- [where] 그룹호ㅓㅏ 하기 전에 사용할 조건식
-- group by 그룹화에 사용할 컬럼명
-- [having] 그룹화 결과에 대한 조건식
-- [order by] 그룹화 결과 정렬할 컬럼명과 방식
SELECT PCODE  COUNT(*) FROM TBL_BUY tb GROUP by PCODE ;

SELECT PCODE  COUNT(*) ,sum(QUANTITY)
FROM TBL_BUY tb 
GROUP by PCODE 
ORDER BY 2;			--조회된 컬럼의 위치

SELECT PCODE,  COUNT(*)cnt ,sum(QUANTITY) total
FROM TBL_BUY tb 
GROUP by PCODE 
ORDER BY cnt;			--그룹함수 결과의 별칭

--그룹화 후에 수량합계가 3 이상만 조회
SELECT PCODE,  COUNT(*) cnt,sum(QUANTITY) total
FROM TBL_BUY tb 
GROUP by PCODE 
-- HAVING total >=3        --having 에는 컬럼 별칭 사용 못함. 테이블 컬럼명은 사용할 수 있음.
HAVING SUM(QUANTITY) >=3 
ORDER BY cnt;			       --그룹함수 결과의 별칭

--구매 날짜가 2022-04-01 이후인 것만 그룹화하여
SELECT pcode, count(*) cnt,SUM(qunatity) total
	FROM TBL_BUY tb 
	WHERE BUY_DATE >= '2022-04-01'
	GROUP BY PCODE
	ORDER BY cnt;






--통계 함수 : count,avg,max,min. 통계함수는 그룹함수라고도 합니다.
--			해당 함수 결과값을 구하기 위해 특정 컬럼 사용하여 여러 데이터를 그룹화한후 실행.
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