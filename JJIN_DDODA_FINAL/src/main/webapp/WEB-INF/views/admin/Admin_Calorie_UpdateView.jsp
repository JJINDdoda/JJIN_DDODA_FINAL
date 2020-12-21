<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.table > tr > td{color : green;}
	input {width:100%; height:30px;font-size:1.2em;background:#f6f6f6;border:none;}
	.file {background : white;}
	.insert{float: right;}
	textarea{width:100%;resize:none;background:#f6f6f6;border:none;}
	#fileList {border : 1px solid black;}
	#uploadfile{width:30%;float:left;height:20px;}
	.file-group {height : 23px;}
	.table {height: 100%;}
</style>
<title>음식정보 수정</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->

	<!-- content -->	
	<div class="content">
		<jsp:include page="/WEB-INF/views/common/admin_menubar.jsp"/>
		<div class="main">
			<h3 align="center">음식정보 수정하기</h3>
			<form action="adminCalorieUpdate.doa" method="post">
				<input type="hidden" name="calorieNo" value="${calorie.calorieNo }">
				<div class="table-wrap2">
					<table class="table">
						<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
							<td height="15" width="70">음식명</td>
							<td style="text-align: left;"><input type="text" name="foodName" value="${calorie.foodName }"></td>
						</tr>
						<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
							<td height="15" width="70">칼로리</td>
							<td style="text-align: left;"><input type="text" name="kcal" value="${calorie.kcal }"></td>
						</tr>
						<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
							<td height="15" width="70">단백질</td>
							<td style="text-align: left;"><input type="text" name="protein" value="${calorie.protein }"></td>
						</tr>
						<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
							<td height="15" width="70">탄수화물</td>
							<td style="text-align: left;"><input type="text" name="carbo" value="${calorie.carbo }"></td>
						</tr>
						<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
							<td height="15" width="70">지방</td>
							<td style="text-align: left;"><input type="text" name="fat" value="${calorie.fat }"></td>
						</tr>
						<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
							<td height="15" width="70">나트륨</td>
							<td style="text-align: left;"><input type="text" name="natrium" value="${calorie.natrium }"></td>
						</tr>
						<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
							<td height="15" width="70">당류</td>
							<td style="text-align: left;"><input type="text" name="sacCharide" value="${calorie.sacCharide }"></td>
						</tr>
					</table>
				</div>
				<button type="submit" class="insert btn btn-primary" style="margin-right: 10px;">등록하기</button>	
			</form>
			<button onclick="location.href='adminCalorieList.doa';" class="insert btn btn-primary" style="margin-right: 35px;">목록으로</button>
		</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>