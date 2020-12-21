<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정하기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.table > tr > td{color : green;}
	input {width:100%; height:30px;font-size:1.2em;background:#f6f6f6;border:none;}
	.insert {width:100px;}
	.file {background : white;}
	textarea{width:100%;resize:none;background:#f6f6f6;border:none;}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->

	<!-- content -->	
	<div class="content" style="margin-left:5%;margin-right:5%;">
	<h3 align="center">문의사항 수정하기</h3>
	<form action="requireUpdate.doa" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${currentPage }">
		<input type="hidden" name="requireNo" value="${require.requireNo }">
		<input type="hidden" name="originalFilename" value="${require.originalFilename }">
		<input type="hidden" name="renameFilename" value="${require.renameFilename }">
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="requireTitle" value="${require.requireTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userId" value="${loginUser.userId }" readonly></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="requireContents">${require.requireContents }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="reloadFile" class="file">
					<c:if test="${ !empty require.originalFilename }">
						<a href="/resources/requireUploadFiles/${require.userId }/${require.renameFilename}">
					${require.originalFilename }
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기" class="insert btn btn-primary"> &nbsp;
					<a href="requireList.doa">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
	
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>