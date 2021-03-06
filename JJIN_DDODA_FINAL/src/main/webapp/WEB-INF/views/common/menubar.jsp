<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/menubar-style.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>메뉴바</title>
</head>
<body>
	<h1 align="center" onclick="location.href='home.doa'">DDo:Da</h1>
	<br>
	<div class="login-area">
		<c:if test="${empty sessionScope.loginUser }">
		<form action="login.doa" method="post">
			<table align="right">
				<tr>
					<td>아이디 :</td>
					<td><input type="text" name="userId"></td>
					<td rowspan="2">
						<button id="login-btn" class="btn btn-login">로그인</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="passWord"></td>
				</tr>
				<tr>
					<td colspan="3"><a href="#">회원가입</a>&nbsp; <a
						href="#">아이디/비밀번호 찾기</a></td>
				</tr>
			</table>
		</form>
		</c:if>
		
		<c:if test="${!empty sessionScope.loginUser }">
			<table align="right">
				<tr>
					<td colspan="2"><h3>${loginUser.userName } 님 환영합니다.</h3>
				</tr>	
				<tr>
					
					<td><button onclick="location.href='#'">마이페이지</button></td>
					<td><button onclick="location.href='#'">로그아웃</button></td>
				</tr>
			</table>
		</c:if>

	</div>
	<div class="nav-area" align="right">
		<div class="menu" onclick="location.href='calendarView.doa'">캘린더</div>
		<div class="menu" onclick="location.href='#'">운동시설 검색</div>
		<div class="menu" onclick="location.href='#'">커뮤니티</div>
		<div class="menu" onclick="location.href='#'">문의사항</div>
	</div>
	<script>
		function nWriteView(){
			location.href='nWriteView.kh';
		}
	</script>
</body>
</html>