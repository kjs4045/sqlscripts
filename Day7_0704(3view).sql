---- view : ���� ���̺�(���������� �������� �ʰ� �������� ������� ���̺�)
--          �� �������� ���̺��� �̿��ؼ� �����մϴ�.
--			�� �����(������)�� ���̺�ó�� select �� ��ȸ�� �Ҽ� �ִ� ���̺�
--				���� ���Ǵ� join ���� �̸� view �ؼ� ����մϴ�
--			�� grant CREATE VIEW to c##idev;   -> �� ���� ���� ���� ���� ����� �߰� ���� �ο� �ϼ���

CREATE VIEW v_dept
AS
SELECT d.department_id, department_name, e.employee_id ,e.first_name ,e.hire_date, e.job_id
FROM DEPARTMENTS d ,EMPLOYEES e 
WHERE d.DEPARTMENT_ID =e.DEPARTMENT_ID ;

SELECT * FROM v_dept WHERE job_id = 'ST_CLERK';