<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 리스트</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<!-- <div style="margin-left: 100px; margin-top: 40px; align: center; width: 500px;"> -->
		<h1 align="center">음식 리스트</h1>
		
		<h3 align="center">
			<button onclick="location.href='foodSelect.doa'">칼로리 추가</button>&nbsp;&nbsp;&nbsp;
			<button onclick="location.href='foodAddWrite.doa'">add</button>
		</h3>
		<table align="center" border="1" cellspacing="0" width="700">
			<tr>
				<th width="50">선택</th>
				<th width="200">메뉴</th>
				<th width="80">탄수화물</th>
				<th width="70">단백질</th>
				<th width="70">지방</th>
				<th width="70">당류</th>
				<th width="80">나트륨</th>
				<th width="80">칼로리</th>
			</tr>
			<c:forEach items="${fList }" var="food">
				<input type="hidden" name="calorieNo">
				<tr>
					<td  align="center">
						<input type="checkBox" name="select" id="select">
					</td>
					<td  align="center">
						${food.foodname }
					</td>
					<td  align="center">
						${food.carbo }
					</td>
					<td  align="center">
						${food.protein }
					</td>
					<td  align="center">
						${food.fat }
					</td>
					<td  align="center">
						${food.saccharide }
					</td>
					<td  align="center">
						${food.natrium }
					</td>
					<td  align="center">
						${food.kcal }
					</td>
				</tr>
			</c:forEach>			
		</table>
			
</body>
</html>