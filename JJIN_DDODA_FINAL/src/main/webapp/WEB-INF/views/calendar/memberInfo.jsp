<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 정보 등록</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
			<div  style="align:center; margin-left: 100px; margin-top: 40px; ">
				<h1 align="center"> 기본 정보  </h1>
				<table align="center" cellpadding="10" width="500" style="border-collapse:collapse;">
					<tr>
						<th align="right">성별</th>
							<c:if test="${memberInfo.gender eq 'M'}">
							<td>  
								남자
							</td>
							</c:if>
							<c:if test="${memberInfo.gender eq 'Y'}">
							<td>
								여자
							</td>
							</c:if>
						</td>
					</tr>
					<tr>
						<th align="right">연령</th>
						<td >${memberInfo.age}　세</td>
					</tr>
					<tr>
						<th align="right"> 키</th>
						<td >${memberInfo.height }　cm</td>
					</tr>
					<tr>
						<th align="right">몸무게</th>
						<td>${memberInfo.weight }　kg</td>
					</tr>
					<tr>
						<th align="right">목표체중</th>
						<td>${memberInfo.goal }　kg</td>
					</tr>
					<tr>
						<th align="right">체중감량기간</th>
						<td>${memberInfo.period }　개월</td>
					</tr>
			</table>
			<br>
			<br>
			<div align="center">
			<button  onclick="location.href='memberInfoUpdateView.doa'">수정하기</button>
			</div>
		</div>

	
</body>
</html>