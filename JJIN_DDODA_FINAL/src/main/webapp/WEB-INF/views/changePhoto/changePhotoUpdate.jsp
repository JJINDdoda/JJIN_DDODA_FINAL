<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<br style="clear:both">
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	
	<!-- dairydWriteView.kh -> diaryWriteForm.jsp를 볼 수 있도록 컨트롤러 작성 -->
	<h1 align="center">변화사진 수정하기</h1>

	<br>
	<form action="changePhotoUpdate.doa" method="post" enctype="multipart/form-data">
		<input type="hidden" name="myChangeNo" value="${changePhoto.myChangeNo }">
		<input type="hidden" name="originalFileName" value="${changePhoto.originalFileName }">
		<input type="hidden" name="renameFileName" value="${changePhoto.renameFileName }">
		<%--<input type="hidden" name="publicCode" value="${changePhoto.publicCode }">
		<input type="hidden" name="myChangeDate" value="${changePhoto.myChangeDate }"> --%>
		<table align="center" id="tb">
			<tr>
				<td>첨부파일</td>
				<td><input type="file" multiple="multiple"  name="reloadFile"> 
					<c:if test="${!empty changePhoto.renameFileName }">
						<br>현재 업로드한 파일 :            <button type="button" onclick="location.href='emptyFile.doa?myChangeNo=${changePhoto.myChangeNo}'">파일비우기</button> <br>
						
					<c:forTokens items="${changePhoto.renameFileName }" var="File" delims="," varStatus="status">
						<c:if test="${status.index eq 0 }">
						 <a href="/resources/changePhotoUploadFiles/${File}" >
						 	${File }
						 </a><br>
						</c:if>
						<c:if test="${status.index eq 1 }">
						 <a href="/resources/changePhotoUploadFiles/${File}" >
						 	${File }
						 </a><br>
						</c:if>
						<c:if test="${status.index eq 2 }">
						 <a href="/resources/changePhotoUploadFiles/${File}" >
						 	${File }
						 </a><br>
						</c:if>
					</c:forTokens>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="myChangeContents">${changePhoto.myChangeContents }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록하기"> &nbsp;
					<a href="changePhotoList.doa">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>