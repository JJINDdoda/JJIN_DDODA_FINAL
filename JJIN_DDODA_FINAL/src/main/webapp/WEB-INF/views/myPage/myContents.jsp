<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가쓴글</title>
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
				<h2 class="main-name-h2">내가 쓴글</h2>
			</div>
			<div class="table-wrap">
				<div>
				<c:if test="${!empty opendiaryContents }">
				<a style="color:red;" href="opendiaryContentsList.doa?userId=${loginUser.userId }">공유일기 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${empty opendiaryContents }">
					<a href="opendiaryContentsList.doa?userId=${loginUser.userId }">공유일기 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${!empty myContentsList }">
					<a style="color:red;" href="mateContentsList.doa?userId=${loginUser.userId }">메이트 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${empty myContentsList }">
					<a href="mateContentsList.doa?userId=${loginUser.userId }">메이트 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${!empty requireContents }">
					<a style="color:red;" href="requireContentsList.doa?userId=${loginUser.userId }">문의사항 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${empty requireContents }">
					<a href="requireContentsList.doa?userId=${loginUser.userId }">문의사항 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				</div>
				<table align="center" cellpadding="10" cellspacing="0" border="1"
					width="500" class="table" id="mymateList">
					
					<tr>
						<td width="200">분류</td>
						<td width="700">제목</td>
						<td>작성날짜</td>
					</tr>
					<c:if test="${ empty myContentsList }">
						<tr>
							<td colspan="7" align="center">작성된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty myContentsList }">
						<c:forEach items="${ myContentsList }" var="myContents"
							varStatus="status">
							<c:url var="mateDetail" value="mypageMateDetail.doa">
								<c:param name="mateNo" value="${myContents.mateNo }"></c:param>
								<c:param name="page" value="${pi.currentPage }"></c:param>
							</c:url>
							<tr onclick="location.href='${mateDetail}'">
								<td>메이트 커뮤니티</td>
								<td>${ myContents.mateTitle }</td>
								<td>${ myContents.mateDate }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
		<div class="page-wrap">
			<table>
				<tr align="center">
					<td colspan="7">
						<!-- 이전 --> <c:if test="${pi.currentPage <= 1}"> < </c:if> <c:if
							test="${pi.currentPage > 1}">
							<c:url var="before" value="mateContentsList.doa">
								<c:param name="userId" value="${loginUser.userId}"></c:param>
								<c:param name="page" value="${pi.currentPage -1 }"></c:param>
							</c:url>
							<a href="${before }"> < </a>
						</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
							end="${pi.endPage}">
							<c:url var="pagination" value="mateContentsList.doa">
								<c:param name="userId" value="${loginUser.userId}"></c:param>
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<c:if test="${p eq pi.currentPage }">
								<a href="${pagination }">${p }</a>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a href="${pagination }">${p }</a>
							</c:if>
						</c:forEach> <!-- 이후 --> <c:if test="${pi.currentPage >= pi.maxPage }"> > </c:if>
						<c:if test="${pi.currentPage < pi.maxPage}">
							<c:url var="after" value="mateContentsList.doa">
								<c:param name="userId" value="${loginUser.userId}"></c:param>
								<c:param name="page" value="${pi.currentPage +1 }"></c:param>
							</c:url>
							<a href="${after }"> > </a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- end content -->

	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>