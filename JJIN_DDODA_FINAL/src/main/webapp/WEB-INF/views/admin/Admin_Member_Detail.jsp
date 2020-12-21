<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<title>회원 상세보기</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<br><br><br><br>
	<!-- end header -->

	<!-- content -->
	<div class="content">
		<jsp:include page="/WEB-INF/views/common/admin_menubar.jsp"/>
		<div class="main">
			<div class="table-wrap2">
				<table align="center" cellpadding="10" cellspacing="0" border="1" width="300" class="table">
					<tr>
						<td height="15" width="70">아이디</td>
						<td style="text-align: left;">${member.userId }</td>
					</tr>
					<tr>
						<td height="15" width="70">이름</td>
						<td style="text-align: left;">${member.userName }</td>
					</tr>
					<tr>
						<td height="15" width="70">성별</td>
						<td style="text-align: left;">${member.gender }</td>
					</tr>
					<tr>
						<td height="15" width="70">이메일</td>
						<td style="text-align: left;">${member.email }</td>
					</tr>
					<tr>
						<td height="15" width="70">전화번호</td>
						<td style="text-align: left;">${member.phone }</td>
					</tr>
					<tr>
						<td height="15" width="70">가입분류</td>
						<td style="text-align: left;">${member.userField }</td>
					</tr>
				</table>
				<button onclick="location.href='adminMemberList.doa';" class="insert btn btn-primary" style="float: right;">목록으로</button>
			</div>
		</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- end footer -->
</body>
</html>