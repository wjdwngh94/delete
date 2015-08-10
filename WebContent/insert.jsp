<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!-- insert.jsp DB에 정보를 집어넣는 페이지 -->
<!-- Oracle의 TEST테이블에 정보를 집어넣는 것이 목표이다. -->
<%
	//항목은 5가지이다 : NO, NAME, MONEY, GENDER, JOINDATE

	//NO : ORACLE SYQUENCE를 이용한다.
	//NAME : 내가 직접 지정한다.
	//MONEY : 기본값 0원으로 지정한다.
	//GENDER : 내가 직접 지정
	//JOINDATE : 현재시간을 구한다. SYSDATE라는 ORACLE명령어 사용

	//JAVA에서 내가 만들어 주는 데이터 : NAME , GENDER
	//ORACLE에서 만들어 주는 데이터 : JOINDATE, NO, MONEY

	//필요한 데이터 생성

	String method = request.getMethod();
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");

	if (name == null || name.trim().equals("")) {
		System.out.println("옳바른 자료가 입력되지 않았습니다.");
		response.sendRedirect("send.jsp"); //send.jsp로 쫓아낸다.
		return; //실행 종료
	} else {
%>

<%
	}
	//DB 연결 및 데이터 저장

	//driver 검색 - ojdbc6.jar를 WebContent/Web-inf/lib에 저장한다
	//그 안의 oracle/jdbc/driver/OracleDriver.class 파일 실행

	Class.forName("oracle.jdbc.driver.OracleDriver");

	//로그인 - 위치 정보, 아이디, 비밀번호
	//아이디 , 비밀번호 @ ip : oracle 연결포트 : 버전
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp1";
	String pass = "jsp1";

	//로그인 시도 - 로그인 실패하면 con == null
	Connection con = DriverManager.getConnection(url, user, pass);

	System.out.println("con = " + con);

	//명령(쿼리)전송
	//insert into test(no, name, money, gender, joindate)
	//values(test_seq.nextval,'황인빈',3000,'남자',to_date('15/08/05'));
	String sql = "insert into test values(test_seq.nextval,"
			+ "?,0,?,sysdate)";

	//연결 정보 con에서 전송객체 추출
	PreparedStatement ps = con.prepareStatement(sql);
	//물음표 채우기 작업 - 지정한 형식에 맞게 알아서 집어넣어 준다.
	//ps.set 자료형(물음표 순서, 변수명)

	ps.setString(1, name);//자바 String 변수를 varchar2 형태로 저장한다.
	ps.setString(2, gender);

	//실행후에 결과를 받는다
	//성공이든 실패든 int형태로 숫자를 받아서 결과를 알려준다.

	int result = ps.executeUpdate();
	System.out.println("result = " + result);

	//result 가 1이면 성공이고, 0이면 실패이다.
%>
<html>
<body>
	<div>
		<script type="text/javascript">
			
		<%if (result == 1) {%>
			alert("회원 가입 성공");
			location.href = "list.jsp";
		<%} else {%>
			alert("회원 가입 실패");
		<%}%>
			
		</script>
	</div>
</body>
</html>
