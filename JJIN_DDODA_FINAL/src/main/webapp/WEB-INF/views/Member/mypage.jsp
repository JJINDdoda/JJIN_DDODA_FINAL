<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>까르르르륵 마이페이지</title>
</head>
<body>


<c:if test="${empty sessionScope.loginUser }">
	<jsp:include page="login.jsp"></jsp:include>
</c:if>
<c:if test="${!empty sessionScope.loginUser }">
	<jsp:include page="myInfo.jsp"></jsp:include>
</c:if>


</body>
</html>