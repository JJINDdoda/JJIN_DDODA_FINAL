<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
	body {
	  font-family: Arial;
	  margin: 0;
	}
	
	* {
	  box-sizing: border-box;
	}
	
	img {
	  vertical-align: middle;
	}
	
	/* Position the image container (needed to position the left and right arrows) */
	.containers {
	  position: relative;
	  width : 1300px;
	  height : 600px;
	  margin : auto;
	}
	
	/* Hide the images by default */
	.mySlides {
	  display: none;
	  width : 1300px;
	  height : 550px;
	  margin : auto;
	}
	
	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
	  cursor: pointer;
	}
	
	/* Next & previous buttons */
	.prev,
	.next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: white;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover,
	.next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* Container for image text */
	.caption-container {
	  text-align: center;
	  background-color: #222;
	  padding: 2px 16px;
	  color: white;
	}
	
	.row:after {
	  content: "";
	  display: table;
	  clear: both;

	}
	
	/* Six columns side by side */
	.column {
	  float: left;
	  width: 16.66%;
	}
	
	/* Add a transparency effect for thumnbail images */
	.demo {
	  opacity: 0.6;
	}
	
	.active,
	.demo:hover {
	  opacity: 1;
	}	
	
	#facilityInfo{
		width : 1200px;
		height : 500px;
		margin : auto;
	}
	
	#facilityTbl{
		float: left;
		width: 600px;
		height: 500px;
		margin-left: 50px;
	}
	
	#facilityBtn{
		width : 500px;
		height: 30px;
		margin : auto;
		
	}
	
	#priceInfo{
		width : 1200px;
		display: none;
		margin : auto;
	}
	
	#instructorInfo{
		width : 1200px;
		display: none;
		margin : auto;
	}
	
	#termsInfo{
		height: 200px;
		border: 1px solid black;
		padding : 10px;
	}
	
	.subBtn{
		float: right;
		margin-left: 10px;
		margin-top: 30px;
	}
	
	#instructorInfoWrapping{
		width: 1200px;
		
	}
	
	#facilitytable{
		width: 700px;
		height: 400px;
		font-size: 16px;
	}
	
	#instructorInfoImg{
		width: 15%;
		height: 80%;
		float: left;
		border : 2px solid darkgray;
		background: white;
		border-radius: 50%;
		
	}
	
	#instructorInfos{
		width: 900px;
		height: 250px;
		margin-left : 50px;
		float: left;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<br><br>
	<h2 style="text-align:center; font-weight: 900;">${facilityInfo.facilityName }</h2>
	<br><br>

	<div class="containers">
		<c:forEach items="${facilityPicture }" var="facilityPicture">
			<div class="mySlides">
		    	<div class="numbertext">1 / 6</div>
		    	<img src="resources/facilityFiles/facilityPicture/${facilityPicture.pictureRename }" style="width:100%; height:550px">
		  	</div>
		</c:forEach>
		
		  
		<a class="prev" onclick="plusSlides(-1)">❮</a>
		<a class="next" onclick="plusSlides(1)">❯</a>
		
		<br>
		<div class="row">
			<c:forEach items="${facilityPicture }" var="facilityPicture" varStatus="status">
				<div class="column">
					<img class="demo cursor" src="resources/facilityFiles/facilityPicture/${facilityPicture.pictureRename }" style="width:100%; height: 50px;" onclick="currentSlide(${status.count})" alt="The Woods">
				</div>
			</c:forEach>
			<!-- 상태형변수 -->
			<!-- count : 1부터 시작, index : 0부터 시작, count :  -->
		</div>
	</div>
	
	<br><br><br>
	<div id="facilityInfo">
		<div style="width: 500px; height: 500px; float: left;">
			<div id="map" style="width:500px; height: 500px; position:relative;overflow:hidden;"></div>
		</div>
		<div id="facilityTbl">
			<p style="font-size: 20pt;">시설정보</p>
			<table id="facilitytable">
				<tr>
					<td>시설명</td>
					<td>${facilityInfo.facilityName }</td>
				</tr>
				<tr>
					<td>분야</td>
					<td>${facilityInfo.facilityField }</td>
				</tr>
				<tr>
					<td>운동시설종류</td>
					<td>${facilityInfo.facilityKinds }</td>
				</tr>
				<tr>
					<td>블로그 주소</td>
					<td>${facilityInfo.facilityBlog }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${facilityInfo.facilityPhone }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${facilityInfo.facilityAddr}</td>
				</tr>
			</table>
			<div id="facilityBtn">
				<input type="button" value="시설가격보기" id="facilityPrice" class="subBtn" onclick="facilityPriceDisplay()">
				<input type="hidden" value="0" id="priceValue">
				<input type="button" value="강사정보보기" id="instructor" class="subBtn" onclick="instructorDisplay()">
				<input type="hidden" value="0" id="instructorValue">
			</div>
		</div>
		
	</div>
	<br><br>

	<div id="priceInfo">
		<h3>❮시설 가격보기❯</h3>
		<br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th width="100px">개월수</th>
					<th width="150px">가격</th>
					<th>옵션</th>
					<th>혜택</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty facilityPrice }">
					<tr>
						<td colspan="4">등록된 가격정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty facilityPrice }">
					<c:forEach items="${facilityPrice }" var="facilityPrice">
						<tr>
							<td>${facilityPrice.months }</td>
							<td>${facilityPrice.price }</td>
							<td>${facilityPrice.options }</td>
							<td>${facilityPrice.benefits }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div id="termsInfo">
			<p style="font-size:15pt;font-weight:bolder;">이용약관 </p>
			${facilityInfo.termsOfUse }
		</div>
		<br><br>
	</div>
	<div id="instructorInfo">
		<h3>❮강사정보 보기❯</h3>
		<br>
		<c:if test="${empty instructorInfo }">
			<p>등록된 강사정보가 없습니다.</p>
		</c:if>
		<c:forEach items="${instructorInfo }" var="instructorInfo">
			<div id="instructorInfoWrapping">
				<div style="height: 250px; width: 1200px;">
					<div id="instructorInfoImg"><img src="resources/facilityFiles/instructorPicture/${instructorInfo.instructorRename }" style="width: 100%; height: 100%; border-radius: 50%;"></div>
					<div id = "instructorInfos">
						<div style="height:30%;"><p style="width:8%;float:left;font-weight:bolder;">강사명 :</p> ${instructorInfo.instructorName }</div>
						<div style="height:30%;"><p style="width:8%;float:left;font-weight:bolder;">경력 :</p> ${instructorInfo.carrer }</div>
						<div style="height:30%;"><p style="width:8%;float:left;font-weight:bolder;">다짐 :</p>${instructorInfo.promise }</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<br><br>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68326c8ad1d84bdc1f10d98cebe524dc&libraries=services"></script>
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
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${facilityInfo.latiLong}), // 지도의 중심좌표
	        level: 6 // 지도의 확대 레벨 
	    }; 

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${facilityInfo.latiLong}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		
		function facilityPriceDisplay(){
			console.log($("#priceValue").val());
			if($("#priceValue").val() == 0){
				document.getElementById("priceInfo").style.display = "block";
				$("#priceValue").val(1);
				if($("#instructorValue").val() == 1){
					document.getElementById("instructorInfo").style.display = "none";
					$("#instructorValue").val(0);
				}
			}
			else if($("#priceValue").val() == 1){
				document.getElementById("priceInfo").style.display = "none";
				$("#priceValue").val(0);
			}
		}
		
		
		function instructorDisplay(){
			if($("#instructorValue").val() == 0){
				document.getElementById("instructorInfo").style.display = "block";
				$("#instructorValue").val(1);
				if($("#priceValue").val() == 1){
					document.getElementById("priceInfo").style.display = "none";
					$("#priceValue").val(0);
				}
			}
			else if($("#instructorValue").val() == 1){
				document.getElementById("instructorInfo").style.display = "none";
				$("#instructorValue").val(0);
			}
			
		}
		
	</script>

	
</body>
</html>