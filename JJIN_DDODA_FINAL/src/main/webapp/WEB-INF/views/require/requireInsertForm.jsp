<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 글쓰기</title>
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
	<div class="main-name">
		<h2 class="main-name-h2">문의사항 작성</h2>
	</div>
	<div class="table-wrap">
	<form action="requireInsert.doa" method="post" enctype="multipart/form-data" name="requireForm" onsubmit="return checkvalue();">
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="requireTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userId" value="${loginUser.userId }" readonly></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="requireContents"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile" class="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록하기" class="insert btn btn-primary"> &nbsp;
					<a href="#">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script>
		function checkvalue() {
			var requireInfo = document.requireForm;
			if(!requireInfo.requireTitle.value){
				alert("제목을 입력해주세요");
				console.log(requireInfo.requireTitle.value)
				return false;
			}
			if(!requireInfo.userId.value){
				alert("아이디를 입력해주세요");
				return false;
			}
			if(!requireInfo.requireContents.value){
				alert("내용을 입력해주세요");
				return false;
			}
			if( requireInfo.requireTitle.value != "" && requireInfo.requireContents.value != "") {
				var ask = confirm("글 작성을 완료하시겠습니까?");
				if (ask) {
					return true;
				} else {
					return false;
				}
			}
			
		}
	</script>
</body>
</html>