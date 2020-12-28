<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 </title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.centerText table {
		margin : auto;
	}
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
 form {
 height:150px;
 }
 .content {height : 600px;}
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
				<li><div class="name"><a href="myInfo.doa">회원정보 수정</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="opendiaryContentsList.doa?userId=${loginUser.userId }">내가 쓴글</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="myMateAttendList.doa?userId=${loginUser.userId }">마이 메이트</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="deleteMember.doa">회원탈퇴</a></div><div class="imgwrapper"> > </div></li>
			</ul>
	</div>
	<div  class="main">
		<div class="centerText">
			 <div class="col-lg-12" style="align:center;">
			 <h4 align="center" style="width:80%; padding-left:145px;">(탈퇴) 동의 개인정보 처리에 대한 동의 철회 </h4>
			 <p>개인정보 처리에 대한 동의 철회
네이버 예약 서비스 이용 시 동의하셨던 개인정보 수집 및 이용 동의와 제3자 제공 동의를 철회하실 수 있습니다.
동의 철회 시 아래 안내 사항을 먼저 확인하여 주세요</p>
			 <div class="panel-body" style="border: 1px solid #ccc">
			  <textarea  class="form-control" rows="13">1. 개인정보 제공 및 이용 동의 철회는 모든 예약 및 주문 건이 완료 또는 취소로 거래가 종결된 상태에서 가능합니다.
2. 동의 철회 시 기존 예약 및 주문 이력은 철회 요청 익일 모두 삭제되며,  리뷰는 익명 처리 되어 DDO:DA 서비스 내에서 사용됩니다.
3. 전자상거래법에 의해 5년 이내 예약 및 주문 건에 대한 개인정보는 유지되며, 5분이 경과되는 시점에 삭제 처리됩니다.
4. 동의 철회 시 서비스 이용을 통해 받으시던 프로모션이나 이벤트가 모두 중단됩니다.</textarea>
			 </div>
			 
			 
			<form action="deleteMember.doa" name="form" method="post">
			     <div class="form-group">
			        <label class="checkbox-inline">
			           <input type="checkbox" name="agree">동의 철회 시 안내 사항을 확인하였습니다.
			        </label>
			     </div>
			
		 			 	<c:url var="mDelete" value="memberDelete.doa">
		 					<c:param name="userId" value="${loginUser.userId }" />
		 				</c:url>
		 				<button style="float:right;" type="button" class="btn btn-danger" onclick="return chk();">탈퇴하기</button>&nbsp;&nbsp;
		 				<a style="float:right;" class="btn btn-success" onclick="nochk()">취소하기</a> 
			
			
			</form>
			</div>
		</div>
	</div>
	</div>

	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<script type="text/javascript">
	function chk(){
	var agree = document.form.agree.checked;
	if(agree) {
		var ask = confirm("탈퇴하시겠습니까?"); //체크를 했을 떄 
		if(ask) {
			location.href="${mDelete}";
			return true;
		} else {
			return false;
		}
	} else {
		// 체크를 안했을 때
		alert("탈퇴 동의에 체크해주세요.");
	}
	 /* if(agree){
	 /*  num = 1; */
	 /* alert("num");
	 return  true;
	 } */
	 /* if(num==1){
	  document.form.submit();
	  alert("num");
	 }*/
	 
	}
	function nochk(){
	 alert("탈퇴를 취소했습니다.");
	location.href="deleteMember.doa";}
	</script>
</body>
</html>