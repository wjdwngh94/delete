<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!-- insert.jsp DB에 정보를 집어넣는 페이지 -->
<!-- Oracle의 TEST테이블에 정보를 집어넣는 것이 목표이다. -->
<html>
	<head>
		<title>보내는 페이지</title>
	</head>
<body>
	<div align = "center">
		<h1>회원 가입</h1>
		<form action="insert.jsp" method="post">
			
			이름 : <input type ="text" name = "name"><br>
			
			성별 : <select name = "gender">
				<option value = "남자">남자
				<option value = "여자">여자
			</select>
			<br>
			<!-- 전송 버튼 -->
			<input type="submit" value="가입">
	
		</form>
		
		<h1>회원 목록</h1>
		<form action="list.jsp" method="post">
			<input type="submit" value="목록보기">

		</form>
		
		<h1>회원 삭제</h1>
		<form action="delete.jsp" method="post">
			
			이름 : <input type ="text" name = "name"><br>
			<!-- 전송 버튼 -->
			<input type="submit" value="삭제">
			
		</form>
		
		<h1>회원 검색</h1>
		<form action="search.jsp" method="post">
	
			이름 : <input type ="text" name = "name"><br>
			
			<!-- 전송 버튼 -->
			<input type="submit" value="검색">
		</form>
		
	</div>
</body>
</html>
