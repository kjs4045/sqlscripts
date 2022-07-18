--데이터베이스 트리거 :insert,update,delete 할 때 동작하는 프로시저
--  특정 테이블에 속해있는 객체

CREATE OR REPLACE TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom		--트리거가 동작하는 시점
BEGIN 
	IF TO_CHAR(sysdate,'HH24:MI') BETWEEN '13:00' AND '15:00' THEN 	
		raise_application_error(-20000,'지금 오후 1~3시는 작업할수 없습니다.');
	END IF;
	
END;

DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='twice';

CREATE TABLE TBL_TEMP 
AS
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID ='0';
CREATE OR REPLACE TRIGGER cancel_buy
AFTER DELETE ON tbl_buy --만족(적용)하는 행이 여러개 일때, :OLD UPDATE 또는 DELETE 하기 전 값, :NEW 는 INSERT 한
BEGIN 
	--구매 취소(tbl_buy테이블에서 삭제)한 데이터 tbl_temp 임시테이블에 insert:
	INSERT INTO TBL_TEMP 
	VALUES
	(:OLD custom_id,:OLD.pcode,:OLD.quantity, :OLD.buy_date, :OLD,buyno);
END;
--트리거 동ㅈ악 테스트

DELETE FROM TBL_BUY tb WHERE CUSTOM_ID ='wodner';
SELECT * FROM tbl_temp;

--트리거 비활성화

ALTER TRIGGER secure_custom ENABLE;

--추가 VIEW 생성 연습
CREATE VIEW v_buy
AS
SELECT tb.custom_id, tb.pcode ,tc.name, tc.email, tb.quantity
FROM tbl_buy tb, tbl_custom tc
WHERE tb.CUSTOM_ID =tc.CUSTOM_ID ;


SELECT * FROM v_buy;
