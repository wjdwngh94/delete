<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<!-- delete.jsp : �Էµ� ������ ���� -->
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		//2. �Ķ���� ����
		String name = request.getParameter("name");
		//3. ��ȿ�� �˻�
		if (name == null || name.trim().equals("")) {
			response.sendRedirect("send.jsp");//�ѾƳ��ڴ�.
			return;
		}
		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jsp1";
		String pass = "jsp1";

		Connection con = DriverManager.getConnection(url, user, pass);

		String sql = "delete test where name=?";

		//���� ���� con���� ���� ��ü ����
		PreparedStatement ps = con.prepareStatement(sql);
		//����ǥ ä��� - ������ ���Ŀ� �°� �˾Ƽ� ����־��ش�.
		//ps.set�ڷ���(����ǥ����, ������);
		ps.setString(1, name);//�ڹ� String ������ varchar2 ���·� ����

		//���� �� ��� �ޱ�
		int result = ps.executeUpdate();
		//System.out.println("result = " + result);
		//result�� 1�̸� ����, 0�̸� ����

		if (result > 0) {//���� : ȸ������ ����! �˸�â , list.jsp �� �̵�
	%>
	<script type="text/javascript">
		alert("ȸ�� ���� ����!");
		location.href = "list.jsp";
	</script>
	<%
		} else {//���� : ȸ������ ����... �˸�â , send.jsp �� �̵�
	%>
	<script type="text/javascript">
		alert("ȸ�� ���� ����...");
		location.href = "send.jsp";
	</script>
	<%
		}
	%>