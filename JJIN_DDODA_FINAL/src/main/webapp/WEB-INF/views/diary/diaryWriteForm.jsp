<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 작성</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<!-- dairydWriteView.kh -> diaryWriteForm.jsp를 볼 수 있도록 컨트롤러 작성 -->
	<h1 align="center">다이어리 작성하기</h1>
	<br>
	<form action="diaryInsert.doa" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userId" value="${loginUser.userId}" >
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input type="text" size="48" name="diaryTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="diaryContents"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
		</table>
		<br>
		<br>
				<div align="center">
					<input type="submit" value="등록하기"> &nbsp;&nbsp;&nbsp;
					<button onclick="location.href='diaryList.doa'">목록으로</button>
				</div>
	</form>
	

</body>
</html>