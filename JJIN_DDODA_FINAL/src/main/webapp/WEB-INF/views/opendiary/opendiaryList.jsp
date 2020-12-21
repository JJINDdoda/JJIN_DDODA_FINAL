<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유일기 게시판 리스트</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	/* .content {height :300px;}
	.menub {
	background: pink; width:10%; height:100%; float:left; text-align:center;
	margin-left : 5%; margin-right : 5%;
	}
	.main {width:75%; float:left;}
	.menub li, table {color : black;} */
	.table-wrap {height : 450px;}
	.imglist-wrap {border:1px solid none;position: relative; height: 100%; width: 100%; display: block;}
	.imglist {list-style:none; padding-left:0; position: relative; height: 100%; width: 690px;}
	.imglist li {width:25%;float:left; height:50%;}
	#searchArea {position:relative;}
	.imgEach {border : 1px solid none;top: 10px; left: 460px;}
	.imgEach-wrapper:hover {border : 5px solid #f7bf99;}
	@media ( max-width : 991px) {
	.content {
		height : 1300px;
	}
	.main, .table-wrap {height : 700px;}
	.imglist li {
		width : 50%; height : 40%;
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
	<div class="menub">
		<ul>
			<li><a href="opendiaryList.doa">공유일기 게시판</a></li>
			<li><a href="mateList.doa">메이트 커뮤니티</a></li>
		</ul>
	</div>
	<div class="main">
		<div class="main-name">
			<h4 class="main-name-h2">일기 공유 게시판</h4>
		</div>
		<div class="table-wrap">
			<c:choose>
				<c:when test="${ empty opendiaryList }">
					<div>
						<table align="center" width="100%">
						<tr><td colspan="5" align="center">게시글이 없습니다</td></tr>
						</table>
					</div>
				</c:when>
				<c:when test="${ !empty opendiaryList }">
					<div class="imglist-wrap">
						<ol class="imglist" style="width:100%;margin-right:0px;margin-bottom:0px;">
						<c:forEach items="${opendiaryList }" var="opendList">
							<c:url var="opendiaryDetail" value="opendiaryDetail.doa">
								<c:param name="opendiaryNo" value="${opendList.opendiaryNo }"></c:param>
								<c:param name="page" value="${pi.currentPage }"></c:param>
							</c:url>
							<li class="imgEach" onclick="location.href='${opendiaryDetail}'">
								<div class="imgEach-wrapper" style="width:90%;margin-left:10px;margin-right:10px; margin-bottom:0px;">
								<table align="center" width="100%" cellspacing="0" style="clear:right;width:99.8%;margin-bottom:0px;border-bottom:2px solid #ddd;" class="table imgtable">
									<tr>
									<c:if test="${ !empty diaryImgList}">
										<c:forEach items="${diaryImgList }" var="diaryImgList">
										<c:choose>
											<c:when test="${diaryImgList.opendiaryNo == opendList.opendiaryNo}">
												<td colspan="3"><img src="/resources/opendiaryUploadFiles/${diaryImgList.userId }/${diaryImgList.opendiaryNo }/${diaryImgList.imgRenamePath}" width="150" height="130"></td>
											</c:when>
										</c:choose>
										</c:forEach>
										<c:if test="${ opendList.mainImagePath == null }">
												<td colspan="3" width="150" height="142">NO IMAGE</td>
										</c:if>
									</c:if>
									</tr>
									<tr>
										<td>${opendList.userId }</td>
										<td>${opendList.opendiaryDate }</td>
									</tr>
									<tr>
										<td colspan="2">${opendList.opendiaryTitle }</td>
									</tr>
								</table>
								</div>
							</li>
						</c:forEach>
						</ol>
					</div>
					<div class="page-wrap">
					<table>
						<tr align="center">
							<td colspan="7">
								<!-- 이전 --> <c:if test="${pi.currentPage <= 1}"> < </c:if> <c:if
									test="${pi.currentPage > 1}">
									<c:url var="before" value="opendiaryList.doa">
										<c:param name="page" value="${pi.currentPage -1 }"></c:param>
									</c:url>
									<a href="${before }"> < </a>
								</c:if>
								 	<!-- 페이지 -->
								 	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
									<c:url var="pagination" value="opendiaryList.doa">
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
									<c:url var="after" value="opendiaryList.doa">
										<c:param name="page" value="${pi.currentPage +1 }"></c:param>
									</c:url>
									<a href="${after }"> > </a>
								</c:if>
							</td>
						</tr>
					</table>
					</div>
				</c:when>
			</c:choose>
		</div>	
		<br><br>
		<div id="searchArea" align="center">
			<form action="openDiarySearch.doa" method="get">
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
		<c:if test="${ !empty sessionScope.loginUser}">
				<button align="center" onclick="openInsertView()">글쓰기</button>
		</c:if>
		</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<script>
		//로그인하지 않은 경우 공유일기 작성 불가
		function openInsertView() {
			location.href="openInsertView.doa";
		}
	</script>
</body>
</html>