<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
</head>
<style>
.content {
	text-align: center;
	color: black;
}
.menub {margin-left:5%;}
.main {
	width: 80%;
}
.table-wrap {
	width : 48%; margin: 0; float:left; height : 500px;
}
.first {
	margin-right : 20px;
}
.third {float:left;}

.table th:hover, .table tr:hover {
	background: white;
}

textarea {
	resize: none;
}

@media ( max-width :991px) {
	.main {
		margin-left: 10%;
	}
	.menub li{
		width:25%;
	}
}
</style>
<body>
<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->
	<input type="hidden" id="sessionId" value="${loginUser.userId }">
	<div class="content" style="height:900px;">
		<div class="menub" >
			<ul>
				<li></li>
				<li><div class="name"><a href="myInfo.doa">회원정보 수정</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="opendiaryContentsList.doa?userId=${loginUser.userId }">내가 쓴글</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="myMateAttendList.doa?userId=${loginUser.userId }">마이 메이트</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="deleteMember.doa">회원탈퇴</a></div><div class="imgwrapper"> > </div></li>
			</ul>
		</div>
	<div class="main" style="height:600px;">
			<div class="main-name">
				<h2 class="main-name-h2">내가 쓴글</h2>
			</div>
		<div class="table-wrap first">
				<table align="center" width="800" border="1" cellspacing="0"
					style="clear: right;" class="table table-hover table-responsive">
					<tr align="center" valign="middle">
						<!-- valign : 수직 가운데 -->
						<th colspan="2">${require.requireNo }번글 상세보기</th>
					</tr>
					<tr>
						<td height="15" width="70">제목</td>
						<td>${require.requireTitle }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${require.userId }</td>
					</tr>
					<tr>
						<td>작성날짜</td>
						<td>${require.requireDate }</td>
					</tr>
					<tr height="100">
						<td>내용</td>
						<td>${require.requireContents }</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><c:if test="${!empty require.originalFilename }">
								<img
									src="/resources/requireUploadFiles/${require.userId}/${require.renameFilename}"
									width="250" height="200"><br>
									<a href="/resources/requireUploadFiles/${require.userId}/${require.renameFilename}" download>
									${require.renameFilename } </a>
							</c:if></td>
					</tr>
				</table>
			</div>
			<div class="table-wrap second">
			<table align="center" width="800" border="1" cellspacing="0"
					style="clear: right;" class="table table-hover table-responsive">
					<tr align="center" valign="middle">
						<th colspan="2"> 관리자 답변 </th>
					</tr>
					<tr>
						<td height="15" width="70">제목</td>
						<td></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>작성날짜</td>
						<td></td>
					</tr>
					<tr height="330">
						<td>내용</td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="third">
				<c:url var="requireDelete" value="requireDelete.doa">
					<c:param name="requireNo" value="${require.requireNo }"></c:param>
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<c:url var="requireList" value="requireList.doa">
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<c:url var="requireUpdate" value="requireUpdateView.doa">
					<c:param name="requireNo" value="${require.requireNo }"></c:param>
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<c:if test="${sessionScope.loginUser.userId eq require.userId}">
					<a href="${requireUpdate }">수정하기</a>
					<a href="javascript:deleteRequire()">삭제하기</a>
				</c:if>
				<a href="${requireList }">목록으로</a>
			</div>
		</div>
	</div>
	<script>
		
		function deleteRequire() {
			var answer = confirm("정말로 삭제하시겠습니까?");
			if (answer) {
				location.href = '${requireDelete}';
			}
			/* location.href='${requireUpdate}'; */
		}
	</script>
	<!-- end content -->

	<!-- footer -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>