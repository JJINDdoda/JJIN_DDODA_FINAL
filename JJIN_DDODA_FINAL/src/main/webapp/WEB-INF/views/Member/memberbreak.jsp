<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 </title>
</head>
<body>

<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->	
	<div class="content">
	
	<div class="menub">
		<ul>
			<li><a href="myInfo.doa">내 정보 수정</a></li>
			<li><a href="#">내가 쓴 글</a></li>
			<li><a href="#">탈퇴하기</a></li>
		</ul>
	</div>
	
	<h3 align="center">탈퇴하기</h3>
		<div class="centerText">
		<form action="deleteMember.doa" method="post">
		
		
	 			 	<c:url var="mDelete" value="memberDelete.doa">
	 					<c:param name="userId" value="${loginUser.userId }" />
	 				</c:url>
	 				<a href="${mDelete }" >탈퇴하기</a> 
		
		
		</form>
		</div>
	</div>

	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>