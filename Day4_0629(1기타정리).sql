--DDL : CREATE, ALTER ,DROP, TRUNCATE 
--(����� USER, TABLE , SEQUENCE , VIEW, .... �� TRUNCATE�� ���̺� ���)
--DML : INSERT, UPDATE, DELETE,SELECT -> Ʈ��������� �����˴ϴ�.

DROP TABLE STU0 ;			--���� : STU0 ���̺� ���� �����ϸ�
		--���� : �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�.
DROP TABLE RECORD0 ;

--UPDATE ���̺�� SET �÷��� = ��,�÷��� = ��,�÷��� = ��,..... 
-- WHERE �����÷� �����
--DELETE FROM ���̺�� WHERE �����÷� �����
--���� ���� : UPDATE�� DELETE�� WHERE���� ����ϴ� ���� ������ ����.
-- 			��� �����͸� �����ҋ��� DELETE ��ſ� TRUNCATE ����մϴ�.
--			TRUNCATE�� ������ ���(ROLLBACK)�� �� ���� ������ DDL�� ���մϴ�.
SELECT * FROM STU0 s ;
--UPDATE, DELETE ,SELECT ���� WHERE �� �÷��� �⺻Ű �÷��̸�
-- ����Ǵ� ��� �ݿ��Ǵ� ���� ��ϱ��? �ִ� 1��
-- �⺻Ű�� ������ TABLE�� ��������� ����(�ĺ�)
UPDATE STU0 SET AGE =17 WHERE STUDENT_ID =2021001;

--ROLLBACK,COMMIT �׽�Ʈ (�����ͺ��̽� �޴����� Ʈ����� ��带 MANUAL�� �����մϴ�.)
UPDATE STU0 SET ADRESS = '���ϱ�',AGE =16 WHERE STUDENT_ID =2021001;
ROLLBACK;        --���� ������Ʈ ������ ���              --�ٽ� ���ʱ�,17���� ����
SELECT * FROM STU0 s  ;

UPDATE STU0 SET ADRESS = '���ϱ�',AGE =16 WHERE STUDENT_ID =2021001;
COMMIT;
SELECT * FROM STU0 s  ; --'���ϱ�',16���� �ݿ���.
ROLLBACK;				-- �̹� COMMIT�� ��ɾ�� ROLLBACK ����

DELETE FROM RECORD0 r ;
ROLLBACK;
DELETE FROM RECORD0 r WHERE STUDENT_ID =2019019;
ROLLBACK;
SELECT * FROM STU0 s ;
-- ��������� Ʈ����� ���� ����̹Ƿ� SELECT ����� 2019019�� �����ϴ�.
-- �ٸ� ������� �ٸ� Ŭ���̾�Ʈ �̹Ƿ�  ���� ����(���� Ŀ���� ����)�� �������ϴ�.
SELECT * FROM RECORD0 r ;
DELETE FROM RECORD0;
DELETE FROM RECORD0 r WHERE STUDENT_ID =2019019;
SELECT * FROM STU0 s  ;

