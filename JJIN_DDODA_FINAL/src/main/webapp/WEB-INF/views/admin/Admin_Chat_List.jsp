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
			<h2 class="main-name-h2">채팅방 오픈 요청</h2>
		</div>
		<div class="table-wrap">
		<table align="center" width="800" cellspacing="0" style="clear:right;" class="table">
			<tr>
				<td>번호</td>
				<td width="300">제목</td>
				<td>요청자</td>
				<td>채팅방 오픈</td>
			</tr>
			<c:if test="${ empty cList }">
				<tr><td colspan="7" align="center">게시글이 없습니다</td></tr>
			</c:if>
			<c:if test="${!empty cList }">
			<c:forEach items="${cList }" var="chat">
				<c:url var="cDetail" value="adminChatDetail.doa">
					<c:param name="mateNo" value="${chat.mateNo }"/>
				</c:url>
				<tr>
					<td align="center" class="mateNo">${chat.mateNo }</td>
					<td align="center" onclick="location.href='${cDetail}'">${chat.mateTitle }</td>
					<td align="center">${chat.userId }</td>
					<td align="center">
						<c:if test="${chat.mymate.mateStatus == 'N' }">
							<input type="button" class="chatOpen btn btn-primary" value="open">
						</c:if>
						<c:if test="${chat.mymate.mateStatus == 'Y' }">
							<button class="chatOpen btn btn-primary" disabled>confirm</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</c:if>
			<tr align="center">
				<td colspan="7">
					<!-- 이전 --> <c:if test="${pi.currentPage <= 1}"> < </c:if> <c:if
						test="${pi.currentPage > 1}">
						<c:url var="before" value="noticeRequireList.doa">
							<c:param name="page" value="${pi.currentPage -1 }"></c:param>
						</c:url>
						<a href="${before }"> < </a>
					</c:if>
					 	<!-- 페이지 -->
					 	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
						<c:url var="pagination" value="noticeRequireList.doa">
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
						<c:url var="after" value="noticeRequireList.doa">
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
		$(".chatOpen").click(function() {
			var str = ""
			var tdArr = new Array();	// 배열 선언
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			
			var mateNo = td.eq(0).text();
			
			td.each(function(i){	
				tdArr.push(td.eq(i).text());
			});
			
			console.log("mateNo ==> " + mateNo);
			
			$.ajax({
				url : "adminChatSuccess.doa",
				type : "get",
				data : {"mateNo" : mateNo},
				success : function(data) {
					alert("채팅방이 정상적으로 오픈되었습니다.");
					$(".chatOpen").attr("disabled", true);
					$(".chatOpen").attr("value", "confirm");
				}
			});
		});
	</script>
</body>
</html>