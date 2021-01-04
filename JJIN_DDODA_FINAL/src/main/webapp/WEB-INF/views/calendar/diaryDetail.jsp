<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이일기 보기</title>
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
/* Position the image container (needed to position the left and right arrows) */
	.containers {
	  position: relative;
	  width : 500px;
	  height : 350px;
	  margin : auto;
	}
	
	/* Hide the images by default */
	.mySlides {
	  display: none;
	  width : 500px;
	  height : 350px;
	  margin : auto;
	}
	
	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
	  cursor: pointer;
	}
	
	/* Next & previous buttons */
	.prevv,
	.nextt {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: black;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	
	/* Position the "next button" to the right */
	.nextt {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	.prevv {
		left : 0;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prevv:hover,
	.nextt:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	}

/* On hover, add a black background color with a little bit see-through */
.prevv:hover, .nextt:hover {
  background-color: rgba(0,0,0,0.8);
}
.main_slideImg {position:absolute;}
.main_slideImg{width:100%;height:300px;
-webkit-transition: opacity 1s ease-in-out; 
-moz-transition: opacity 1s ease-in-out; 
-o-transition: opacity 1s ease-in-out; 
transition: opacity 1s ease-in-out; 
opacity: 0;
}
</style>
</head>
<body>
<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->
	<div class="content" style="height:800px;">
	<div class="menub" style="">
		<ul>
			<li></li>
			<li><div class="name"><a>달력</a></div><div class="imgwrapper"> > </div></li>
			<li><div class="name more"><a>기본 정보</a></div><div class="imgwrapper"> > </div></li>
			<li><div class="name more"><a>마이 일기</a></div><div class="imgwrapper"> > </div></li>
			<li><div class="name more"><a>마이 식단</a></div><div class="imgwrapper"> > </div></li>
		</ul>
	</div>
	<div class="main" style="height:600px;">
		<div class="main-name">
			<h2 class="main-name-h2">마이일기 보기</h2>
		</div>
		<div style="text-align : right;">
			<c:url var="myDiaryDelete" value="myDiaryDelete.doa">
				<c:param name="opendiaryNo" value="${ opendiary.opendiaryNo }"></c:param>
			</c:url>
			<c:url var="myDiaryModify" value="myDiaryModifyView.doa">
				<c:param name="opendiaryNo" value="${ opendiary.opendiaryNo }"></c:param>
			</c:url>
			<c:url var="calendarView" value="calendarView.doa">
			</c:url>
			<c:if test="${ loginUser.userId eq opendiary.userId }">
				<button type="button" class="btn btn-primary" onclick="location.href='${myDiaryModify}'">수정하기</button>
				<button type="button" class="btn btn-primary" onclick="location.href='${myDiaryDelete}'">삭제하기</button>
			</c:if>
			<button type="button" class="btn btn-primary" onclick="location.href='${calendarView}'">달력화면</button>
		</div>
		<div class="table-wrap">
			<input type="hidden" id="opendiaryNo" value="${opendiary.opendiaryNo }">
			<input type="hidden" id="sessionId" value="${loginUser.userId }">
			<table align="center" cellpadding="10" cellspacing="0" border="1" width="500" class="table">
				<tr >
				<td style="width:300px;height:310px;"rowspan="4">
					<div class="containers">
						<c:if test="${ !empty diaryImg }">
							<c:forEach items="${diaryImg }" var="diaryImg" varStatus="status">
									<div class="mySlides">
										<img src="/resources/opendiaryUploadFiles/${diaryImg.userId }/${diaryImg.opendiaryNo}/${diaryImg.imgRenamePath}" style="width:100%;height:100%;">
									</div>
							</c:forEach>
						</c:if>
						<c:if test="${ empty diaryImg }">
							<div class="noimg" style="padding-top : 29%;font-weight:bolder;font-size:1.3em;">
							이미지가 없습니다.
							</div>
						</c:if>
						<a class="prevv" onclick="plusSlides(-1)"> &#10094;</a>
						<a class="nextt" onclick="plusSlides(1)"> &#10095;</a>
					</div>
				</td>
				</tr>
				<tr>
					<td height="20">제목</td>
					<td>${opendiary.opendiaryTitle }</td>
					
				</tr>
				<tr>
					<td colspan="2" height="20">${opendiary.opendiaryDate }</td>
				</tr>
				<tr>
					<td colspan="2">${opendiary.opendiaryContents }</td>
				</tr>
			</table>
		</div>
	
	</div>
	</div>
	<!-- end content -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script>
	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  var captionText = document.getElementById("caption");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	}
	</script>
</body>
</html>