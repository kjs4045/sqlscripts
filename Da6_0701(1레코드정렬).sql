--select 기본형식
--select 컬럼1,컬럼2,... from 테이블명 where 검색 조건식
--				order by 기준 컬럼 (오름:asc, 내림 :desc)

SELECT * FROM  TBL_BUY tb:		--INSERT 실행하 순서로 결과 출력
SELECT * FROM  TBL_CUSTOM tc:
SELECT * FROM  TBL_CUSTOM tc ORDER BY custom_id:
SELECT * FROM  TBL_buy tb WHERE cumstom_id = 'mina012';
SELECT * FROM  TBL_buy tb WHERE cumstom_id = 'mina012'
							ORDER BY buy_date DESK --WHERE , ORDER BY 순서 지킵니다.
							
--조회할 컬럼 지정할 떄 distinct 키워드 : 중복값은 1번만 결과 출력.
SELECT  custom_id FROM tbl_buy tb;   --구매고객 id조회
SELECT  DISTINCT custom_id FROM tbl_buy tb;      --중복값은 1번만
							



-- 조회할 컬럼 지정할 때 distinct 키워드 : 중복값은 1번만 결과 출력.