JDBC 실습 순서

?1. jdbc 라이브러리 추가
	ㄴ 프로젝트 우클릭 -> 메뉴중에 Build Path
	  -> Configure build path...
	  -> Libraries 탭 -> Add External jar
	  -> 파일 ojdbc6. jar 찾아서 추가

	  
2. OracleConnectionUtil 클래스 작성

데이터베이스 연결 : Connection 인터페이스 구현 객체를 생성하고 리턴해주는 클래스 메소드를 사용
    ㄴ1)	그 전에 JDBC 드라이버를 메모리에 로드 시켜야 합니다.
           ㄴ  Class.forName("패키지명.클래스")
	                  ㄴ 오라클 드라이버 클래스
	ㄴ2) DriverManager.getConnection 메소드 인자 url,USER,password db 접속정보를 이용하여
		CONNECTION 객체 생성
	
		
3. DBConnectionTest 클래스 작성

-2번에서 만든 OracleConnectionUtil 클래스 connect() 메소드 테스트
-정상연결 확인이 되면 SQL INSERT 실행 테스트


4. InsertTest 클래스

-3번과 동일한 INSERT SQL 테스트
-tbl_custom 테이블에 insert
-PreparedStatement 를 이용합니다. 실행에 필요한 데이터를 동적 바인딩을 합니다. ? 기호 사용.

-PreparedStatement 인터페이스입니다. PreparedStatement 타입 참조변수는 PreparedStatemdent의 추상메소드를
구현한 구현객체, conn,preaparedStatement(sql)는 사용하는 오라클 드라이버 클래스를 통해 sql을 저장하고 실행할 객체가 생성됩니다.


5.InsertBuyTest 클래스

tbl_buy 테이블에 INSERT									--여기까지 7월 5일 수업내용


6.SelectTest

1)SELECT SQL 은 pstmt.executeQUery()메소드 실행
			실행결과 객체는 ResultSet 타입으로참조
3) re.next() 메소드는 조회 결과 행들을 순서대로 접근합니다. 행이 있으면 참, 없으면 거짓 리턴.
4) rs.getXXX()은 특정 컬럼 값 가져오기

참고:pstmt.setXXXX() 은 SQL 실행에 필요한 값 바인딩(전달)


7. SELECT 결과를 자바에서 저장하기 -> List 사용. List<E> , <E>는 제너릭 타입

SelectVOTest 클래스 : 테이블 컬럼과 vo 객체 필드 매핑 예시
SelectLIstTest 클래스 : 조회 결과 n 행일떄 WHILE 반복하면서 list.add(vo)

8. DML 위주의 SQL 실행이 반복됩니다. DML : INSERT , UPDATE, DELETE, SELECT
==> DAO (DATABASE ACCESS Object) 클래스에 자주 사용되는 메소드 정의.

참고: Dao 클래스를 이용해서 DML 실행 모세드에 필요한 데이터 또는 리턴되는 데이터는 테이블의 컬럼 구성과
같게 VO 클래스를 만들어서 사용했습니다.
VO value OBJECT : 한번 저장한 필드 값 변경하지 않는다. (불변객체) getter 만 사용.
DTO DATA transfer OBJECT : 필드값이 변경될 수 있다. (가변 객체) getter/ setter 사용.

9.외부평가 샘플문자 sql과 jdbc풀이
hrd.vo 패키지
	ㄴ Membervo
	ㄴ SaleVO :회원매출조회 컬럼항목과 동일하게 함.
hrd.dao 패키지
	ㄴ HrdDao : 회원목록조회, 회원매출조회
hrd.main 패키지
	ㄴ HrdMain :Dao 실행하기
	
10.hrd_0712.SQL -> sqlplus 에서 작성한것 메모장에 저장해놓기
hrd_0712.SQL -> sqlplus 에서 작성한것 메모장에 저장해놓기


*sqlplus 에서 selcet 출력결과 보기 적정한 설정 (문제에 따라서 100은 150, 10은 20등 변경 가능)
	SQL> SET linesize 100
	SQL> SET pagesize 10
*sqlplus 에서 여러 줄에 걸쳐 SQL 문 작성하다가 오타 등등 이유로 중단하고 싶으면 빈줄로 엔터치면 됩니다.
이전에 입력한 명령 가져오고 싶으면 위/아래 방향키 사용하세요.
*sqlplus 의 auto COMMIT  확인하기
SQL>show autocoomit;
auttomcommit이 off로 되어있으면 아래 명령어 실행.
SQL SET autocommit ON;

11. 오라클 CREATE OR REPLACE PROCEDURE 로 정의한 저장 프로시저 jdbc로 실행하기
	                                            