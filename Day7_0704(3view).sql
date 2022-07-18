---- view : 가상 테이블(물리적으로 존재하지 않고 논리적으로 만들어진 테이블)
--          ㄴ 물리적인 테이블을 이용해서 생성합니다.
--			ㄴ 사용자(개발자)가 테이블처럼 select 를 조회를 할수 있는 테이블
--				자주 사용되는 join 등을 미리 view 해서 사용합니다
--			ㄴ grant CREATE VIEW to c##idev;   -> 뷰 생성 권한 없는 오류 생기면 추가 권한 부여 하세요

CREATE VIEW v_dept
AS
SELECT d.department_id, department_name, e.employee_id ,e.first_name ,e.hire_date, e.job_id
FROM DEPARTMENTS d ,EMPLOYEES e 
WHERE d.DEPARTMENT_ID =e.DEPARTMENT_ID ;

SELECT * FROM v_dept WHERE job_id = 'ST_CLERK';