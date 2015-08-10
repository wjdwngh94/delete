<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!-- list.jsp : 저장된 데이터 목록을 표시하는 페이지 -->
<%
	//바로 DB 연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";
	
	Connection con = 
			DriverManager.getConnection(url, user, pass);
	
	String sql = "select * from test order by no asc";//쿼리문
	PreparedStatement ps = con.prepareStatement(sql);
	//물음표 없음
	ResultSet rs = ps.executeQuery();
	//rs에 모든 데이터가 저장되어 있다.
	/* System.out.println("rs = " + rs);
	System.out.println("데이터 존재 여부 : "+rs.next());
	System.out.println("데이터 존재 여부 : "+rs.next());
	System.out.println("데이터 존재 여부 : "+rs.next());
	System.out.println("데이터 존재 여부 : "+rs.next());
	System.out.println("데이터 존재 여부 : "+rs.next());
	System.out.println("데이터 존재 여부 : "+rs.next());
	System.out.println("데이터 존재 여부 : "+rs.next()); */	
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
				<%while(rs.next()){//데이터가 있으면 %>
				<tr>
					<th><%=rs.getInt("no")%></th><!-- rs.getInt(1) -->
					<th><%=rs.getString("name")%></th>
					<th><%=rs.getInt("money")%></th>
					<th><%=rs.getString("gender")%></th>
					<th><%=rs.getString("joindate")%></th>
				</tr>
				<%} %>
			</table>
			<br><br>
			<h1><a href="send.jsp">메인으로 이동</a></h1>
		</div>
	</body>
</html>









