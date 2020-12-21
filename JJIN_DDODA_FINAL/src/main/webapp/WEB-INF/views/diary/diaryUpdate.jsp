<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 수정하기</title>
<style>
	table{
		border-collapse:collapse
	}
	td{
		border-bottom:1px solid black;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<br style="clear:both">
	
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<h1 align="center">다이어리 수정페이지</h1>
	<br><br>
	<form action="diaryUpdate.doa" method="post" enctype="multipart/form-data">
	<input type="hidden" name="page" value="${currentPage }">
	<input type="hidden" name="diaryNo" value="${diary.diaryNo }">
	<input type="hidden" name="originalFileName" value="${diary.originalFileName }">
	<input type="hidden" name="renameFileName" value="${diary.renameFileName }">
	<input type="hidden" name="publicCode" value="${diary.publicCode }">
	<input type="hidden" name="diaryDate" value="${diary.diaryDate }">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="diaryTitle" value="${diary.diaryTitle }"></td>
			</tr>
			<tr>
				<td>내용 </td>
				<td><textarea rows="7" cols="50" name="diaryContents" >${diary.diaryContents}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" multiple="multiple" name="reloadFile">
					<c:if test="${!empty diary.renameFileName }">
						<br>현재 업로드한 파일 : <br>
						<a href="/resources/diaryUploadFiles/${diary.renameFileName}" download>
						${diary.originalFileName}</a>
					</c:if>
					<%-- <c:if test="${ !empty board.filePath }">
						<a href="/resources/nuploadFiles/${board.filePath }">${board.filePath }</a>
					</c:if> --%>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
	<p align="center">
		<c:url var="home" value="home.doa"></c:url>
		<c:url var="dList" value="diaryList.doa">
			<c:param name="page" value="${currentPage }"></c:param>
		</c:url>
		<c:url var="back" value="${header.referer }"></c:url>
		<a href="${home }"> Home</a>
		<a href="${dList }"> 목록</a>
		<a href="${back }"> 이전</a>
		<a href="javascript:history.go(-1);">이전페이지로</a>
	</p>
</body>
</html>