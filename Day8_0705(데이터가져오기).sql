--데이터 가져오기
--  	제공되는 csv 형식의 파일을 테이블로 변환할 수 있는 기능
-- 		csv 파일은데이터 항목을, 구분하여 저장한 텍스트 파일입니다. (엑셀 또는 메모장에서 열기 가능)
--		주의 사항: 자동으로 생성되는 테이블 컬럼의 크기가 데이터보다 작지 않게 도는 적정한 타입으로 설정해야 함.

-- ANIMAL_INS 테이블 행이 80187 개 정도되면 SQL 쿼리의 실행속도 차이를 확인할 수 있습니다.
-- 		예를들면 서브쿼리와 조인의 SQL 실행시간 비교 가능합니다.

SELECT * FROM ANIMAL_INS ai ORDER BY ANIMAL_ID ;

--데이터 내보내기(export)
--			현재 데이터베이스의 테이블 구조와 행9값)들을 파일로 내보내기 합니다.
--			DDL 테이블, 시퀀스 생성 명령문과 INSERT 명령들을 만들어서 .SQL 만듭니다.

--프로그래머스 문제에서 필요한 오라클 함수 : nvl (null value) 널값을 대체하는 문자열 지정
								decode 컬럼값에 따라 출력 문자열을 지정
								안 배운 함수는 찾아보면서 하세요. 문자열 관련 함수 등등....
								
								select * from v$version;

