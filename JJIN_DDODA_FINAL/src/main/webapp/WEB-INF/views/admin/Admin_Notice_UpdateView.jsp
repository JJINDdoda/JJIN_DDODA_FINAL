<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.table > tr > td{color : green;}
	input {width:100%; height:30px;font-size:1.2em;background:#f6f6f6;border:none;}
	.file {background : white;}
	.insert{float: right;}
	textarea{width:100%;resize:none;background:#f6f6f6;border:none;}
	#fileList {border : 1px solid black;}
	#uploadfile{width:30%;float:left;height:20px;}
	.file-group {height : 23px;}
	.table {height: 100%;}
</style>
<title>공지사항 작성</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->

	<!-- content -->	
	<div class="content">
		<jsp:include page="/WEB-INF/views/common/admin_menubar.jsp"/>
		<div class="main">
			<h3 align="center">공지사항 글쓰기</h3>
			<form action="noticeUpdate.doa" method="post">
				<div class="table-wrap2">
					<table class="table">
						<tr>
							<td>제목</td>
							<td><input type="text" name="sNoticeTitle" value="${notice.sNoticeTitle }"></td>
						</tr>
						<tr>
							<td>게시판명</td>
							<td>
								<select class="form-select" aria-label="Default select example" id="sSearchCondition" name="sSearchCondition">
								  <option>선택하세요</option>
								  <option value="opendiary" <c:if test="${notice.sSearchCondition == '공유일기' }">selected</c:if>>공유일기</option>
								  <option value="require" <c:if test="${notice.sSearchCondition == '요청사항' }">selected</c:if>>요청사항</option>
								  <option value="mate" <c:if test="${notice.sSearchCondition == '메이트' }">selected</c:if>>메이트</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="userId" value="${notice.userId }" readonly></td>
						</tr>		
						<tr>
							<td>내용</td>
							<td><textarea cols="50" rows="7" name="sNoticeContents">${notice.sNoticeContents }</textarea></td>
						</tr>
					</table>
				</div>
				<button type="submit" class="insert btn btn-primary" style="margin-right: 10px;">등록하기</button>	
			</form>
			<button onclick="location.href='noticeRequireList.doa';" class="insert btn btn-primary" style="margin-right: 35px;">목록으로</button>
		</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>