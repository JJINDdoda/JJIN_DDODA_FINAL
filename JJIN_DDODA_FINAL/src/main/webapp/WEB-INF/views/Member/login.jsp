<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/menubar-style.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
		<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->

	<c:if test="${empty sessionScope.loginUser }">
		<form action="login.doa" method="post">
			<table id="loginTable" align="right">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId"></td>
				<td rowspan="2">
					<button id="login-btn" class="btn btn-primary">로그인</button>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passWord">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="enrollView.doa">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">아이디 찾기</a>
					<a href="#">비밀번호 찾기</a>
				</td>
			</tr>
		</table>
		</form>
	</c:if>
	<c:if test="${ !empty sessionScope.loginUser}">
		<table align="right">
			<tr>
				<td colspan="2"><h3>${loginUser.userName }님 환영합니다</h3></td>
				<!-- <td><button onclick="location.href='myInfo.doa'">정보수정</button></td> -->
				<td><button onclick="location.href='logout.doa';">로그아웃</button></td>
			</tr>
		</table>
	</c:if>
	</div>
	
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<!-- <div class="nav-area">
		<div class="menu" onclick="location.href='home.doa'">HOME</div>
		<div class="menu" onclick="noticeListView();">공지사항</div>
		<div class="menu" onclick="boardListView();">자유게시판</div>
		<div class="menu" onclick="">etc</div>
	</div>
	<script>
		function nWriteView() {
			location.href='nWriteView.kh';
		}
		function boardListView() {
			location.href='boardList.kh';
		}
		function noticeListView() {
			location.href='noticeList.kh';
		}
	</script> -->
</body>
</html>