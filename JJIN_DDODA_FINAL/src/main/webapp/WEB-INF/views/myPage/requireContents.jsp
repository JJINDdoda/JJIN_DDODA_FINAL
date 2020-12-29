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
		width : 50%;
		text-align:left;
		float:left;
		margin-top:10px;
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
	<input type="hidden" id="sessionId" value="${loginUser.userId }">
	<div class="content" style="height:600px;">
		<div class="menub">
				<ul>
				<li></li>
				<li><div class="name"><a href="myInfo.doa">회원정보 수정</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="opendiaryContentsList.doa?userId=${loginUser.userId }">내가 쓴글</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="myMateAttendList.doa?userId=${loginUser.userId }">마이 메이트</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="deleteMember.doa">회원탈퇴</a></div><div class="imgwrapper"> > </div></li>
			</ul>
		</div>
		<div class="main">
			<div class="main-name">
				<h2 class="main-name-h2">내가 쓴글</h2>
			</div>
			<div class="select-wrapper">
				<c:if test="${!empty opendiaryContents }">
				<a style="color:#f7bf99;" href="opendiaryContentsList.doa?userId=${loginUser.userId }">공유일기 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${empty opendiaryContents }">
					<a style="color:#424242;" href="opendiaryContentsList.doa?userId=${loginUser.userId }">공유일기 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${!empty myContentsList }">
					<a style="color:#f7bf99;" href="mateContentsList.doa?userId=${loginUser.userId }">메이트 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${empty myContentsList }">
					<a style="color:#424242;"  href="mateContentsList.doa?userId=${loginUser.userId }">메이트 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${!empty requireContents }">
					<a style="color:#f7bf99;" href="requireContentsList.doa?userId=${loginUser.userId }">문의사항 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${empty requireContents }">
					<a style="color:#424242;"  href="requireContentsList.doa?userId=${loginUser.userId }">문의사항 커뮤니티</a> &nbsp;&nbsp;
				</c:if>
			</div>
			<div class="table-wrap">
				<table align="center" cellpadding="10" cellspacing="0"  width="500" class="table" id="mymateList">
					<tr>
						<td width="200">분류</td>
						<td width="500">제목</td>
						<td>작성날짜</td>
						<td>답변여부</td>
					</tr>
					<c:if test="${ empty requireContents }">
						<tr><td colspan="7" align="center">작성한 글이 없습니다.</td></tr>
					</c:if>
					<c:if test="${!empty requireContents }">
					<c:forEach items="${ requireContents }" var="requireContents" varStatus="status">
						<c:url var="requireDetail" value="mypageRequireDetail.doa">
							<c:param name="requireNo" value="${requireContents.requireNo }"></c:param>
							<c:param name="page" value="${pi.currentPage }"></c:param>
						</c:url>
						<tr onclick="location.href='${requireDetail}'">
							<td>문의사항 커뮤니티</td>
							<td>${ requireContents.requireTitle }</td>
							<td>${ requireContents.requireDate }</td>
							<td>${ requireContents.requireYN }</td>
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
							<c:url var="before" value="requireContentsList.doa">
								<c:param name="userId" value="${loginUser.userId}"></c:param>
								<c:param name="page" value="${pi.currentPage -1 }"></c:param>
							</c:url>
							<a href="${before }"> < </a>
						</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
							end="${pi.endPage}">
							<c:url var="pagination" value="requireContentsList.doa">
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
							<c:url var="after" value="requireContentsList.doa">
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