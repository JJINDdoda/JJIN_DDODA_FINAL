<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 변화사진 상세 보기</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	
	<h1 align="center"> 변화사진 상세보기</h1>
	<br>
		<c:if test="${ changePhoto.publicCode eq 'N' || empty changePhoto.publicCode }">
			<h3 align="right">
				<button onclick="location.href='changePhotoPublic.doa?publicCode=Y&myChangeNo=${changePhoto.myChangeNo}'">공개</button>
			</h3>
		</c:if> 
		<c:if test="${ changePhoto.publicCode eq 'Y'}">
			<h3 align="right">
				<button onclick="location.href='changePhotoPublic.doa?publicCode=N&myChangeNo=${changePhoto.myChangeNo}'">비공개</button>
			</h3>
		</c:if> 
		<br>
		<p>${changePhoto.myChangeDate }</p>
		<table align="center" cellpadding="10" cellspacing="0" width="500" border="1">
			<tr>
				<th colspan="3" align="center">첨부파일</th>
			<tr>
			<tr>
				<c:if test="${!empty changePhoto.renameFileName }">
				<c:forTokens items="${changePhoto.renameFileName }" var="File" delims="," varStatus="status">
				<c:if test="${status.index eq 0 }">
				<td>
					<a href="/resources/changePhotoUploadFiles/${File }" download>
						${File }
					</a>
				 </td>
				</c:if>
				<c:if test="${status.index eq 1 }">
				<td>
					<a href="/resources/changePhotoUploadFiles/${File }" download>
						${File }
					</a>
				 </td>
				</c:if>
				<c:if test="${status.index eq 2 }">
				<td>
					<a href="/resources/changePhotoUploadFiles/${File }" download>
						${File }
					</a>
				 </td>
				</c:if>
				
				</c:forTokens>
				</c:if>
			</tr>
			<tr>
				<th height="15" width="70"> 내용 </th>
				<td colspan="2">${changePhoto.myChangeContents } </td>
			</tr>
			
		</table>
		<p align="center">
			
			<c:url var="cUpdate" value="changePhotoUpdateView.doa">
				<c:param name="myChangeNo" value="${changePhoto.myChangeNo }"></c:param>
			</c:url>
			<c:url var="cDelete" value="changePhotoDelete.doa">
				<c:param name="myChangeNo" value="${changePhoto.myChangeNo }"></c:param>
			</c:url>
			<c:url var="cList" value="changePhotoList.doa">
			</c:url>
			<a href="${cUpdate }">수정하기</a>
			<a href="${cDelete }">삭제하기</a>
			<a href="${cList }">목록으로</a>
		</p>

</body>
</html>