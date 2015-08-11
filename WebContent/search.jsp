<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!-- search.jsp : 검색된 데이터 목록을 표시하는 페이지 -->

<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");

	if (name == null || name.trim().equals("")) {
		response.sendRedirect("send.jsp");//쫓아내겠다.
		return;
	}

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";
	//로그인

	Connection con = DriverManager.getConnection(url, user, pass);
	//쿼리문(전체명단을 가져오는 것이므로 먼저 가입한 순서대로(번호가 낮은 순서))

	String sql = "select * from test where name like ? order by no asc";//쿼리문
	PreparedStatement ps = con.prepareStatement(sql);
	//물음표 없음
	ps.setString(1, name);//일치 검색
	ps.setString(1, "%" + name + "%");//유사 검색
	
	ResultSet rs = ps.executeQuery();
%>
<html>
<head></head>
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
			<!-- 내용줄 : 데이터가 있을 때마다 1줄씩 생성 -->
			<%
				while (rs.next()) {//데이터가 있으면
			%>
			<tr>
				<th><%=rs.getInt("no")%></th>
				<!-- rs.getInt(1) -->
				<th><%=rs.getString("name")%></th>
				<th><%=rs.getInt("money")%></th>
				<th><%=rs.getString("gender")%></th>
				<th><%=rs.getString("joindate")%></th>
			</tr>
			<%
				}
			%>
		</table>
		<br> <br>
		<h1>
			<a href="send.jsp">메인으로 이동</a>
		</h1>
	</div>
</body>
</html>









