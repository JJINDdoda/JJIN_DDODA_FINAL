<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 리스트</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	
		<h1 align="center">게시글 목록</h1>

		<h3 align="center">
			<button onclick="location.href='dWriterForm.doa'">글쓰기</button>
		</h3>
		<table align="center" border="1" cellspacing="0" width="700">
			<tr>
				<th width="400">제목</th>
				<th width="200">날짜</th>
				<th width="100">첨부파일</th>
			</tr>
			<c:forEach items="${dList }" var="diary">
				<tr>
					<td align="center">
						<c:url var="dDetail" value="diaryDetail.doa">
							<c:param name="diaryNo" value="${diary.diaryNo }"></c:param>
							<c:param name="page" value="${pi.currentPage }"></c:param>
						</c:url>
						<a href="${dDetail}">${ diary.diaryTitle }</a>
					</td>
					<td align="center">${diary.diaryDate }</td>
					<td align="center">
					<c:if test="${ !empty diary.originalFileName  }">
						O
					</c:if> 
					<c:if test="${ empty diary.originalFileName  }">
						X
					</c:if>
					</td>
				</tr>
			</c:forEach>
		<!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td colspan="6">
				<!-- 이전 -->
				<c:if test="${pi.currentPage<=1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage >1 }">
					<c:url var="before" value="diaryList.doa">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<a href="${before}" style="text-decoration:none; color:dimgray;">[이전]</a>&nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<font color="F48038" size="4"> [${p}]</font>
					</c:if>
					<c:url var="pagination" value="diaryList.doa">
						<c:param name="page" value="${p}"></c:param>
					</c:url>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }" style="text-decoration:none; color:dimgray;">${p}</a>&nbsp;
					</c:if>
				</c:forEach>
				
				<!--  다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage < pi. maxPage }">
					<c:url var="after" value="diaryList.doa">
						<c:param name="page" value="${pi.currentPage +1 }"></c:param>
					</c:url>
					<%-- diaryList.kh?page=${pi.currentPage +1 --%>
					<a href="${after}" style="text-decoration:none; color:dimgray;">[다음]</a>
				</c:if>
		</tr>
		</table>
		<br>
		<br>
		<!--  게시물 검색하기 -->

		<div id="searchArea" align="center">
			<form action="diarySearch.doa" method="get">
				<select id="searchCondition" name="searchCondition">
					<option value="all"
						<c:if test="${search.searchCondition=='all'}">selected</c:if>>전체</option>
					<option value="date"
						<c:if test="${search.searchCondition=='date'}">selected</c:if>>날짜</option>
					<option value="title"
						<c:if test="${search.searchCondition=='title'}">selected</c:if>>제목</option>
					<option value="content"
						<c:if test="${search.searchCondition=='content'}">selected</c:if>>내용</option>
				</select> 
				 <input type="text" name="searchValue" value="${search.searchValue }">
				 <input type="submit" value="검색">
			</form>
		</div>
		

</body>
</html>