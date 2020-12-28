<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메이트 모집 상세보기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=310fc683ebc82542a03a51f91a654846&libraries=services,clusterer,drawing"></script>
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
	margin-left: 15%;
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

@media ( max-width : 991px) {
		.menub {
			width:85%;
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
		height : 350px;
		border-bottom : 1px solid lightgray;
		margin-bottom : 15px;
	}
	.searchText {
		width: 20%;
	}
	.content {
		height : 450px;
	}
	.btn{
	 	padding : 3px 3px;
	}
	.btndelete {
	width:68%;
	text-align:right;
	}
.addReply{
	width:7%;
	text-align:right;
}
</style>
</head>
<body>
<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content --> 
	<div class="content" style="margin-left:5%;margin-right:5%;">

	<div class="main">
		<div class="main-name">
			<h2 class="main-name-h2">음식명 : ${calorie.foodName }</h2>
		</div>
		<div>
			<c:url var="calorieList" value="adminCalorieList.doa">
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="calorieUpdate" value="cUpdateView.doa">
				<c:param name="calorieNo" value="${calorie.calorieNo }"/>
				<c:param name="page" value="${pi.currentPage }"/>
			</c:url>
			<c:url var="calorieDelete" value="adminCalorieDelete.doa">
				<c:param name="calorieNo" value="${calorie.calorieNo }"/>
			</c:url>
			<div style="text-align: right; width: 100%;">
				<button type="button" class="btn btn-primary" onClick="location.href='${calorieUpdate }'">수정하기</button>
				<button type="button" class="btn btn-primary"  onClick="location.href='${calorieDelete }'">삭제하기</button>
				<a href="${calorieList }" class="btn btn-primary">목록으로</a>
			</div>
		</div>
		<div class="table-wrap">
			<table align="center" cellpadding="10" cellspacing="0"width="500" class="table" id="mymate">
				<tr>
					<td width="70">칼로리</td>
					<td>${calorie.kcal }kcal</td>
				</tr>
				<tr>
					<td width="70">음식총량</td>
					<td>${calorie.foodAmount }</td>
				</tr>
				<tr>
					<td width="70">단위</td>
					<td>${calorie.unit }</td>
				</tr>
			</table>
		</div>
		<hr>
	</div>
	
	</div>
	<!-- end content -->

	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
</body>
</html>