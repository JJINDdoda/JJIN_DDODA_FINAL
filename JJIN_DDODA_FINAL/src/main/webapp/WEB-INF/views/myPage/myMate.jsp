<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	@media ( max-width : 991px) {
		.menub li {
		width: 25%;
		}
	}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->
	<input type="hidden" id="sessionId" value="${loginUser.userId }">
	<div class="content" style="height:600px;">
		<div class="menub">
			<ul>
				<li><a href="#">회원정보 수정</a></li>
				<li><a href="opendiaryContentsList.doa?userId=${loginUser.userId }">내가 쓴글</a></li>
				<li><a href="myMateAttendList.doa?userId=${loginUser.userId }">마이 메이트</a></li>
				<li><a href="#">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="main">
			<div class="main-name">
				<h2 class="main-name-h2">마이 메이트</h2>
			</div>
			<div class="table-wrap">
				<table align="center" cellpadding="10" cellspacing="0" border="1" width="500" class="table" id="mymateList">
					<tr>
						<td>번호</td>
						<td width="300">제목</td>
						<td>작성자</td>
						<td>작성날짜</td>
						<td>채팅방</td>
						<td>메이트 나가기</td>
					</tr>
					<c:if test="${ empty mateAttendList }">
						<tr><td colspan="7" align="center">참여중인 모임이 없습니다.</td></tr>
					</c:if>
					<c:if test="${!empty mateAttendList }">
					<c:forEach items="${ mateAttendList }" var="mateAttendList" varStatus="status">
						<input type="hidden" id="mateNo" value="${mateAttendList.mateNo }">
						<tr>
							<td>${ mateAttendList.mateNo }</td>
							<td>${ mateAttendList.mateTitle }</td>
							<td>${ mateAttendList.userId }</td>
							<td>${ mateAttendList.mateDate }</td>
							<td>
								<c:if test="${mateAttendList.mateEnd == 'N' }">
									<button onclick="beforeOpen()">오픈 전</button>
								</c:if>
								<c:if test="${mateAttendList.mateEnd == 'Y' }">
									<%-- <button id="mymateOut" onclick="location.href='chatInsert.doa?mateNo=${mateAttendList.mateNo }&userId=${loginUser.userId }';">채팅방 입장</button> --%>
									<button id="mymateOut" onclick="window.open('chatInsert.doa?mateNo=${mateAttendList.mateNo}&userId=${loginUser.userId }', '채팅방 입장', 'width=400px, height=600px, location=no, status=no, scrollbars=yes');">채팅방 입장</button>
								</c:if>
							</td>
							<td><button id="mymateOut" onclick="mateOut()">메이트 나가기</button></td>
							<%-- ${myContentsList.mateNo} --%>
						</tr>
					</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	<!-- end content -->

	<!-- footer -->
	<br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script>
	function mateOut(mateNo) {
		var sessionId = $("#sessionId").val();
		var mateNo = $("#mateNo").val();
		var ask = confirm("모집글에서 나가시겠습니까?");
		if(ask) {
			$.ajax({
				url : "mymateOut.doa",
				type : "post",
				data : { "mateNo" : mateNo, "userId" : sessionId },
				success : function(data) {
					if(data == 'success') {
						alert("성공적으로 처리되었습니다.");
						location.reload();
					} else {
						alert("메이트 나가기에 실패했습니다.");
						return false;
					}
				}
			});
			return true;
		} else {
			return false;
		}
	}
	
	function beforeOpen() {
		alert("채팅방이 오픈되지 않았습니다.");
	}
	</script>
</body>
</html>