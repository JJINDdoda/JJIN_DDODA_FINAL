<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 추가</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		<h1 align="center">음식 추가</h1>
		<form action="foodAdd.doa" method="post">
			<table align="center" cellspacing="0" width="300">
			
			
				<tr>
					<th colspan="2">
						<input type="text" name="foodName" id="foodName" placeholder="음식명과 양을 입력하세요(밥,100g)">
					</th>
					
				</tr>
				<tr>
					<th colspan="2">　</th>
				</tr>
				<tr>
					<!-- 분량은 받아서 음식이름에 더해주면 됨  calorie.foodName+(calorie.foodAmount) -->
					<th align="left" >분량 
						<select id="foodAmount" name="foodAmount">
							<option value="g">g</option>
							<option value="ml">ml</option>
							<option value="oz">oz</option>
							<option value="mg">mg</option>
							<option value="cc">cc</option>
							<option value="L">L</option>
							<option value="kg">kg</option>
						</select>
					</th>
					<td align="center"><input type="text" name="amount"></td>
					
				</tr>
				
				<tr>
					<th align="left">칼로리(kcal)</th>
					<td align="center"><input type="text" name="kcal"></td>
				</tr>
				<tr>
					<th align="left">탄수화물(g)</th>
					<td align="center"><input type="text" name="carbo"></td>
				</tr>
				<tr>
					<th align="left">단백질(g)</th>
					<td align="center"><input type="text" name="protein"></td>
				</tr>
				<tr>
					<th align="left">지방(g)</th>
					<td align="center"><input type="text" name="fat"></td>
				</tr>
				<tr>
					<th align="left">당류(g)</th>
					<td align="center"><input type="text" name="saccharide"></td>
				</tr>
				<tr>
					<th align="left">나트륨(mg)</th>
					<td align="center"><input type="text" name="natrium"></td>
				</tr>
			</table>
			<br>
			<br>
			<div align="center">
			<input type="submit" value="음식정보 추가">
			</div>
		</form>
</body>
</html>