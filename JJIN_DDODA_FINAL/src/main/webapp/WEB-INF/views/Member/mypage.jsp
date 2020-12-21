<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	.centerText table {
		margin : auto;
	}
</style>
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
	<h3 align="center">${loginUser.userName }님의 정보 보기</h3>
	<div class="centerText">
		<!-- 단순히 정보만 보는 것이 아니라 수정이 필요한 경우 수정이 가능하도록 form태스 작성 -->
		<form action="updateMember.doa" method="post">
			<table width="650" cellspacing="5">
			    <tr>
	 				<td>이름</td>
	 				<td><input type="text" name="userName" value="${ loginUser.userName }" readonly></td>
	 			</tr>
				<tr>
	 				<td>아이디</td>
	 				<td><input type="text" name="userId" id="userId" value="${ loginUser.userId }" readonly></td>
	 			</tr>
	 			
	 			<tr>
	 				<td>성별</td>
	 				<c:if test="${loginUser.gender eq 'M' }">
	 				<td><input type="radio" name="gender" value="M" checked>남
	 				<input type="radio" name="gender" value="F">여</td>
	 				</c:if>
	 				<c:if test="${loginUser.gender eq 'F' }">
	 				<td><input type="radio" name="gender" value="M">남
	 				<input type="radio" name="gender" value="F" checked>여</td>
	 				</c:if>
	 			</tr>
	 			<tr>
	 				<td>이메일</td>
	 				<td><input type="email" name="email" value="${loginUser.email }"></td>
	 			</tr>
	 			<tr>
	 				<td>전화번호</td>
	 				<td><input type="text" name="phone" value="${loginUser.phone }"></td>
	 			</tr>
	 			
	 			
	 			<tr>
	 				<td colspan="2" align="center">
	 				<input type="submit" value="수정하기">
	 				<!-- <button type="button">탈퇴하기</button> -->
	 				<%-- <a href="memberDelete.do?userId=${ loginUser.userId }">탈퇴하기</a> --%>
	 			
	 			
	 			<%-- 	<c:url var="mDelete" value="memberDelete.doa">
	 					<c:param name="userId" value="${loginUser.userId }" />
	 				</c:url>
	 				<a href="${mDelete }" >탈퇴하기</a> --%>
	 				</td>
	 			</tr>
			</table>		
		</form>
	</div>
	</div>
	
		<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>