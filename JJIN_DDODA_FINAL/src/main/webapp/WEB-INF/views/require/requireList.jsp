<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
.content {
	margin-left : 8%;
	margin-right : 8%;
	text-align : center;
	color : black;
}
.main {width : 100%;}
@media (max-width:991px;) {
	
	.main {
		margin-left : 0px;
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
	<div class="content">
		<div class="main">
			<div class="main-name">
				<h2 class="main-name-h2">문의사항 게시판</h2>
			</div>
			<div class="table-wrap">
				<table align="center" width="800" border="1" cellspacing="0"
					style="clear: right;" class="table table-hover table-responsive">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>올린날짜</th>
							<th>첨부파일</th>
							<th>답변여부</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:if test="${ empty requireList }">
						<tbody>
							<tr rowspan="9">
								<td colspan="7" align="center">게시글이 없습니다</td>
							</tr>
						</tbody>
					</c:if>
					<c:if test="${ !empty requireList }">
						<tbody>
							<c:forEach items="${requireList }" var="rList" varStatus="status">
								<c:url var="requireDetail" value="requireDetail.doa">
									<c:param name="requireNo" value="${rList.requireNo }"></c:param>
									<c:param name="page" value="${pi.currentPage }"></c:param>
								</c:url>
								<tr onclick="location.href='${requireDetail}'">
									<td>${status.index +1}</td>
									<td>${rList.requireTitle }</td>
									<td>${rList.userId }</td>
									<td>${rList.requireDate }</td>
									<c:if test="${ !empty rList.originalFilename }">
										<td>O</td>
									</c:if>
									<c:if test="${ empty rList.originalFilename }">
										<td>X</td>
									</c:if>
									<c:if test="${ rList.requireYN eq 'N'}">
										<td>미완료</td>
									</c:if>
									<c:if test="${ rList.requireYN eq 'Y'}">
										<td>완료</td>
									</c:if>
									<td>${rList.rCount }</td>
								</tr>
							</c:forEach>
							<tr align="center">
								<td colspan="7">
									<!-- 이전 --> <c:if test="${pi.currentPage <= 1}"> < </c:if> <c:if
										test="${pi.currentPage > 1}">
										<c:url var="before" value="requireList.doa">
											<c:param name="page" value="${pi.currentPage -1 }"></c:param>
										</c:url>
										<a href="${before }"> < </a>
									</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
										end="${pi.endPage}">
										<c:url var="pagination" value="requireList.doa">
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
										<c:url var="after" value="requireList.doa">
											<c:param name="page" value="${pi.currentPage +1 }"></c:param>
										</c:url>
										<a href="${after }"> > </a>
						</tbody>
					</c:if>
					</td>
					</tr>
					</c:if>
				</table>
			</div>
			<br>
			<br>
			<div id="searchArea" align="center" width="1000px" class="searchBox">
				<form action="requireSearch.doa" method="get">
					<select id="searchCondition" name="searchCondition">
						<option value="all"
							<c:if test="${search.searchCondition =='all' }">selected</c:if>>전체</option>
						<option value="writer"
							<c:if test="${search.searchCondition =='writer' }">selected</c:if>>작성자</option>
						<option value="title"
							<c:if test="${search.searchCondition =='title' }">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${search.searchCondition =='content' }">selected</c:if>>내용</option>
					</select> <input type="text" name="searchValue"
						value="${search.searchValue }"> <input type="submit"
						value="검색">

				</form>
			</div>
			<c:if test="${ !empty sessionScope.loginUser}">
				<button align="center" onclick="requireInsertView()">글쓰기</button>
			</c:if>
		</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<script>
		//로그인하지 않은 경우 문의사항 작성 불가
		function requireInsertView() {
			location.href="requireInsertView.doa";
		}
	</script>
</body>
</html>