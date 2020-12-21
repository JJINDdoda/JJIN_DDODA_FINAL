<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어트 정보 입력</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	
	
	<table align="center" cellpadding="10" cellspacing="0" width= "800" margin-top="50">
		<tr>
			<td colspan="8" align="left" font-size="20">
				  ${dateStr} 
			</td>
		</tr>
		<tr>
			<th colspan="2" align="center">몸무게</th>
			<td colspan="2" align="center"> kg</td>
			<th colspan="2" align="center">총 섭취</th>
			<td colspan="2" align="center"> Kcal</td>
		</tr>
		<tr>
			<th colspan="2" align="center">골격근량</th>
			<td colspan="2" align="center"> kg</td>
			<th colspan="2" align="center">총 소모</th>
			<td colspan="2" align="center"> Kcal</td>
		</tr>
		<tr>
			<th colspan="2" align="center">체지방량</th>
			<td colspan="2" align="center"> kg</td>
			<th colspan="2" align="center">하로 권장 칼로리</th>
			<td colspan="2" align="center"> Kcal</td>
		</tr>
		<tr>
			<td colspan="8" align="center">
				  　
			</td>
		</tr>
		<tr>
			<th align="center">아침</th>
			<th align="center">간식</th>
			<th align="center">점심</th>
			<th align="center">간식</th>
			<th align="center">저녁</th>
			<th align="center">물</th>
			<th align="center">운동</th>
			<th align="center">기초대사량</th>
		</tr>
		<tr>
			<td align="center">kcal</td>
			<td align="center">kcal</td>
			<td align="center">kcal</td>
			<td align="center">kcal</td>
			<td align="center">kcal</td>
			<td align="center">kcal</td>
			<td align="center">L</td>
			<td align="center">kcal</td>
		</tr>
		<tr>
			<td colspan="6"></td>
			<td colsapn="2" rowspan="3">
		</tr>
		<tr>
		
	
	</table>
</body>
</html>