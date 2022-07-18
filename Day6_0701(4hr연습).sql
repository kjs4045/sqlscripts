--���ΰ� grou by �� �����ؼ� select �� �˻��ϴ� ���� 10 �������
--group by ����ε� ���� �� �� �ֽ��ϴ�. ex) �μ� �ο��� ���� ���� ������?

--�Ŵ����� 2�� �̻��� �μ� ��
SELECT 
department_name,
	count(*)
	FROM DEPARTMENTS d  
	GROUP BY department_name
	HAVING count(*) >= 2;
	
--������ 10000 �̻��� �͸� ��ȸ2
SELECT salary,
	COUNT(*)
	FROM EMPLOYEES e  
	GROUP BY salary 
	HAVING SALARY >= 10000;
	
--�Ŵ����� ���� ��ȸ3
SELECT * FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE e.EMPLOYEE_ID = d.MANAGER_ID  ;
	
-- Ư�� ����� �ٹ��ϴ� �μ� �̸� ��ȸ,id ��ȸ
SELECT d.DEPARTMENT_NAME  , 
		d.department_id,
		e.FIRST_name
	FROM DEPARTMENTS d , EMPLOYEES e 
	WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
		AND e.first_name ='Den';

--��� �޿�  ���������� ����5
SELECT e.salary,
		e.first_name
		FROM EMPLOYEES e 
		GROUP BY SALARY ,FIRST_NAME 
		ORDER BY avg(SALARY) ASC ;

	--�޿� 5õ���� 6
SELECT e.salary,
		e.first_name
		FROM EMPLOYEES e 
		GROUP BY SALARY ,FIRST_NAME 
		HAVING SALARY <=5000;

--d.id�� 30�� ������ �̸�,�μ� id //�μ��̸��� �ְ������ �������?7
SELECT  e.first_name,
		e.DEPARTMENT_ID 
		--d.department_name
	FROM EMPLOYEES e--,DEPARTMENTS d 
	GROUP BY FIRST_NAME, DEPARTMENT_ID--,department_name
	HAVING DEPARTMENT_ID=30;

-- �� ���� �� �����ӱ� ��� ���� ��ȸ, (����id,�����̸�,�����ӱ�)8
SELECT job_id,
		j.JOB_TITLE,
		j.MIN_SALARY 
		FROM JOBS j 
		GROUP BY JOB_ID,j.JOB_TITLE ,j.MIN_SALARY 
		ORDER BY AVG(j.min_salary) ASC; 
		
-- �μ� �� ����� ���	
SELECT d.department_name
	, count(*)
	FROM EMPLOYEES e ,DEPARTMENTS d 
	WHERE d.DEPARTMENT_ID =e.DEPARTMENT_ID 
	GROUP BY d.DEPARTMENT_ID, e.DEPARTMENT_ID,d.DEPARTMENT_NAME ;
	
-- �μ� �ο��� 10���� �Ѵ� �μ� ��� ��~ �־ȵɱ�
SELECT d.department_name,
	count(*)
	FROM EMPLOYEES e ,DEPARTMENTS d 
	WHERE d.DEPARTMENT_ID =e.DEPARTMENT_ID 
	GROUP BY d.DEPARTMENT_ID, e.DEPARTMENT_ID,d.DEPARTMENT_NAME 
	HAVING count(*)=>10;
	
-- IT ������� ��� ���� ��ȸ
SELECT *
FROM EMPLOYEES e, DEPARTMENTS d 
WHERE d.DEPARTMENT_NAME='IT';

--IT �Ŵ����� ��� ���� ��ȸ??
SELECT *
FROM EMPLOYEES e ,DEPARTMENTS d 
WHERE d.DEPARTMENT_NAME ='IT'
AND d.MANAGER_ID=e.EMPLOYEE_ID ;

--IT ����� �޿��� 10000�� �Ѵ� ��� �̸� ��ȸ
SELECT FIRST_NAME,LAST_NAME 
	FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE d.DEPARTMENT_NAME ='IT'
	AND e.SALARY >=10000;

--�ּ� �޿��� �޴� ����� first_last_nmae �÷� ��ȸ
SELECT FIRST_name, last_name,salary FROM EMPLOYEES e 
WHERE salary= (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG');

--�μ��� ��ձ޿��� ��ȸ�մϴ�. ������ ��ձ޿� ������������ �μ�_id, �μ���, ��ձ޿�
--����Ŭ �Ҽ��� ���� �Լ� :round(�ݿø�) , trunc(����) , ceil(����)

--�׷��Լ� ��ȸ�Ϥä��� group by �� ��� �׷���̿� �� �÷��� select �� ��ȸ�� �� �ֽ��ϴ�.
--  	�׷���� �÷��ܿ��� �ٸ� �÷� ���� �� �� �����ϴ�. join, ��������
--1�ܰ� : ����� �׷��Լ�  �����ϱ�
 
SELECT DEPARTMENT_ID ,AVG(SALARY) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

--2�ܰ�: �����ϱ�
SELECT * FROM DEPARTMENTS d JOIN
	(SELECT DEPARTMENT_ID,AVG(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID =tavg.department_id;

--3�ܰ�: �÷� �����ϱ�
SELECT d.department_id, d.department_name, ROUND(tavg.cavg,1) FROM DEPARTMENTS d 
	JOIN
	(SELECT DEPARTMENT_ID, AVG(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID  =tavg.department_id
		ORDER BY tavg.cavg DESC;
	
--4�ܰ� : ������ ����� Ư�� ��ġ ���� : first n �� ���� n���� ��ȸ
SELECT d.department_id, d.department_name , ROUND(tavg.cavg,1) FROM DEPARTMENTS d 
	JOIN
	(SELECT DEPARTMENT_ID, AVG(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
	ON d. DEPARTMENT_ID = tavg.department_id
	ORDER BY tavg.cavg DESC 
	FETCH FIRST 1 ROWS ONLY;

--�Ҽ��� ���� �Լ�: round(�ݿø�), trunc(����), ceil (����)

--rownum�� ������ �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ���Դϴ�.
SELECT rownum,tcnt.* FROM
(SELECT department_id, count(*) cnt FROM EMPLOYEES
	gROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
    WHERE rownum >5;
   
 SELECT Rownum,tcnt. *FROM
 (SELECT department_id, count(*) cnt FROM EMPLOYEES e 
 	GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
 	WHERE rwonum = 1 ;
 
 --rownum ����� �� ��� Ȯ���� �ȵǴ� ���� : rownum 1���� �����ؼ� ã�ư� �� �ִ� ���ǽĸ� ����.
 --where rownum =3;
 --where rownum >5;
 SELECT * FROM 
 	(SELECT rownum rn,tcnt. * FROM
 	(SELECT department_id, count(*) cnt FROM EMPLOYEES e 
 	GROUP BY DEPARTMENT_ID ORDER BY cnt desc) tcnt)
 	WHERE rn BETWEEN 5 AND 9;
	