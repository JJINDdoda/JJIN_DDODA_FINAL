<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트 불러오기</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		
		<table align="center" border="1" cellspacing="0" width="700">
			<h1 align="center">변화사진 목록</h1>
			<h3 align="center">
				<button onclick="location.href='changePhotoWriterForm.doa'">글쓰기</button>
			</h3>
			<tr>
				<th width="400">내용</th>
				<th width="200">날짜</th>
				<th width="100">첨부파일</th>
			</tr>
			<c:forEach items="${cList }" var="changePhoto">
				<tr>
					<td align="center">
						<c:url var="cDetail" value="changePhotoDetail.doa">
							<c:param name="myChangeNo" value="${changePhoto.myChangeNo }"></c:param>
						</c:url>
						<a href="${cDetail}">${ changePhoto.myChangeContents }</a>
					</td>
					<td align="center">${changePhoto.myChangeDate }</td>
					<td align="center">
					<c:if test="${ !empty changePhoto.originalFileName  }">
						O
					</c:if> 
					<c:if test="${ empty changePhoto.originalFileName  }">
						X
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>