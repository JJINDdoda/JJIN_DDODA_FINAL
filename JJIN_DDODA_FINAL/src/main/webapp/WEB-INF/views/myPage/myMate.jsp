<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
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
				<h2 class="main-name-h2">마이 메이트</h2>
			</div>
			<div class="table-wrap">
				<table align="center" cellpadding="10" cellspacing="0" width="500" class="table" id="mymateList">
					<tr>
						<td>번호</td>
						<td width="300">제목</td>
						<td>작성자</td>
						<td>작성날짜</td>
						<td>채팅방</td>
						<td>메이트 나가기</td>
					</tr>
					<c:if test="${ empty mateAttendList }">
						<tr><td colspan="7" align="center">참여중인 모임이 없습니다.</td></tr>
					</c:if>
					<c:if test="${!empty mateAttendList }">
					<c:forEach items="${ mateAttendList }" var="mateAttendList" varStatus="status">
						<input type="hidden" id="mateNo" value="${mateAttendList.mateNo }">
						<tr>
							<td>${ status.index+1 }</td>
							<td>${ mateAttendList.mateTitle }</td>
							<td>${ mateAttendList.userId }</td>
							<td>${ mateAttendList.mateDate }</td>
							<td>
								<c:if test="${mateAttendList.mymate.mateStatus == 'N' }">
									<button onclick="beforeOpen()">오픈 전</button>
								</c:if>
								<c:if test="${mateAttendList.mymate.mateStatus == 'Y' }">
									<button id="mymateOut" onclick="window.open('chatInsert.doa?mateNo=${mateAttendList.mateNo}&userId=${loginUser.userId }', '채팅방 입장', 'width=430px, height=650px, location=no, status=no, scrollbars=yes');">채팅방 입장</button>
								</c:if>
							</td>
							<td><button id="mymateOut" onclick="mateOut()">메이트 나가기</button></td>
						</tr>
					</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	<!-- end content -->

	<!-- footer -->
	<br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script>
	function beforeOpen() {
		alert("채팅방이 오픈되지 않았습니다.(관리자 연락)");
	}
	
	function mateOut(mateNo) {
		var sessionId = $("#sessionId").val();
		var mateNo = $("#mateNo").val();
		console.log("sessionId ==> " + sessionId + ", mateNo ==> " + mateNo);
		var ask = confirm("모집글에서 나가시겠습니까?");
		if(ask) {
			$.ajax({
				url : "mymateOut.doa",
				type : "post",
				data : { "mateNo" : mateNo, "userId" : sessionId },
				success : function(data) {
					if(data == 'success') {
						alert("성공적으로 처리되었습니다.");
						location.reload();
					} else {
						alert("메이트 나가기에 실패했습니다.");
						return false;
					}
				}
			});
			return true;
		} else {
			return false;
		}
	}
	</script>
</body>
</html>