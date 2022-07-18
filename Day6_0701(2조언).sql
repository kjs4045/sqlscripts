--����, custom_id 'mini012' �� ������ ���� ��ȸ: pcode ��ȸ�ϰ� pname�� �� �� ����.
SELECT pcode FROM tbl_buy WHERE custom_id = 'mina012';

--1. ��������(select �ȿ� select�� �����.)
SELECT pname form tbl_product tp  --�ܺ�����
		WHERE pcode =           --���ǽ��� = �����̹Ƿ� ���������� 1�� �� ����̾�� ��
		 (SELECT pcode FROM tbl_buy tb WHERE custom_id ='mina012'  --���� ����
		 			AND buy_date = '2022-2-6');   
SELECT pname FROM tbl_product tp
	WHERE pcode IN      --���ǽ��� IN �����̹Ƿ� ���������� ������ �� ��� ������.
	(SELECT pcode FROM tbl_buy tb WHERE custom_id = 'mina012');

--�׽�Ʈ
SELECT pcdoe FROM tbl_buy tb WHERE cuutom_id = 'mina012'    --���� ����
						AND buy_date = '2022-2-6';
						
SELECT pcode FROM tbl_buy tb WHERE custom_id = 'mina012';

-- �������� ������ : �ܺ������� ���ǽ��� ����࿡ ���� �˻��Ҷ����� ���������� ����ǹǷ�
--		  ó�� �ӵ��� ������ ����ϴ�. --> ���̺��� ���� ���� ������� �����մϴ�. 

-- 2. SELECT �� ���̺� JOIN : �� �̻��� ���̺�(�ַ� ���������� ���̺�)�� �����Ͽ� �����͸� ��ȸ�ϴ� ���
-- ���� ���� : �� �̻��� ���̺��� ����� �÷��� ���� �� �÷����� '����(=)'�� �̿��Ͽ� join �մϴ�.
-- ����1 : select ~~~ from ���̺�1 a,���̺�2 b 
--					where a.�����÷�1=b.�����÷�1;
--������ ���� ��ǰ �߰�
INSERT INTO TBL_PRODUCT VALUES ('GALAXYS22','A1','������S22',555600)



SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb 
		WHERE tp.PCODE = tb.PCODE ;  --���� ����.
		
-- join Ű���带 ���� ��ɹ� ����2(ansiǥ��)		
SELECT * FROM TBL_PRODUCT tp 
		JOIN TBL_BUY tb 
		ON tp.PCODE =tb.PCODE ;

--���� �׽�Ʈ :tbl_custom �� tbl_buy�� �����غ�����.
--1
SELECT * FROM TBL_CUSTOM tc, TBL_BUY tb
		WHERE tc.CUSTOM_ID  = tb.CUSTOM_ID ;
	
--2
SELECT * FROM  TBL_CUSTOM tc  JOIN TBL_BUY tb  ON tc.CUSTOM_ID =tb.CUSTOM_ID ;
	
--������ ������� Ư�� �÷��� ��ȸ
SELECT tc.custom_id .name,reg_date ,pcode,quantity FROM tbl_custom tc, tbl_buy tb
	WHERE tc.CUSTOM_ID =tb.CUSTOM_ID ;

--�������� �ܿ� �ٸ� ������ �߰�
SELECT tc.custom_id,name,reg_date ,pcode,quantity
	FROM TBL_CUSTOM tc ,TBL_BUY tb 	
	WHERE tc.CUSTOM_ID =tb.CUSTOM_ID AND tc.CUSTOM_ID ='mina012';



--mina012�� ������ ��ǰ���� �����ΰ� ��ȸ�ϱ�
SELECT tp.pname FROM TBL_PRODUCT tp , TBL_BUY tb 
	WHERE tp.PNAME = tb.PCODE AND custom_id = 'mina012';

--mina012�� ������ ��ǰ��� ���� ��ȸ�ϱ�
SELECT tp.pname,tp.PRICE  FROM TBL_PRODUCT tp , TBL_BUY tb 
	WHERE tp.PNAME = tb.PCODE AND custom_id = 'mina012';

SELECT tp.pname FROM TBL_PRODUCT tp , TBL_BUY tb 
		ON tp.PCODE =tb.PCODE AND custom_id ='mina0123' AND buy_date = '2022-2-6';
	
	-- �����ҋ� , �̸��� ���� �÷��� ���̺���� �� �����ؾ��մϴ�.
	
-- 3���� ���̺��� ������ �� �������
SELECT * FROM TBL_PRODUCT tp ,	
(SELECT tc.custom_id cusid, name, emial, age,reg_date, pcode,quantity,buy_date,buyno
	FROM TBL_CUSTOM tc ,TBL_BUY tb 
		WHERE tc.CUSTOM_ID =TBL_CUSTOM ) temp;  --ù��° ����
WHERE tp.pcode = temp.pcode ;	 --�ι��� ����
	

SELECT * FROM TBL_BUY tb ,TBL_CUSTOM tc ,TBL_PRODUCT tp 
	WHERE  tb.CUSTOM_ID =tc.CUSTOM_ID  AND tp.PCODE =tb.PCODE ;
	
--Ư�� �÷��� ��ȸ�ϱ�
SELECT tb.custom_id ,tb.pcode, name, age, pname,quantity,buy_Date
	FROM TBL_BUY tb ,TBL_CUSTOM tc ,TBL_PRODUCT tp 
		WHERE tc.CUSTOM_ID =tb.CUSTOM_ID AND tp.PCODE = tb.PCODE ;
		
	--3�ܺ� ����(outer join) : = ������ ����ϴ� �����̳� ���ʿ� ���°��� ���ΰ���� ����.
	--join Ű���� ���� ����1
SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb 
		WHERE tp.PCODE = tb.PCODE(+) ;  --�ܺ� ���� tbl_buy ���̺� ��ġ�ϴ� pcode ���̤� ��� ����.
		--join ������ nill �� �Ǵ� ���̺��� �÷��� (+)��ȣ
		
-- join Ű���带 ���� ��ɹ� ����2(ansiǥ��)		
SELECT * FROM TBL_PRODUCT tp 
		LEFT OUTER JOIN TBL_BUY tb 
		ON tp.PCODE =tb.PCODE ;  --TBL_PRODUCT �� ���� ���̺��̸� �� ���� �� �����Ͽ� ����

SELECT * FROM  TBL_BUY tb 
		RIGHT OUTER JOIN TBL_PRODUCT tp
		ON tb.PCODE =tp.PCODE ;