<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<title>관리자 모드</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<br><br><br><br>
	<!-- end header -->

	<!-- content -->	
	<div class="content">
		<jsp:include page="/WEB-INF/views/common/admin_menubar.jsp"/>
		<div class="main">
			<div class="main-name">
				<h2 class="main-name-h2">공지사항</h2>
			</div>
			<div class="table-wrap">
			<table align="center" border="1" cellspacing="0" style="clear:right;" class="table table-hover table-responsive">
				<tr>
					<th style="display: none;">ㄹㅇ번호</th>
					<th>번호</th>
					<th width="300">게시판명</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>수정/삭제</th>
				</tr>
				<c:forEach items="${nList }" var="notice">
					<tr>
						<td style="display: none;" id="noticeNo">${notice.noticeNo }</td>
						<td align="center">${notice.rowNum }</td>
						<td align="center">${notice.menuName }</td>
						<td align="left">
							<c:url var="nDetail" value="noticeRequireDetail.doa">
								<c:param name="noticeNo" value="${notice.noticeNo }"/>
								<c:param name="menuName" value="${notice.menuName }"/>
							</c:url>
							<a href="${nDetail }">${notice.noticeTitle }</a>
						</td>
						<td align="center">${notice.userId }</td>
						<td align="center">${notice.noticeDate }</td>
						<td align="center"><a href="#">수정</a> / <a href="#">삭제</a></td>
					</tr>
				</c:forEach>
				
				<!-- 페이징 처리 -->
				<tr align="center" height="20">
					<td colspan="6">
						<!-- 이전 -->
						<c:if test="${pi.currentPage <= 1 }">
							[이전]&nbsp;
						</c:if>
						<c:if test="${pi.currentPage > 1 }">
							<c:url var="before" value="noticeRequireList.doa">
								<c:param name="page" value="${pi.currentPage - 1 }"/>
							</c:url>
							<!-- boardList.kh?page=${pi.currentPage - 1} -->
							<a href="${before }">[이전]</a>&nbsp;
						</c:if>
						<!-- 페이지 -->
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:url var="pagination" value="noticeRequireList.doa">
								<c:param name="page" value="${p }"/>
							</c:url>
							<c:if test="${p eq pi.currentPage }">
								<font color="red" size="4">[${p }]</font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a href="${pagination }">${p }</a>&nbsp;
							</c:if>
						</c:forEach>
						<!-- 다음 -->
						<c:if test="${pi.currentPage >= pi.maxPage }">
							[다음]&nbsp;
						</c:if>
						<c:if test="${pi.currentPage < pi.maxPage }">
							<c:url var="after" value="noticeRequireList.doa">
								<c:param name="page" value="${pi.currentPage + 1 }"/>
							</c:url>
							<a href="${after }">[다음]</a>&nbsp;
						</c:if>
					</td>
				</tr>
			</table>
			</div>	
			<br>
		</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- end footer -->
</body>
</html>