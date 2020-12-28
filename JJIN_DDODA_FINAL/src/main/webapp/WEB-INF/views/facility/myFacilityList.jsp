<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 시설정보 조회</title>
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
		<%-- <jsp:include page="../common/facilityMenubar.jsp"></jsp:include> --%>
				<jsp:include page="../common/facilityMenubar.jsp"></jsp:include>
	
		<div class="main">
			<div class="main-name" style="height: 80px; width: 1200px;">
				<div id="modifyWrapper" class="table-wrap">
					<table class="table" id="facilityTbl">
						<tr align="center">
							<th>시설 상호명</th>
							<th>운동분야</th>
							<th>승인여부</th>
							<th>수정 / 조회</th>
							<th>삭제</th>
						</tr>
						<c:if test="${empty exerciseFacility }">
							<tr>
								<td colspan="5">등록된 시설정보가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${exerciseFacility }" var="exerciseFacility">
							
							<tr>
								<td>${exerciseFacility.facilityName }</td>
								<td>${exerciseFacility.facilityField }</td>
								<td>
									<c:if test="${exerciseFacility.termsYn eq 'Y'}">
										<span>승인완료</span>
									</c:if>
									<c:if test="${exerciseFacility.termsYn eq 'N'}">
										<span>승인대기</span>
									</c:if>
								</td>
								<td>
									<input type="button" value="수정하기" style="width: 100px;" onclick="location.href='facilityInfoModifyView.doa?facilityNo='+${exerciseFacility.facilityNo}">
									<input type="button" value="조회하기" style="width: 100px;" onclick="location.href='facilityDetail.doa?facilityNo='+${exerciseFacility.facilityNo}">
								</td>
								<td>
									<input type="hidden" value="${exerciseFacility.facilityNo }" name="facilityNo" id = "facilityNo">
									<input type="button" value="삭제하기" style="width: 100px;" onclick="deleteMyFacility(this)">
								</td>
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
									<c:url var="before" value="myfacilityList.doa">
										<!-- name값을 page로 하는 이유는 BoardController에서 RequestParam의 value값이 page이기 때문이다.  -->
										<c:param name="page" value="${pi.currentPage -1 }"></c:param>
									</c:url>
									<!-- boardList.kh?page=${pi.currentPage - 1} -->
									<a href="${before }">[이전]</a>&nbsp;
								</c:if>
								<!-- 페이지 -->
								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<c:if test="${p eq pi.currentPage }">
										<font color="red" size="4">[${p }]</font>
									</c:if>
									<c:url var="pagination" value="myfacilityList.doa">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<c:if test="${p ne pi.currentPage }">
										<a href="${pagination }">${p }</a>&nbsp;
									</c:if>
								</c:forEach>
								<!-- 다음 -->
								<c:if test="${pi.currentPage >= pi.maxPage }">
									[다음]
								</c:if>
								<c:if test="${pi.currentPage < pi.maxPage }">
									<c:url var="after" value="myfacilityList.doa">
										<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
									</c:url>
									<a href="${after }">[다음]</a>
								</c:if>
								
							</td>
						</tr>
					</table>
					
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
		function deleteMyFacility(obj){
			var facilityNo = $(obj).siblings()[0].value;
			var deleteFacility = confirm('시설을 삭제하시겠습니까?');
			if(deleteFacility == true){
				$.ajax({
					url : "deleteMyFacility.doa",
					type : "get",
					async : false,
					data : {"facilityNo" : facilityNo},
					success : function(result){
						if(result != 0){
							$(obj).parent().parent().remove();
						}
					}
				});
			}
		}
	</script>
</body>
</html>