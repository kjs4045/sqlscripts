-- PL/SQL : Procedure(����,����)  Language, ������ �ܼ��� SQL�� Ȯ��� ���(SQL�� ����� ���α׷�)
--          ���� ��� (INF ,�ݺ���) �� ����Ͽ� ���α׷��־��� ���� SQL ������ �帧�� ����
DECLARE   -- ���������  
--	vcustomid varchar2(20);
--	vage number(3,0);
	vname tbl_custom.custom_id %TYPE;    --������ ���̺��� �÷��� ���������� ����
	vage tbl_custom.age %TYPE;
	
BEGIN		--���ν��� ����
-- ���ν��� ���ο��� �ַ� DML ��ɹ����� �ۼ�.(�Բ� �����ؾ��� ���� SQL : Ʈ�����)
	SELECT custom_id,age 
	INTO vcustomid , vage	-- ���ν��� ����: �˻������ ������ ����
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='hongGD';		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
									--������ �� ��ȸ�� ���� �ٸ� cusor �ʿ�.
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vcustomid);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�. 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;

--����Ŭ ��ü ���ν��� ����: �˻��� ���� �Ű������� �����ϱ�

CREATE OR REPLACE search_custom(       --���ν��� �̸� ����)
	custom_id IN tbl_custom.CUSTOM_ID %TYPE     --�Ű����� IN 	
												--���� �� OUT 
)
IS 
--�Ϲ� ��������
--vname tbl_custom.custom_id %TYPE;    --������ ���̺��� �÷��� ���������� ����
--	vage tbl_custom.age %TYPE;
--	
BEGIN
	SELECT custom_id,age 
	INTO vcustomid , vage	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		--1�� �ุ ��� ��ȸ�Ǵ� ����

	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vcustomid);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�. 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;
			
--���ν��� ����
BEGIN
	search_custom('wonder');	
	
END;

CREATE OR REPLACE PROCEDURE search_custom2(	-- ���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE,		-- �Ű����� IN 
	c_name OUT tbl_custom.NAME %TYPE		-- ���ϰ� ���ν��� ��� 
CREATE OR REPLACE PROCEDURE search_custom(	-- ���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE		-- �Ű����� IN 
)
IS 
	-- �Ϲ� ���� ����
	vname tbl_custom.name %TYPE;	-- ������ ���̺��� �÷��� ���������� ����
	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name,age 
	INTO vname , vage	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);  
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');	
		c_name := 'no match';     --���Թ� := ��ȣ
END;

--���(���ϰ�)�� �ִ� ���ν��� ���� :��� �� ������ ���� ���� �ʿ��մϴ�.
DECLARE
	vname tbl_custom.name %TYPE;
BEGIN
	serach_custom2('mina012',vname)				--vname�����ν��� �����ҋ� out���� ����
--	vname := search_custom2('mina012'); -�� ���� ���� �ƴմϴ�
	dmbs_output.put_line('�� �̸� : ' || vname)
	END;

--begin~ end ���� �ϳ��� Ʈ������� �����ϴ� DML(insert,update,delete ����) ��ɵ�� ����
-- 		������ ����� exception ���� rollback; ������ �������� commit;

CREATE TABLE tbl_temp
AS
SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='0';

--select �� ����� insert �ϱ�
INSERT INTO tbl_temp (SELECT * FROM TBL_CUSTOM tc WHERE custom_id='wonder');

SELECT * FROM TBL_TEMP tt;

--function ����Ŭ ��ü�� ��
--����Ŭ �Լ� : upper,lower,decode, round, to_date ,to_char...
--
