<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<title>게시글 상세보기</title>
</head>
<body>
	<%-- ${nList.sNoticeTitle } --%>
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
				<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
					<td height="15" width="70">음식명</td>
					<td style="text-align: left;">${calorie.foodName }</td>
				</tr>
				<tr>
					<td height="15" width="70">칼로리</td>
					<td style="text-align: left;">${calorie.kcal }</td>
				</tr>
				<tr>
					<td height="15" width="70">단백질</td>
					<td style="text-align: left;">${calorie.protein }</td>
				</tr>
				<tr>
					<td height="15" width="70">탄수화물</td>
					<td style="text-align: left;">${calorie.carbo }</td>
				</tr>
				<tr>
					<td height="15" width="70">지방</td>
					<td style="text-align: left;">${calorie.fat }</td>
				</tr>
				<tr>
					<td height="15" width="70">나트륨</td>
					<td style="text-align: left;">${calorie.natrium }</td>
				</tr>
				<tr>
					<td height="15" width="70">당류</td>
					<td style="text-align: left;">${calorie.sacCharide }</td>
				</tr>
			</table>
			<button onclick="location.href='adminCalorieList.doa';" class="insert btn btn-primary" style="float: right;">목록으로</button>
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