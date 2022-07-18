--DDL : CREATE, ALTER ,DROP, TRUNCATE 
--(대상은 USER, TABLE , SEQUENCE , VIEW, .... 단 TRUNCATE는 테이블만 사용)
--DML : INSERT, UPDATE, DELETE,SELECT -> 트랜잭션으로 관리됩니다.

DROP TABLE STU0 ;			--오류 : STU0 테이블 먼저 삭제하면
		--원인 : 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다.
DROP TABLE RECORD0 ;

--UPDATE 테이블명 SET 컬럼명 = 값,컬럼명 = 값,컬럼명 = 값,..... 
-- WHERE 조건컬럼 관계식
--DELETE FROM 테이블명 WHERE 조건컬럼 관계식
--주의 할점 : UPDATE와 DELETE는 WHERE없이 사용하는 것은 위험한 동작.
-- 			모든 데이터를 삭제할떄는 DELETE 대신에 TRUNCATE 사용합니다.
--			TRUNCATE는 실행을 취소(ROLLBACK)할 수 없기 때문에 DDL에 속합니다.
SELECT * FROM STU0 s ;
--UPDATE, DELETE ,SELECT 에서 WHERE 의 컬럼이 기본키 컬럼이면
-- 실행되는 결과 반영되는 행은 몇개일까요? 최대 1개
-- 기본키의 목적은 TABLE의 여러행들을 구분(식별)
UPDATE STU0 SET AGE =17 WHERE STUDENT_ID =2021001;

--ROLLBACK,COMMIT 테스트 (데이터베이스 메뉴에서 트랜잭션 모드를 MANUAL로 변경합니다.)
UPDATE STU0 SET ADRESS = '성북구',AGE =16 WHERE STUDENT_ID =2021001;
ROLLBACK;        --위으 업데이트 실행을 취소              --다시 서초구,17세로 복구
SELECT * FROM STU0 s  ;

UPDATE STU0 SET ADRESS = '성북구',AGE =16 WHERE STUDENT_ID =2021001;
COMMIT;
SELECT * FROM STU0 s  ; --'성북구',16세로 반영됨.
ROLLBACK;				-- 이미 COMMIT된 명령어는 ROLLBACK 못함

DELETE FROM RECORD0 r ;
ROLLBACK;
DELETE FROM RECORD0 r WHERE STUDENT_ID =2019019;
ROLLBACK;
SELECT * FROM STU0 s ;
-- 이편집기는 트랜잭션 수동 모드이므로 SELECT 결과가 2019019가 없습니다.
-- 다른 편집기는 다른 클라이언트 이므로  이전 상태(최종 커밋한 상태)로 보여지니다.
SELECT * FROM RECORD0 r ;
DELETE FROM RECORD0;
DELETE FROM RECORD0 r WHERE STUDENT_ID =2019019;
SELECT * FROM STU0 s  ;

