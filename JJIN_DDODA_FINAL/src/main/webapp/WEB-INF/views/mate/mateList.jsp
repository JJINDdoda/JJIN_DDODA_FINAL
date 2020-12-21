<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메이트 모집 커뮤니티</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->
	<div class="content">
	<div class="menub">
		<ul>
			<li><a href="opendiaryList.doa">공유일기 게시판</a></li>
			<li><a href="mateList.doa">메이트 커뮤니티</a></li>
		</ul>
	</div>

	<div class="main">
		<div class="main-name">
			<h2 class="main-name-h2">메이트 커뮤니티</h2>
		</div>
		<div class="table-wrap">
		<select id="category" name="category">
			<option value="health"
				<c:if test="${category == 'health'}" >selected</c:if> >헬스</option>
			<option value="diet"
				<c:if test="${category == 'diet'}" >selected</c:if> >다이어트</option>
			<option value="dance"
				<c:if test="${category == 'dance'}" >selected</c:if> >줌바댄스</option>
			<option value="etc"
				<c:if test="${category == 'etc'}" >selected</c:if> >기타</option>
		</select>
		<table align="center" width="800" border="1" cellspacing="0" style="clear:right;" class="table">
			<tr>
				<td>번호</td>
				<td width="300">제목</td>
				<td>작성자</td>
				<td>작성날짜</td>
				<td>모집인원</td>
				<td>조회수</td>
				<td>모집완료</td>
			</tr>
			<c:if test="${ empty mateList }">
				<tr><td colspan="7" align="center">게시글이 없습니다</td></tr>
			</c:if>
			<c:if test="${!empty mateList }">
			<c:forEach items="${mateList }" var="mate" varStatus="status">
			<!-- 최대최소 모집 인원 -->
				<c:set var="requireNumber" value="${mate.mateRequireNo }"/>
				<c:set var="min" value="${ fn:substring(requireNumber,0,1) }"/>
				<c:set var="max" value="${ fn:substring(requireNumber,2,3) }"/>
			
				<c:url var="mateDetail" value="mateDetail.doa">
					<c:param name="mateNo" value="${mate.mateNo }"></c:param>
					<c:param name="page" value="${pi.currentPage }"></c:param>
				</c:url>
				
				<input type="hidden" id="mateCategory" value="${category }">
				<%-- <c:if test="${mate.category == 'health'}"> --%>
				<tr onclick="location.href='${mateDetail}'">
						<td align="center">${status.index }</td>
						<td align="center">${mate.mateTitle }</td>
						<td align="center">${mate.userId }</td>
						<td align="center">${mate.mateDate }</td>
						<td align="center">최대모집인원 : ${max }</td>
						<td align="center">${mate.mateView }</td>
						<c:if test="${mate.mateEnd == 'N'}">
							<td align="center">모집중</td>
						</c:if>
						<c:if test="${mate.mateEnd == 'Y'}">
							<td align="center">모집완료</td>
						</c:if>
				</tr>
				<%-- </c:if> --%>
			</c:forEach>
			</c:if>
			<tr align="center">
				<td colspan="7">
					<!-- 이전 --> <c:if test="${pi.currentPage <= 1}"> < </c:if> <c:if
						test="${pi.currentPage > 1}">
						<c:url var="before" value="mateList.doa">
							<c:param name="page" value="${pi.currentPage -1 }"></c:param>
						</c:url>
						<a href="${before }"> < </a>
					</c:if>
					 	<!-- 페이지 -->
					 	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
						<c:url var="pagination" value="mateList.doa">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<c:if test="${p eq pi.currentPage }">
							<a href="${pagination }">${p }</a>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<a href="${pagination }">${p }</a>
						</c:if>
					</c:forEach>
					<!-- 이후 -->
					<c:if test="${pi.currentPage >= pi.maxPage }"> > </c:if>
					<c:if test="${pi.currentPage < pi.maxPage}">
						<c:url var="after" value="mateList.doa">
							<c:param name="page" value="${pi.currentPage +1 }"></c:param>
						</c:url>
						<a href="${after }"> > </a>
					</c:if>
				</td>
			</tr>
		</table>
		</div>
		<br>
		<div id="searchArea" align="center"  width="1000px" >
			<form action="mateSearch.doa" method="get">
			<select id="searchCondition" name="searchCondition">
				<option value="all"
					<c:if test="${search.searchCondition =='all' }">selected</c:if>>전체</option>
				<option value="writer"
					<c:if test="${search.searchCondition =='writer' }">selected</c:if>>작성자</option>
				<option value="title"
					<c:if test="${search.searchCondition =='title' }">selected</c:if>>제목</option>
				<option value="content"
					<c:if test="${search.searchCondition =='content' }">selected</c:if>>내용</option>
			</select>
			<input type="text" name="searchValue" value="${search.searchValue }">
			<input type="submit" value="검색">
			</form>		
		</div>
		<c:if test="${ !empty sessionScope.loginUser }">
			<button type="button" align="center" onclick="mateWriteView()">글쓰기</button>
		</c:if>
	</div>
	</div>
	<!-- end content -->

	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<script>
		function mateWriteView() {
			location.href="mateWriteView.doa";
		}
		$("#category").change(function() {
			var category = $("#category option:selected").val();
			var matecategory = $("#mateCategory").val();
			alert(matecategory);
			/* alert(category); */
			/* if (category == 'health'){
				matecategory = 'health';
				alert(matecategory);
			} else if (category == 'diet') {
				matecategory = 'diet';
				alert(matecategory);
			} else if (category =='dance') {
				matecategory = 'dance';
				alert(matecategory);
			} else if (category == 'etc'){
				matecategory = 'etc';
				alert(matecategory);
			} */
		});  
	</script>
</body>
</html>