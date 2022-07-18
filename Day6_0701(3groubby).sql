-- ���� : ���� �׷�ȭ �մϴ�. ����ϴ� ������ �Ʒ�ó�� �մϴ�.
-- SELECT ��
-- [where] �׷�ȣ�ä� �ϱ� ���� ����� ���ǽ�
-- group by �׷�ȭ�� ����� �÷���
-- [having] �׷�ȭ ����� ���� ���ǽ�
-- [order by] �׷�ȭ ��� ������ �÷���� ���
SELECT PCODE  COUNT(*) FROM TBL_BUY tb GROUP by PCODE ;

SELECT PCODE  COUNT(*) ,sum(QUANTITY)
FROM TBL_BUY tb 
GROUP by PCODE 
ORDER BY 2;			--��ȸ�� �÷��� ��ġ

SELECT PCODE,  COUNT(*)cnt ,sum(QUANTITY) total
FROM TBL_BUY tb 
GROUP by PCODE 
ORDER BY cnt;			--�׷��Լ� ����� ��Ī

--�׷�ȭ �Ŀ� �����հ谡 3 �̻� ��ȸ
SELECT PCODE,  COUNT(*) cnt,sum(QUANTITY) total
FROM TBL_BUY tb 
GROUP by PCODE 
-- HAVING total >=3        --having ���� �÷� ��Ī ��� ����. ���̺� �÷����� ����� �� ����.
HAVING SUM(QUANTITY) >=3 
ORDER BY cnt;			       --�׷��Լ� ����� ��Ī

--���� ��¥�� 2022-04-01 ������ �͸� �׷�ȭ�Ͽ�
SELECT pcode, count(*) cnt,SUM(qunatity) total
	FROM TBL_BUY tb 
	WHERE BUY_DATE >= '2022-04-01'
	GROUP BY PCODE
	ORDER BY cnt;






--��� �Լ� : count,avg,max,min. ����Լ��� �׷��Լ���� �մϴ�.
--			�ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ���� ����.
SELECT COUNT(*) FROM EMPLOYEES e ;			--���̺� ��ü ������ ����	: 107
SELECT MAX(salary) FROM EMPLOYEES e ;		--salary �÷��� �ִ밪	: 24000
SELECT min(salary) FROM EMPLOYEES e ;		--			�ּҰ�  	: 2100
SELECT avg(salary) FROM EMPLOYEES e ;		--			��հ�	: 6461.83...
SELECT SUM (salary) FROM EMPLOYEES e ;		--			�հ�		: 691,416...

--�� 5�� ����Լ��� job_id = 'it_prog' ���� ���ǽ����� ������ �����غ���
SELECT COUNT(*) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--5
SELECT max(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--9000
SELECT min(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--4200
SELECT avg(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--5760
SELECT sum(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--28800