<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!-- search.jsp : �˻��� ������ ����� ǥ���ϴ� ������ -->

<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");

	if (name == null || name.trim().equals("")) {
		response.sendRedirect("send.jsp");//�ѾƳ��ڴ�.
		return;
	}

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";
	//�α���

	Connection con = DriverManager.getConnection(url, user, pass);
	//������(��ü����� �������� ���̹Ƿ� ���� ������ �������(��ȣ�� ���� ����))

	String sql = "select * from test where name like ? order by no asc";//������
	PreparedStatement ps = con.prepareStatement(sql);
	//����ǥ ����
	ps.setString(1, name);//��ġ �˻�
	ps.setString(1, "%" + name + "%");//���� �˻�
	
	ResultSet rs = ps.executeQuery();
%>
<html>
<head></head>
<body>
	<div align="center">
		<table border="1">
			<!-- ������ -->
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>���ϸ���</th>
				<th>����</th>
				<th>������</th>
			</tr>
			<!-- ������ : �����Ͱ� ���� ������ 1�پ� ���� -->
			<%
				while (rs.next()) {//�����Ͱ� ������
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
			<a href="send.jsp">�������� �̵�</a>
		</h1>
	</div>
</body>
</html>









