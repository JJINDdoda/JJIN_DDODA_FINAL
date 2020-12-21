<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>음식 추가</title>
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
			<h3 align="center">음식 추가하기</h3>
			<form action="adminCalorieInsert.doa" method="post">
				<div class="table-wrap2">
					<table class="table">
						<tr>
							<td>음식명</td>
							<td><input type="text" name="foodName"></td>
						</tr>
						<tr>
							<td>칼로리</td>
							<td><input type="text" name="kcal"></td>
						</tr>
						<tr>
							<td>단백질</td>
							<td><input type="text" name="protein"></td>
						</tr>
						<tr>
							<td>탄수화물</td>
							<td><input type="text" name="carbo"></td>
						</tr>
						<tr>
							<td>지방</td>
							<td><input type="text" name="fat"></td>
						</tr>
						<tr>
							<td>나트륨</td>
							<td><input type="text" name="natrium"></td>
						</tr>
						<tr>
							<td>당류</td>
							<td><input type="text" name="sacCharide"></td>
						</tr>
					</table>
				</div>
				<button type="submit" class="insert btn btn-primary" style="margin-right: 10px;">등록하기</button>
				<button onclick="location.href='adminCalorieList.doa';" class="insert btn btn-primary" style="margin-right: 35px;">목록으로</button>
			</form>
		</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>