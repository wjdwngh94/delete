<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %><!-- ; 사용하지 말것 -->
<!-- insert.jsp : DB에 정보를 집어넣는 페이지 -->
<!-- Oracle의 TEST 테이블에 정보를 집어넣는 것이 목표 -->

<%
	//데이터 수신 과정
	//1. 한글처리
	request.setCharacterEncoding("euc-kr");
	//2. 파라미터 수신
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	//3. 유효성 검사
	if(name==null||name.trim().equals("")||gender==null){
		response.sendRedirect("send.jsp");//쫓아내겠다.
		return;
	}

	//항목은 5가지 : no, name, money, gender, joindate
	//no : 오라클 시퀀스를 이용
	//name : 내가 직접 지정
	//money : 기본값 0원으로 설정
	//gender : 내가 직접 지정
	//joindate : sysdate라는 오라클 명령어로 지정
	
	//필요한 데이터 생성
	//String name = "홍길동";
	//String gender = "남자";
	
	//DB 연결 및 데이터 저장
	
	//드라이버 검색 - ojdbc6.jar 를 WebContent/Web-inf/lib에 저장
	//그 안의 oracle/jdbc/driver/OracleDriver.class 파일 실행
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//로그인 - 위치, 아이디, 비밀번호
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp1";
	String pass = "jsp1";
	
	//로그인 시도 - 로그인 실패하면 con == null
	//java.sql 패키지를 import
	Connection con = 
					DriverManager.getConnection(url, user, pass);
	
	System.out.println("con = " + con);
	
	//명령(쿼리) 전송
	String sql = "insert into test values(test_seq.nextval, "+
										"?, 0, ?, sysdate)";
	//연결 정보 con에서 전송 객체 추출
	PreparedStatement ps = con.prepareStatement(sql);
	//물음표 채우기 - 지정한 형식에 맞게 알아서 집어넣어준다.
	//ps.set자료형(물음표순서, 변수명);
	ps.setString(1, name);//자바 String 변수를 varchar2 형태로 저장
	ps.setString(2, gender);
	
	//실행 후 결과 받기
	int result = ps.executeUpdate();
	//System.out.println("result = " + result);
	//result가 1이면 성공, 0이면 실패
	
		if(result>0){//성공 : 회원가입 성공! 알림창 , list.jsp 로 이동%>
		<script type="text/javascript">
			alert("회원 가입 성공!");
			location.href="list.jsp";
		</script>
<%	}else{//실패 : 회원가입 실패... 알림창 , send.jsp 로 이동%>
		<script type="text/javascript">
			alert("회원 가입 실패...");
			location.href="send.jsp";
		</script>
<%	}%>










