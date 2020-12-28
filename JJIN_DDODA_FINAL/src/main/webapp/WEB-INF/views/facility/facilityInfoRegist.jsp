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
	.table-wrap tr td {width:150px;}
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
					<div class="facilityMenu"id="facilityRegistor" style="font-size: 20px; text-align: center; line-height: 80px;">시설정보입력</div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityPriceClick()">
					<div class="facilityMenu" style="font-size: 20px; text-align: center; line-height: 80px;">시설가격입력</div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityInstructorClick()">
					<div class="facilityMenu" style="font-size: 20px; text-align: center; line-height: 80px;">강사정보입력</div>
				</div>
			</div>
			<br><br>
			<div class="table-wrap">
				<form action="facilityRegistration.doa" method="post" enctype="multipart/form-data">
					<table class="table" id="facilityTbl">
						<tr>
							<td>시설명</td>
							<td>
								<input type="text" name="facilityName" style="width: 800px;" required>
							</td>
							<td style="width: 100px;">시설종류</td>
							<td>
								<select name="facilityField" style="width: 200px; height: 25px; font-size: 12pt;" required>
									<option value="health" selected>헬스장</option>
									<option value="yoga">요가</option>
									<option value="fila">필라테스</option>
								</select>
							</td>
						</tr>
								
						<tr>
							<td>시설주소</td>
							<td colspan="4">
								<input type="text" id="sample5_address" placeholder="주소" name="addr" style="width:600px;" readonly>
								<input type="text" id="detailAddr" placeholder="상세주소" name="detailAddr" style="width:500px;" required>
								<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="width:100px;"><br>
								<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
								<input type="hidden" value="" id="latiLong" name="latiLong">
							</td>
						</tr>
						<tr>
							<td>시설상세정보</td>
							<td colspan="4">
								<textarea cols="50" rows="7" name="facilityKinds" required></textarea>
							</td>
						</tr>
						<tr>
							<td>블로그 / 카페</td>
							<td colspan="4">
								<input type="text" name="facilityBlog">
							</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td colspan="4">
								<input type="text" name="facilityPhone" required>
							</td>
						</tr>
						<tr>
							<td>이용약관</td>
							<td colspan="4">
								<textarea rows="5" cols="50" name="termsOfUse"></textarea>
							</td>
						</tr>
						<tr>
							<td rowspan="6">시설사진</td>
							<td colspan="4">
								<a href="#this" onclick="addFile()">파일추가</a><br>
								<span>시설사진등록순서대로 첨부해주세요.</span>
							</td>
						 </tr>
						 <tr>
						 	<td style="width: 500px">
						 		<input type="file" name="picturePath" style="width:500px; float: left">
						 	</td>
						 	<td colspan="3">
						 		<a href='#this' onclick='filedelete(this)' style="width: 100px; float: left; line-height: 25px;">- 삭제</a>
						 	</td>
						 </tr>
						
					</table>
					<div align="center">
						<input type="submit" value="등록하기" class="insert btn btn-primary"> &nbsp;
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
		function facilityPriceClick(){
			location.href='facilityPriceRegistView.doa';
		}
		
		function facilityInstructorClick(){
			location.href='facilityInstructorRegistView.doa';
		}
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                        var location = result.y + ', ' + result.x;
	                        console.log(location);
	                        $("#latiLong").val(location);
	                    }
	                });
	            }
	        }).open();
	    }
	    
	    var clicked = 1;
	    
	    function addFile(){
	    	if(clicked < 5){
	    		var str = "<tr><td style='width: 500px'><input type='file' name='picturePath' style='width:500px; float: left'></td>" + 
					"<td colspan='3'><a href='#this' onclick='filedelete(this)' style='width: 100px; float: left; line-height: 25px;'>- 삭제</a></td></tr>";
				$('#facilityTbl').append(str);
				clicked++;
	    	}
	    	else{
	    		alert('최대5개 등록 가능합니다.');
	    	}
	    	
	    }
	    
	    function filedelete(obj){
	    	if(clicked > 1){
	    		var choiceRow = $(obj).parent().parent();
				choiceRow.remove();
	            deleteFile($(this));
	            clicked--;
	    	}
	    	else{
	    		alert('최소 1개이상 등록 해야합니다.');
	    	}
	    }

	    
	    function deleteFile(obj) {
	        obj.parent().remove();
	    }



	</script>
</body>
</html>