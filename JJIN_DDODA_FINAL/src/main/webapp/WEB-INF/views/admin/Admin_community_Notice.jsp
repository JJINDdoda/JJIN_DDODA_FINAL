<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	 .main-name-h2 {
	font-family: 'Wemakeprice-Regular';
	color: #424242;
	font-size : 1.7em;
}
.name {
	width:100px;
	float:left;
}
.more {
	width:100px;
}
.main {
	width : 68%;
	margin-left : 5%;
}
.table {
	font-family: 'NanumSquareR';
	font-size : 0.6em;
}
.table tr {
	width : 100%;
	border-top : 1px solid white;
}
.table tr td {
	padding-top : 10px;
	padding-bottom : 10px;
	text-align :center;
	font-size : 1.5em;
}
input[type="text"] {
	width: 100%;
}
textarea {
	width : 100%;
}
	.content {
		height : 600px;
	}


@media ( max-width : 991px) {
		.menub {
			width:85%;
			height : 50px;
		}
		.menub>ul {
			height :100%;
		}
		.menub>ul li:first-child {
			width : 0px;
			height : 100%;
		}
		.menub>ul li:nth-child(2){
			width : 20%;
			padding-left : 30px;
		}
		.menub li {
			width: 25%;
			padding-left : 20px;
		}
		.menub>ul>li .imgwrapper {
			display:none;
		}
		.main {
			width : 90%;
		}
		.content {
			height : 700px;
		}
	}
	.menuSelect { 
		width: 200px; /* 원하는 너비설정 */ 
		padding: .4em .4em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */ 
		background: url(/resources/assets/down_arrow.png) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
		background-size : 10px 10px;
		border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
	.searchSelect { 
		width: 100px; /* 원하는 너비설정 */ 
		padding: .1em .1em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */ 
		background: url(/resources/assets/down_arrow.png) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
		background-size : 10px 10px;
		border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
	.select-wrapper {
		width : 20%;
		text-align:right;
		float:left;
	}
	.table-wrap {
		margin-top : 20px;
		float:left;
		width : 100%;
		height : 450px;
	}
	.searchText {
		width: 20%;
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
	<jsp:include page="/WEB-INF/views/common/admin_menubar.jsp"/>

	<div class="main">
		<div class="main-name">
			<h2 class="main-name-h2">공지사항</h2>
		</div>
		<div style="width:75%;float:right;text-align:right;padding-right:10px;">
			<button type="button" align="center" class="btn btn-primary" onclick="location.href='nWriteView.doa';">글쓰기</button>
		</div>
		<div class="table-wrap">
		<table align="center" width="800" cellspacing="0" style="clear:right;" class="table">
			<tr>
				<td style="display: none;">ㄹㅇ번호</td>
				<td>번호</td>
				<td width="300">게시판명</td>
				<td>제목</td>
				<td>작성자</td>
				<td>날짜</td>
			</tr>
			<c:if test="${ empty nList }">
				<tr><td colspan="7" align="center">게시글이 없습니다</td></tr>
			</c:if>
			<c:if test="${!empty nList }">
			<c:forEach items="${nList }" var="notice">
				<c:url var="nDetail" value="noticeRequireDetail.doa">
					<c:param name="noticeNo" value="${notice.noticeNo }"/>
					<c:param name="menuName" value="${notice.menuName }"/>
				</c:url>
				
				<tr onclick="location.href='${nDetail}'">
					<td style="display: none;" id="noticeNo">${notice.noticeNo }</td>
					<td align="center">${notice.rowNum }</td>
					<td align="center">${notice.menuName }</td>
					<td align="center">${notice.noticeTitle }</td>
					<td align="center">${notice.userId }</td>
					<td align="center">${notice.noticeDate }</td>
				</tr>
			</c:forEach>
			</c:if>
			<tr align="center">
				<td colspan="7">
					<!-- 이전 --> <c:if test="${pi.currentPage <= 1}"> < </c:if> <c:if
						test="${pi.currentPage > 1}">
						<c:url var="before" value="adminChatList.doa">
							<c:param name="page" value="${pi.currentPage -1 }"></c:param>
						</c:url>
						<a href="${before }"> < </a>
					</c:if>
					 	<!-- 페이지 -->
					 	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
						<c:url var="pagination" value="adminChatList.doa">
							<c:param name="page" value="${p }"></c:param>
							<c:param name="category" value="${m }"></c:param>
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
						<c:url var="after" value="adminChatList.doa">
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
			<select id="searchCondition" name="searchCondition" class="searchSelect">
				<option value="all"
					<c:if test="${search.searchCondition =='all' }">selected</c:if>>전체</option>
				<option value="writer"
					<c:if test="${search.searchCondition =='writer' }">selected</c:if>>작성자</option>
				<option value="title"
					<c:if test="${search.searchCondition =='title' }">selected</c:if>>제목</option>
				<option value="content"
					<c:if test="${search.searchCondition =='content' }">selected</c:if>>내용</option>
			</select>
			<input type="text" name="searchValue" class="searchText" value="${search.searchValue }" style="width:20%;">
			<input type="submit" value="검색">
			</form>		
		</div>
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
			location.href='mateList.doa?category='+category;
		});  
	</script>
</body>
</html>