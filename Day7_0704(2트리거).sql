--�����ͺ��̽� Ʈ���� :insert,update,delete �� �� �����ϴ� ���ν���
--  Ư�� ���̺� �����ִ� ��ü

CREATE OR REPLACE TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom		--Ʈ���Ű� �����ϴ� ����
BEGIN 
	IF TO_CHAR(sysdate,'HH24:MI') BETWEEN '13:00' AND '15:00' THEN 	
		raise_application_error(-20000,'���� ���� 1~3�ô� �۾��Ҽ� �����ϴ�.');
	END IF;
	
END;

DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='twice';

CREATE TABLE TBL_TEMP 
AS
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID ='0';
CREATE OR REPLACE TRIGGER cancel_buy
AFTER DELETE ON tbl_buy --����(����)�ϴ� ���� ������ �϶�, :OLD UPDATE �Ǵ� DELETE �ϱ� �� ��, :NEW �� INSERT ��
BEGIN 
	--���� ���(tbl_buy���̺��� ����)�� ������ tbl_temp �ӽ����̺� insert:
	INSERT INTO TBL_TEMP 
	VALUES
	(:OLD custom_id,:OLD.pcode,:OLD.quantity, :OLD.buy_date, :OLD,buyno);
END;
--Ʈ���� ������ �׽�Ʈ

DELETE FROM TBL_BUY tb WHERE CUSTOM_ID ='wodner';
SELECT * FROM tbl_temp;

--Ʈ���� ��Ȱ��ȭ

ALTER TRIGGER secure_custom ENABLE;

--�߰� VIEW ���� ����
CREATE VIEW v_buy
AS
SELECT tb.custom_id, tb.pcode ,tc.name, tc.email, tb.quantity
FROM tbl_buy tb, tbl_custom tc
WHERE tb.CUSTOM_ID =tc.CUSTOM_ID ;


SELECT * FROM v_buy;
