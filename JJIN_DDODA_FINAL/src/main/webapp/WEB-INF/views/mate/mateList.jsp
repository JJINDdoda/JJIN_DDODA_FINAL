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
	 .main-name-h2 {
	font-family: 'Wemakeprice-Regular';
	color: #424242;
	font-size : 1.7em;
}
.menub {
	margin-left:6%;
	width:150px;
	height : 570px;
	background-color:white;
	text-align:left;
	float:left;
	border : 1px solid #edd5c5;
	border-top : 1px solid #f7bf99;
}

.menub>ul li {
	padding-left : 15px;
}
.menub>ul li:first-child {
	border-left : 1px solid #f7bf99;
	background-color:#f7bf99;
	height:40px;
	margin-top:0;
}
.menub>ul>li a {
	font-family: 'NanumSquareR';
	color:#797979;
	position:relative;
}
.menub>ul>li:hover a, .menub>ul>li:hover .imgwrapper {
	color : #f7bf99;
	-webkit-transition: all 0.5s ease;
  	transition: all 0.5s ease;
}
.name {
	width:100px;
	float:left;
}
.more {
	width:100px;
}
.menub>ul>li .imgwrapper {
	width:120px;
	text-align:right;
	color : #707070;
}
.menub>ul li .imgwrapper img {
	width:10px;
}
.main {
	width : 68%;
	margin-left : 2%;
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
	<div class="menub">
		<ul>
			<li></li>
			<li><div class="name"><a href="opendiaryList.doa">공유일기 게시판</a></div><div class="imgwrapper"> > </div></li>
			<li><div class="name more"><a href="mateList.doa?category=health">메이트 커뮤니티</a></div><div class="imgwrapper"> > </div></li>
		</ul>
	</div>

	<div class="main">
		<div class="main-name">
			<h2 class="main-name-h2">메이트 커뮤니티</h2>
		</div>
		<div style="width:75%;float:left;text-align:right;padding-right:10px;">
		<c:if test="${ !empty sessionScope.loginUser }">
			<button type="button" align="center" class="btn btn-primary" onclick="mateWriteView()">글쓰기</button>
		</c:if>
		</div>
		<div class="select-wrapper">
			<select id="category" name="category" class="menuSelect">
			<option value="health"
				<c:if test="${category == 'health'}" >selected</c:if> >헬스</option>
			<option value="diet"
				<c:if test="${category == 'diet'}" >selected</c:if> >다이어트</option>
			<option value="dance"
				<c:if test="${category == 'dance'}" >selected</c:if> >줌바댄스</option>
			<option value="etc"
				<c:if test="${category == 'etc'}" >selected</c:if> >기타</option>
		</select>
		</div>
		<div class="table-wrap">
		<table align="center" width="800" cellspacing="0" style="clear:right;" class="table">
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
						<td align="center">${status.index +1 }</td>
						<td align="center">${mate.mateTitle }</td>
						<td align="center">${mate.userId }</td>
						<td align="center">${mate.mateDate }</td>
						<td align="center">최대모집인원 : ${max }</td>
						<td align="center">${mate.mateView }</td>
						<%-- <c:if test="${mate.mateEnd == 'N'}">
							<td align="center">모집중</td>
						</c:if>
						<c:if test="${mate.mateEnd == 'Y'}">
							<td align="center">모집완료</td>
						</c:if> --%>
						<td align="center">${mate.mateEnd }</td>
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