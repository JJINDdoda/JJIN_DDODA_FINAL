<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 정보 수정</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		<form action="memberInfoUpdate.doa" method="post">
		<input type="hidden" name="userId" value="${loginUser.userId }">
			<div  style="align:center; margin-left: 100px; margin-top: 40px; ">
				<h1 align="center"> 기본 정보 수정 </h1>
				<table align="center" cellpadding="10" width="500" style="border-collapse:collapse;">
					<tr>
						<th align="center">성별</th>
						<!-- <td>
								<input type="radio" name="gender" value="M"> 남자
								<input type="radio" name="gender" value="Y"> 여자
						</td> -->
						<td>  
							<c:if test="${memberInfo.gender eq 'M'}">
								<input type="radio" name="gender" value="M" checked> 남자
								<input type="radio" name="gender" value="Y"> 여자
							</c:if>
							<c:if test="${memberInfo.gender eq 'Y'}">
								<input type="radio" name="gender" value="M"> 남자
								<input type="radio" name="gender" value="Y" checked> 여자
							</c:if>
						</td>
					</tr>
					<tr>
						<th align="center">연령</th>
						<td ><input type="text" size="5" id="age" name="age" value="${memberInfo.age }" readonly>　세</td>
					</tr>
					<tr>
						<th align="center"> 키</th>
						<td ><input type="text" size="5" id="height" name="height" value="${memberInfo.height }">　cm</td>
					</tr>
					<tr>
						<th align="center">몸무게</th>
						<td ><input type="text" size="5" id="weight" name="weight" value="${memberInfo.weight }">　kg</td>
					</tr>
					<tr>
						<th align="center">목표체중</th>
						<td ><input type="text" size="5" id="goal" name="goal" value="${memberInfo.goal }">　kg</td>
					</tr>
					<tr>
						<th align="center">체중감량기간</th>
						<td ><input type="text" size="5" id="period" name="period" value="${memberinfo.period }">　개월</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value=" ʕ •ɷ•ʔฅ  등록!">
							<input type="reset" value=" ( •᷄⌓•᷅ ) 취소!">
						</td>
						
					</tr>
			</table>
			</div>
		</form>

</body>
</html>