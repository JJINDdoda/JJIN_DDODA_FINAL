<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변화사진 게시글 작성</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<!-- dairydWriteView.kh -> diaryWriteForm.jsp를 볼 수 있도록 컨트롤러 작성 -->
	<h1 align="center">변화사진 작성하기</h1>
	<br>
	<form action="addMultiFile.doa" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userId" value="${loginUser.userId}" >
		<table align="center" id="tb">
			<tr>
				<td>첨부파일</td>
				<td><input type="file"  multiple="multiple"  name="uploadFile"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="myChangeContents"></textarea></td>
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