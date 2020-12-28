<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Name</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.table > tr > td {
		color : green;
	}
	
	input {
		width:100%;
		height:30px;
		font-size:1.2em;
		background:#f6f6f6;
		border:none;
	}
	
	.insert {
		width:100px;
	}
	
	.file {
		background : white;
	}
	
	textarea{
		width:100%;
		resize:none;
		background:#f6f6f6;
		border:none;
	}
	
	.facilityInfo{
		height: 80px;
		width: 150px;
		float: left;
	}
	
	.facilityImg{
		height: 80px;
		width: 100px;
	}
	
	.nextMarker{
		height: 80px;
		width: 70px;
		float: left;
	}
	
	.nextMarkerImg{
		height: 80px;
		width: 50px;
		margin-left: 10px;
	}
	
	.facilityMenu{
		border: 1px solid darkgray;
		height: 80px;
		weight: 300px;
		border-radius: 10px;
	}
	
	#facilityRegistor{
		background-color: #FCE4D4;
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
	width: 80%;
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

<br><br>
	<!-- end header -->

	<!-- content -->	
	
	<div class="content" style="height:1000px;">
		<jsp:include page="../common/facilityMenubar.jsp"></jsp:include>
		<div class="main">
			<div class="main-name" style="height: 80px; width: 1200px;">
				<!-- <img src="../resources/images/facilityMap/facilityRegistor.png" class="facilityImg"> -->
				<div class="facilityInfo">
					<div class="facilityMenu" onclick="facilityInfoClick()" style="font-size: 20px; text-align: center; line-height: 80px;">시설정보입력</div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityPriceClick()">
					<div class="facilityMenu" style="font-size: 20px; text-align: center; line-height: 80px;">시설가격입력</div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityInstructorClick()">
					<div class="facilityMenu"  id="facilityRegistor" style="font-size: 20px; text-align: center; line-height: 80px;">강사정보입력</div>
				</div>
			</div>
			<br><br>
			<div class="table-wrap">
				<form id="fileForm" action="facilityInstructorModify.doa" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${facilityNo }" name="facilityNo">
					<table class="table" id="facilityTbl">
						<thead>
							<tr>
								<td colspan="5" align="left">
									<a href='#this' onclick="addInstructor()">+ 추가하기</a>
								</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${instructorInfo }" var="instructorInfo">
								<input type="hidden" value="${instructorInfo.instructorRename}" name="instructorRename">
								<tr>
									<td>강사이름</td>
									<td>
										<input type="text" name="instructorNameDB" id = "instructorName" value="${instructorInfo.instructorName }" readonly>
									</td>
									<td>강사사진</td>
									<td>
										<a href="./resources/facilityFiles/instructorPicture/${instructorInfo.instructorRename}">${instructorInfo.instructorPicture }</a>
										<input type="hidden" value="${instructorInfo.instructorRename }" name="instructorRename" id="instructorRename">
									</td>
									<td>
										<a href="#this" onclick="deleteDBPrice(this)">- 삭제하기</a>
									</td>
								</tr>
								<tr>
									<td>경력</td>
									<td colspan="3"><input type="text" name="carrerDB" value="${instructorInfo.carrer }"></td>
								</tr>
								<tr>
									<td>다짐</td>
									<td colspan="3">
										<textarea rows="5" cols="50" name="promiseDB">${instructorInfo.promise }</textarea>
									</td>
								</tr>
							
							</c:forEach>
						</tbody>
						
						
					</table>
					<div align="center">
						<input type="submit" value="등록하기" class="insert btn btn-primary" onclick="instructorDeleteSubmit()"> &nbsp;
						<a href="javascript:returnOpenList()">목록으로</a>
					</div>
				</form>
				
				
			</div>
			
		</div>
	</div>

	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68326c8ad1d84bdc1f10d98cebe524dc&libraries=services"></script>
	<script>
		
		function facilityInfoClick(){
			location.href='facilityInfoRegistView.doa';
		}
		
		function facilityPriceClick(){
			location.href='facilityPriceRegistView.doa';
		}
		
		function addInstructor(){
			var str = "<tr><td>강사이름</td><td><input type='text' name='instructorName'></td><td>강사사진</td><td><input type ='file' name = 'instructorPicture'></td><td><a href='#this' onclick='deletePrice(this)'>- 삭제하기</td></tr>"
						+"<tr><td>경력</td><td colspan='3'><input type='text' name='carrer'></td></tr>"+
						"<tr><td>다짐</td><td colspan='3'><textarea rows='5' cols='50' name='promise'></textarea></td></tr>";
			$('#facilityTbl').append(str);
			
		}
		
		
		function deletePrice(obj){
			var choiceRow = $(obj).parent().parent();
			var nextRow = choiceRow.next(); //nth-child()
			var doubleRow = nextRow.next();
			choiceRow.remove();
			nextRow.remove();
			doubleRow.remove();
            deleteFile($(this));
		}
		
		function deleteFile(obj) {
	        obj.parent().remove();
	    }
		
		var instructorRenameArr = [];
		function deleteDBPrice(obj){
			var instructorRename = $('#instructorRename').val();
			instructorRenameArr.push(instructorRename);
			var choiceRow = $(obj).parent().parent();
			var nextRow = choiceRow.next(); //nth-child()
			var doubleRow = nextRow.next();
			choiceRow.remove();
			nextRow.remove();
			doubleRow.remove();
            deleteFile($(this));
		}
		
		function instructorDeleteSubmit() {
			$.ajax({
				url : "instructorDeleteSubmit.doa",
				type : "get",
				traditional : true,
				data : {"instructorRenameArr" : instructorRenameArr},
				success : function(result) {
					
				}
			});
		}

	</script>
</body>
</html>