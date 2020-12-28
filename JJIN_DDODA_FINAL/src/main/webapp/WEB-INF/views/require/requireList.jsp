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
	width :90%;
	margin-left : 5%;
}
.table, table {
	font-family: 'NanumSquareR';
	font-size : 0.6em;
}
.tableComment {
	font-size : 0.2em;
}

.table tr {
	width : 100%;
	border-top : 1px solid white;
}
.table tr td {
	padding-top : 10px;
	padding-bottom : 10px;
	text-align :center;
	font-size : 1.3em;
}
input[type="text"] {
	width: 100%;
}
textarea {
	width : 100%;
	resize : none;
}

.btndelete {
	width:68%;
	text-align:right;
	}
.addReply{
	width:7%;
	text-align:right;
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
		.btndelete {
			width:63%;
			text-align:right;
		}
		.addReply{
			width:7%;
			text-align:right;
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
		border-bottom : 1px solid lightgray;
		margin-bottom : 15px;
	}
	.searchText {
		width: 20%;
	}
	.content {
		height : 650px;
	}
	.btn{
	 	padding : 3px 3px;
	}
	.tableComment tbody {margin:5px;}
	.tableComment tbody tr {border : 1px solid lightgray;}
	.tableComment tr td, .mateComReplyTb tr td {
		float:left;
	}
	.tableComment>tr>td {
		border-top : 1px splid white;
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
			<div  style="width:100%;float:left;text-align:right;padding-right:10px;">
			<c:if test="${ !empty sessionScope.loginUser}">
				<button align="center" class="btn btn-primary" onclick="requireInsertView()">글쓰기</button>
			</c:if>
			</div>
			<div class="table-wrap">
				<table align="center" width="800"cellspacing="0"
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
					<select id="searchCondition" name="searchCondition"class="searchSelect">
						<option value="all"
							<c:if test="${search.searchCondition =='all' }">selected</c:if>>전체</option>
						<option value="writer"
							<c:if test="${search.searchCondition =='writer' }">selected</c:if>>작성자</option>
						<option value="title"
							<c:if test="${search.searchCondition =='title' }">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${search.searchCondition =='content' }">selected</c:if>>내용</option>
					</select> <input type="text" name="searchValue"
						value="${search.searchValue }" style="width:20%;">
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
		//로그인하지 않은 경우 문의사항 작성 불가
		function requireInsertView() {
			location.href="requireInsertView.doa";
		}
	</script>
</body>
</html>