<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
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
	  width : 1500px;
	  height : 660px;
	  margin : auto;
	}
	
	/* Hide the images by default */
	.mySlides {
	  display: none;
	  width : 1500px;
	  height : 600px;
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
		width : 1500px;
		height : 660px;
		margin : auto;
	  }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	
	<h2 style="text-align:center">Slideshow Gallery</h2>

	<div class="containers">
		<div class="mySlides">
	    	<div class="numbertext">1 / 6</div>
	    	<img src="./resources/images/facilityInfo/marker01.png" style="width:100%; height:600px">
	  	</div>
	
		<div class="mySlides">
		  	<div class="numbertext">2 / 6</div>
		  	<img src="./resources/images/facilityInfo/marker01.png" style="width:100px">
		</div>
		
		<div class="mySlides">
			<div class="numbertext">3 / 6</div>
			<img src="http://placehold.it/500x100" style="width:100%">
		</div>
		  
		<div class="mySlides">
			<div class="numbertext">4 / 6</div>
			<img src="http://placehold.it/500x100" style="width:100%">
		</div>
		
		<div class="mySlides">
			<div class="numbertext">5 / 6</div>
			<img src="http://placehold.it/500x100" style="width:100%">
		</div>
		  
		<div class="mySlides">
			<div class="numbertext">6 / 6</div>
			<img src="http://placehold.it/500x100" style="width:100%">
		</div>
		  
		<a class="prev" onclick="plusSlides(-1)">❮</a>
		<a class="next" onclick="plusSlides(1)">❯</a>
		
		<div class="row">
			<div class="column">
				<img class="demo cursor" src="http://placehold.it/500x100" style="width:100%" onclick="currentSlide(1)" alt="The Woods">
			</div>
			<div class="column">
				<img class="demo cursor" src="http://placehold.it/500x100" style="width:100%" onclick="currentSlide(2)" alt="Trolltunga, Norway">
			</div>
			<div class="column">
				<img class="demo cursor" src="http://placehold.it/500x100" style="width:100%" onclick="currentSlide(3)" alt="Mountains and fjords">
			</div>
			<div class="column">
				<img class="demo cursor" src="http://placehold.it/500x100" style="width:100%" onclick="currentSlide(4)" alt="Northern Lights">
			</div>
			<div class="column">
				<img class="demo cursor" src="http://placehold.it/500x100" style="width:100%" onclick="currentSlide(5)" alt="Nature and sunrise">
			</div>    
			<div class="column">
				<img class="demo cursor" src="http://placehold.it/500x100" style="width:100%" onclick="currentSlide(6)" alt="Snowy Mountains">
		    </div>
		</div>
	</div>
	
	<div id="facilityInfo">
		<div style="width: 500px; height: 500px; float: left;">
			<div id="map" style="width:500px; height: 500px; position:relative;overflow:hidden;"></div>
		</div>
		<div style="float: left; width: 500px; height: 500px;" id="infoTb">
			<table>
			<thead>
				<tr style="background-color: olive;" id="tb">
					<th>시설명</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${facilityInfo.facilityName }</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
	<div id="facilityBtn">
		<input type="button" value="시설가격보기" id="facilityPrice" onclick="">
		<input type="hidden" value="0" id="priceValue">
		<input type="button" value="강사정보보기" id="instructor" onclick="">
		<input type="hidden" value="0" id="instructorValue">
	</div>
	<div id="priceInfo">
		
	</div>
	<div id="instructorInfo">
		
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=키넣기&libraries=services"></script>
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
		  //captionText.innerHTML = dots[slideIndex-1].alt;
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

		// 마커가 지도 위에 표시되도록 설정합니다........
		marker.setMap(map);
		
	</script>

	
</body>
</html>