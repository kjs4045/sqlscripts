/*
1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���

2. lastname�� 'Jones' �� ������ ��� �÷�

3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ

4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ

5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ
*/

--1
SELECT FIRST_NAME ,LAST_NAME ,EMAIL  FROM EMPLOYEES e  WHERE HIRE_DATE  <'2006-01-01';

--2
SELECT * FROM EMPLOYEES e  WHERE LAST_NAME  = 'Jones';
--��ҹ��� �˻�� ���ǽĿ� �����ؾ��մϴ�.
--Į������ ��ҹ��� ��ȯ �� ���� �� �� -> ��ҹ��� �����ϰ� �˻��ϴ� ���
SELECT * FROM EMPLOYEES e WHERE UPPER(LAST_NAME)  = 'JONES';
SELECT * FROM EMPLOYEES e WHERE LOWER(LAST_NAME)  = 'jones';


--3
SELECT FIRST_NAME ,LAST_NAME ,JOB_ID  FROM EMPLOYEES e WHERE SALARY >=5000;

--4
SELECT FIRST_NAME ,LAST_NAME ,SALARY  FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';

--5
SELECT EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME  FROM EMPLOYEES e WHERE DEPARTMENT_ID IN(50,60,80,90);

SELECT * FROM EMPLOYEES e WHERE DEPARTMENT_ID =60;
SELECT * FROM EMPLOYEES e WHERE DEPARTMENT_ID ='60'; -- �÷� ���Ŀ� ���� ��ȯ

--��� �Լ� : COUNT,AVG,MAX,MIN, ����Լ��� �׷��Լ���� �մϴ�.
--			�ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ�� �� ����.

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

--����Լ� ����� �ٸ� �÷����� ���� ��ȸ ���մϴ� (�׷��Լ��̱� �����Դϴ�.)
SELECT JOB_ID , COUNT(*) FROM EMPLOYEES e 
WHERE JOB_ID ='IT PROG';


--������ ��� : create table, insert into, select ~ where ~ �⺻����

--���� : ��Ī(alias). �÷� �Ǵ� ���̺� �̸��� �� �� ª�� �ٿ��� ���� �̸�.
SELECT * FROM  EMPLOYEES e ;       --EMPLOYEES ���̺��� ��Ī e
SELECT * FROM  DEPARTMENTS d ; 	   --DEPARTMENTS ���̺��� ��Ī d
