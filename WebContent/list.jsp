<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : 저장된 데이터 목록을 표시하는 페이지 -->
<%
	//(4단계를 거치자)
	//바로 db연결한다.
	//1.무슨페이지를 실행시킬지 모르기 때문에 우선 driver검색을 한다.
	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";

	//로그인
	Connection con = DriverManager.getConnection(url, user, pass);

	//쿼리문(전체명단을 가져오는 것이므로 먼저 가입한 순서대로(번호가 낮은 순서))
	String sql = "select * from test order by no asc";
	PreparedStatement ps = con.prepareStatement(sql);

	//?가 없으므로 바로실행 시킨다.
	//전체의 데이터를 보고 싶으므로 ps.excuteQuery를 사용한다.
	ResultSet rs = ps.executeQuery();

	//rs에 모든 데이터가 저장되어 있다.
	System.out.println("rs = " + rs);
%>
<html>
<head>
</head>
<body>
	<div align="center">
		<table border="1">
			<!-- 제목줄 -->
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>마일리지</th>
				<th>성별</th>
				<th>가입일</th>
			</tr>
			<!-- 내용들 -->
			<%
				while (rs.next() == true) {//데이터가 있을 때 마다 한줄씩 출력
			%>
			<tr>
				<th><%=rs.getInt("no") %></th> <!-- rs.getInt(1) 로도 대체 가능 -->
				<th><%=rs.getString("name") %></th>
				<th><%=rs.getInt("money") %></th>
				<th><%=rs.getString("gender") %></th>
				<th><%=rs.getString("joindate") %></th>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>