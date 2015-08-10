<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<html>
<body>
<%
	String method = request.getMethod();
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp1";
	String pass = "jsp1";

	Connection con = DriverManager.getConnection(url, user, pass);

	String sql = "select name from test where name="+"'"+name+"'";
	PreparedStatement ps = con.prepareStatement(sql);
	int result = ps.executeUpdate();
	if (result == 1) {
		String del = "delete test where name="+"'"+name+"'";
		PreparedStatement ps1 = con.prepareStatement(del);
%>

	<script type="text/javascript">
		location.href = "list.jsp";
	</script>

<%
	} else {
%>

	<script type="text/javascript">
		window.alert("없는 이름입니다.");
	</script>

<%
	}
%>
</body>
</html>
