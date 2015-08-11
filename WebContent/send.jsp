<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- send.jsp : 데이터 전송 페이지 -->
<html>
<head>
<title>메인 페이지</title>
</head>
<body>
<div align="center">
	
	<h1>회원 가입하기</h1>
	<form action="insert.jsp" method="post">
		<!-- 이름, 성별을 입력받아 전송 -->
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select name="gender">
						<option value="남자">남자
						<option value="여자">여자
					</select>
				</td>
			</tr>
			<tr>
				<th colspan="2'">
					<input type="submit" value="가입">
				</th>
			</tr>
		</table>
	</form>
	
	<br>
	<h1>회원 목록보기</h1>
	<a href="list.jsp">리스트 페이지로 이동</a>
	
	<br>
	<h1>회원 삭제하기</h1>
	<form action="delete.jsp" method="post">
		<!-- 이름 입력받아 전송 -->
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th colspan="2'">
					<input type="submit" value="삭제">
				</th>
			</tr>
		</table>
	</form>
	
	<br>
	<h1>회원 검색하기</h1>
	<form action="search.jsp" method="post">
		<!-- 이름 입력받아 전송 -->
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th colspan="2'">
					<input type="submit" value="검색">
				</th>
			</tr>
		</table>
	</form>	
	
</div>
</body>
</html>






