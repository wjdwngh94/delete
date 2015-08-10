<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : 저장된 데이터 목록을 표시하는 페이지 -->
<%
	String method = request.getMethod();
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	if (name == null || name.trim().equals("")) {
		System.out.println("옳바른 자료가 입력되지 않았습니다.");
		response.sendRedirect("send.jsp"); //send.jsp로 쫓아낸다.
		return; //실행 종료
	} else {

		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jsp1";
		String pass = "jsp1";
		Connection con = DriverManager.getConnection(url, user, pass);

		String sql = "select * from test order by no asc";
		PreparedStatement ps = con.prepareStatement(sql);

		//?가 없으므로 바로실행 시킨다.
		//전체의 데이터를 보고 싶으므로 ps.excuteQuery를 사용한다.
		ResultSet rs = ps.executeQuery();
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
				while (rs.getString("name").equals("name")) {//데이터가 있을 때 마다 한줄씩 출력
			%>
			<tr>
				<th><%=rs.getInt("no")%></th>
				<!-- rs.getInt(1) 로도 대체 가능 -->
				<th><%=rs.getString("name")%></th>
				<th><%=rs.getInt("money")%></th>
				<th><%=rs.getString("gender")%></th>
				<th><%=rs.getString("joindate")%></th>
			</tr>
			<%
				rs.next();
					}
			%>
		</table>
	</div>
</body>
</html>
<%
	}
%>