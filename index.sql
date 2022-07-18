JDBC �ǽ� ����

?1. jdbc ���̺귯�� �߰�
	�� ������Ʈ ��Ŭ�� -> �޴��߿� Build Path
	  -> Configure build path...
	  -> Libraries �� -> Add External jar
	  -> ���� ojdbc6. jar ã�Ƽ� �߰�

	  
2. OracleConnectionUtil Ŭ���� �ۼ�

�����ͺ��̽� ���� : Connection �������̽� ���� ��ü�� �����ϰ� �������ִ� Ŭ���� �޼ҵ带 ���
    ��1)	�� ���� JDBC ����̹��� �޸𸮿� �ε� ���Ѿ� �մϴ�.
           ��  Class.forName("��Ű����.Ŭ����")
	                  �� ����Ŭ ����̹� Ŭ����
	��2) DriverManager.getConnection �޼ҵ� ���� url,USER,password db ���������� �̿��Ͽ�
		CONNECTION ��ü ����
	
		
3. DBConnectionTest Ŭ���� �ۼ�

-2������ ���� OracleConnectionUtil Ŭ���� connect() �޼ҵ� �׽�Ʈ
-���󿬰� Ȯ���� �Ǹ� SQL INSERT ���� �׽�Ʈ


4. InsertTest Ŭ����

-3���� ������ INSERT SQL �׽�Ʈ
-tbl_custom ���̺� insert
-PreparedStatement �� �̿��մϴ�. ���࿡ �ʿ��� �����͸� ���� ���ε��� �մϴ�. ? ��ȣ ���.

-PreparedStatement �������̽��Դϴ�. PreparedStatement Ÿ�� ���������� PreparedStatemdent�� �߻�޼ҵ带
������ ������ü, conn,preaparedStatement(sql)�� ����ϴ� ����Ŭ ����̹� Ŭ������ ���� sql�� �����ϰ� ������ ��ü�� �����˴ϴ�.


5.InsertBuyTest Ŭ����

tbl_buy ���̺� INSERT									--������� 7�� 5�� ��������


6.SelectTest

1)SELECT SQL �� pstmt.executeQUery()�޼ҵ� ����
			������ ��ü�� ResultSet Ÿ����������
3) re.next() �޼ҵ�� ��ȸ ��� ����� ������� �����մϴ�. ���� ������ ��, ������ ���� ����.
4) rs.getXXX()�� Ư�� �÷� �� ��������

����:pstmt.setXXXX() �� SQL ���࿡ �ʿ��� �� ���ε�(����)


7. SELECT ����� �ڹٿ��� �����ϱ� -> List ���. List<E> , <E>�� ���ʸ� Ÿ��

SelectVOTest Ŭ���� : ���̺� �÷��� vo ��ü �ʵ� ���� ����
SelectLIstTest Ŭ���� : ��ȸ ��� n ���ϋ� WHILE �ݺ��ϸ鼭 list.add(vo)

8. DML ������ SQL ������ �ݺ��˴ϴ�. DML : INSERT , UPDATE, DELETE, SELECT
==> DAO (DATABASE ACCESS Object) Ŭ������ ���� ���Ǵ� �޼ҵ� ����.

����: Dao Ŭ������ �̿��ؼ� DML ���� �𼼵忡 �ʿ��� ������ �Ǵ� ���ϵǴ� �����ʹ� ���̺��� �÷� ������
���� VO Ŭ������ ���� ����߽��ϴ�.
VO value OBJECT : �ѹ� ������ �ʵ� �� �������� �ʴ´�. (�Һ���ü) getter �� ���.
DTO DATA transfer OBJECT : �ʵ尪�� ����� �� �ִ�. (���� ��ü) getter/ setter ���.

9.�ܺ��� ���ù��� sql�� jdbcǮ��
hrd.vo ��Ű��
	�� Membervo
	�� SaleVO :ȸ��������ȸ �÷��׸�� �����ϰ� ��.
hrd.dao ��Ű��
	�� HrdDao : ȸ�������ȸ, ȸ��������ȸ
hrd.main ��Ű��
	�� HrdMain :Dao �����ϱ�
	
10.hrd_0712.SQL -> sqlplus ���� �ۼ��Ѱ� �޸��忡 �����س���
hrd_0712.SQL -> sqlplus ���� �ۼ��Ѱ� �޸��忡 �����س���


*sqlplus ���� selcet ��°�� ���� ������ ���� (������ ���� 100�� 150, 10�� 20�� ���� ����)
	SQL> SET linesize 100
	SQL> SET pagesize 10
*sqlplus ���� ���� �ٿ� ���� SQL �� �ۼ��ϴٰ� ��Ÿ ��� ������ �ߴ��ϰ� ������ ���ٷ� ����ġ�� �˴ϴ�.
������ �Է��� ��� �������� ������ ��/�Ʒ� ����Ű ����ϼ���.
*sqlplus �� auto COMMIT  Ȯ���ϱ�
SQL>show autocoomit;
auttomcommit�� off�� �Ǿ������� �Ʒ� ��ɾ� ����.
SQL SET autocommit ON;

11. ����Ŭ CREATE OR REPLACE PROCEDURE �� ������ ���� ���ν��� jdbc�� �����ϱ�
	                                            