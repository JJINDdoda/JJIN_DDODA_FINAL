<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다 아이디 너의  합니다 감사 이용해 </title>
</head>
<body>


<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	<div class="centerText" align="center">
	<h3>회원님의 아이디</h3>
	
	<input type="text" value="${memberd.userId }">
	
	
	<button type="button" onclick="location.href='/';">메인페이지로</button>
	
	</div>
		<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
</body>
</html>