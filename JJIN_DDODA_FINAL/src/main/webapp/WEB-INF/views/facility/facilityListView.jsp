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
	
	/* .facilityInfo{
		height: 80px;
		width: 200px;
		float: left;
	} */
	
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
	
	
	
	
	
	
	#mapwrap{position:relative;overflow:hidden; float: left;}
	.facilityCategory, .facilityCategory *{margin:0;padding:0;color:#000;}   
	.facilityCategory {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
	.facilityCategory .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
	.facilityCategory li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
	.facilityCategory .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
	.facilityCategory .ico_coffee {background-position:-10px 0;}  
	.facilityCategory .ico_store {background-position:-10px -36px;}   
	.facilityCategory .ico_carpark {background-position:-10px -72px;} 

	#mapwrap {
		position: relative;
		overflow: hidden;
		float: left;
	}
	
	.facilityCategory, .facilityCategory * {
		margin: 0;
		padding: 0;
		color: #000;
	}
	
	.facilityCategory {
		position: absolute;
		overflow: hidden;
		top: 10px;
		left: 10px;
		width: 150px;
		height: 50px;
		z-index: 10;
		border: 1px solid black;
		font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
		font-size: 12px;
		text-align: center;
		background-color: #fff;
	}
	
	.facilityCategory .menu_selected {
		background: #FF5F4A;
		color: #fff;
		border-left: 1px solid #915B2F;
		border-right: 1px solid #915B2F;
		margin: 0 -1px;
	}
	
	.facilityCategory li {
		list-style: none;
		float: left;
		width: 50px;
		height: 50px;
		padding-top: 5px;
		cursor: pointer;
	}
	
	.facilityCategory .ico_comm {
		display: block;
		margin: 0 auto 2px;
		width: 22px;
		height: 26px;
		background:
			url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
			no-repeat;
	}
	
	.facilityCategory .ico_coffee {
		background-position: -10px 0;
	}
	
	.facilityCategory .ico_store {
		background-position: -10px -36px;
	}
	
	.facilityCategory .ico_carpark {
		background-position: -10px -72px;
	}
	
	#facilityInfo {
		width: 500px;
		height: 600px;
		float: left;
	}
	
	.area {
		position: absolute;
		background: #fff;
		border: 1px solid #888;
		border-radius: 3px;
		font-size: 12px;
		top: -5px;
		left: 15px;
		padding: 2px;
	}
	
	.info {
		font-size: 12px;
		padding: 5px;
	}
	
	.info .title {
		font-weight: bold;
	}
	
	.map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;right:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px; float: right;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    
    .contents{
    	width: 180px;
    }
    
    .mapkind{
    	width: 600px;
    }
    
    .submenuBar{
    	width: 600px;
    }
    
    .cityOption{
    	width: 200px;
    }
    
    #facilityTable{
    	width: 100%;
    	
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
		<br><br>
			<div class="submenuBar">
				<input type="button" value="myArround" name="myArround" id="myArround" class="mapkind" onclick="myArroundClick()">
				<input type="button" value="city" name="city" id="city" class="mapkind" onclick="selectDisplay()"> 
				<select id="citys" style="display: none;" onclick="cityClick()" class="cityOption">
					<option selected value='none'>--선택--</option>
					<option value="서울" <c:if test="${city eq '서울' }">selected</c:if>>서울특별시</option>
					<option value="구미시" <c:if test="${city eq '구미시' }">selected</c:if>>구미시</option>
					<option value="대구광역시" <c:if test="${city eq '대구광역시' }">selected</c:if>>대구광역시</option>
					<option value="인천시" <c:if test="${city eq '인천시' }">selected</c:if>>인천시</option>
					<option value="부산시" <c:if test="${city eq '부산시' }">selected</c:if>>부산시</option>
					<option value="경주시" <c:if test="${city eq '경주시' }">selected</c:if>>경주시</option>
					<option value="구리시" <c:if test="${city eq '구리시' }">selected</c:if>>구리시</option>
					<option value="부천시" <c:if test="${city eq '부천시' }">selected</c:if>>부천시</option>
				</select>
				<input type="button" value="county" name="county" id="county" class="mapkind" onclick="countyClick()">
				<input type="hidden" value="0" id="displayCheck">
			</div>
			<div id="mapwrap" style="width: 600px; height: 600px;">
				<!-- 지도가 표시될 div -->
				<div id="map" style="width: 600px; height: 600px; position:relative;overflow:hidden;"></div>
				<!-- 지도 위에 표시될 마커 카테고리 -->
				<div class="facilityCategory">
					<ul>
						<li id="healthMenu" onclick="changeMarker('health')">
							<span class="ico_comm ico_coffee"><img src="../resources/images/facilityMap/marker11.png" style="width: 20px;" align="center"></span> 헬스장
						</li>
						<li id="yogaMenu" onclick="changeMarker('yoga')">
							<span class="ico_comm ico_store"><img src="../resources/images/facilityMap/marker13.png" style="width: 20px;" align="center"></span> 요가
						</li>
						<li id="filaMenu" onclick="changeMarker('fila')">
							<span class="ico_comm ico_carpark"><img src="../resources/images/facilityMap/marker15.png" style="width: 20px;" align="center"></span> 필라테스
						</li>
					</ul>
				</div>
				
			    <div class="hAddr" style="display: none" id="hAddr">
			    	<input type="hidden" value="0" id="addressDisplay">
			        <span class="title">현재 내 위치</span>
			        <span id="centerAddr"></span>
			    </div>
			</div>
			<div id="facilityInfo" style="margin-left: 20px; overflow-y:scroll;" class="table-wrap">
				<table id="facilityTable" class="table">
					<thead>
						<tr>
							<th width="30%;" height="40px;">시설명</th>
							<th width="40%;" height="40px;">주소</th>
							<th width="30%;" height="40px;">운동분야</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td height="40px;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>

	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68326c8ad1d84bdc1f10d98cebe524dc&libraries=services"></script>
	<script>
		var healthMenu = document.getElementById('healthMenu');
		var yogaMenu = document.getElementById('yogaMenu');
		var carparkMenu = document.getElementById('carparkMenu');
		
		var clicked = healthMenu;//클릭된 시설종류(health, yaga, fila)
		var kinds = '${kinds}'; // 클릭된 시설 종류(헬스, 요가, 필라테스)
		var beforekinds = '${beforekinds}';//이전에 클릭된 시설종류
		var beforeCity = '${beforeCity}';
		var city = '${city}';
		var county = '${county}';
		var markers = '';
		
		
		console.log('start city='+city+'county='+county+'kinds='+kinds+'beforekinds='+beforekinds+'beforeCity='+beforeCity);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.5472794,126.9581792), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨 
	    }; 

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		//시설의 위치를 표시할 좌표
		var Positions = [ 
			${markerAllList}
		];
		
		var contents = [
		    ${content}
		];
		
		Markers = [];
		createMarkers();
		changeMarker(beforekinds); // 지도에 헬스 마커가 보이도록 설정합니다    
	
		//마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
			var markerImage = new kakao.maps.MarkerImage(src, size, options);
			return markerImage;            
		}
	
		//좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
			var marker = new kakao.maps.Marker({
			    position: position,
			    image: image
			});
			return marker;  
		}   

		var marker;
		var overlay;
		//마커의 이미지와 좌표를 넣어준다
		function createMarkers() {
			for (var i = 0; i < Positions.length; i++) {  
				var imageSrc;
				if(clicked == healthMenu){
					imageSrc = '../resources/images/facilityMap/marker12.png'
				}
				else if(clicked == yogaMenu){
					imageSrc = '../resources/images/facilityMap/marker14.png'
				}
				else{
					imageSrc = '../resources/images/facilityMap/marker16.png'
				}    
		        var imageSize = new kakao.maps.Size(22, 26), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			      
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				marker = createMarker(Positions[i], markerImage); // 마커가 표시될 위치입니다
				
				//작은 인포윈도우
				var infowindow = new kakao.maps.InfoWindow({
			        content: contents[i].content, // 인포윈도우에 표시할 내용
			        removable : true
			    });
				
				kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
				
				
			    // 생성된 마커를 마커 배열에 추가합니다
			    Markers.push(marker);   
			}     
		}
		/* function closeOverlay() {
		    overlay.setMap(null);     
		}
			 */
		//마커들의 지도 표시 여부를 설정하는 함수입니다
		function setMarkers(map) {        
			for (var i = 0; i < Markers.length; i++) {  
				Markers[i].setMap(map);
			}       
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		//카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type){
			Markers = [];//마커를 초기화한다.
			// 커피숍 카테고리가 클릭됐을 때
			 if (type === 'fila') {
				clicked = filaMenu;
				kinds = 'fila';
			    // 주차장 카테고리를 선택된 스타일로 변경하고
			    healthMenu.className = '';
			    yogaMenu.className = '';
			    filaMenu.className = 'menu_selected';
			    
			}  else if (type === 'yoga') { // 편의점 카테고리가 클릭됐을 때
				clicked = yogaMenu;
				kinds = 'yoga';
			    // 편의점 카테고리를 선택된 스타일로 변경하고
			    healthMenu.className = '';
			    yogaMenu.className = 'menu_selected';
			    filaMenu.className = '';
			    
			} else{ // 주차장 카테고리가 클릭됐을 때
				clicked = healthMenu;
				kinds = 'health'; 
			    // 커피숍 카테고리를 선택된 스타일로 변경하고
			    healthMenu.className = 'menu_selected';
			    // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
			    yogaMenu.className = '';
			    filaMenu.className = '';
			    // 커피숍 마커들만 지도에 표시하도록 설정합니다
			} 
			
			MapLocations();
			clickKinds(); // ajax로 데이터 가져오기
			createMarkers();// 마커생성
			setMarkers(map);// 머커뿌려주기

		}
		
	
		function myArroundClick(){ //내 주변 지역 검색
			
			if($("#addressDisplay").val() == 0){
				document.getElementById("hAddr").style.display = "block";
				$("#addressDisplay").val(1);
			}
			if($("#displayCheck").val() == 1){
				document.getElementById("citys").style.display = "none";
				$("#displayCheck").val(0);
			}

			// 지도를 생성합니다    
			map = new kakao.maps.Map(mapContainer, mapOption);
	
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var latitude = position.coords.latitude, // 위도
			        longitude = position.coords.longitude; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(latitude, longitude); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			            // 인포윈도우에 표시될 내용입니다
			        // 마커와 인포윈도우를 표시합니다
			        displayMarker(locPosition);
			            
			      });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    
			    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
			        message = 'geolocation을 사용할수 없어요..'
			        
			    displayMarker(locPosition);
			}
	
	
	
			function displayMarker(locPosition) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({  
			        map: map, 
			        position: locPosition
			    }); 
			    
			    // 인포윈도우를 마커위에 표시합니다 
			    marker.setMap(map);
			    // 지도 중심좌표를 접속위치로 변경합니다
			    map.setCenter(locPosition);      
			} 
	
	
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
			    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', function() {
			    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});
	
			function searchAddrFromCoords(coords, callback) {
			    // 좌표로 행정동 주소 정보를 요청합니다
			    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
			}
	
			function searchDetailAddrFromCoords(coords, callback) {
			    // 좌표로 법정동 상세 주소 정보를 요청합니다
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}
	
			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        var infoDiv = document.getElementById('centerAddr');
	
			        for(var i = 0; i < result.length; i++) {
			            // 행정동의 region_type 값은 'H' 이므로
			            if (result[i].region_type === 'H') {
			                infoDiv.innerHTML = result[i].address_name;
			                city = result[i].region_1depth_name;
			                county = result[i].region_2depth_name;
			                break;
			            }
			        }
			    }
			}
			console.log(city + ',' + county);
			
			MapLocations();
			clickKinds();

		}
		
		function countyClick(){
			if($("#addressDisplay").val() == 1){
				document.getElementById("hAddr").style.display = "none";
				$("#addressDisplay").val(0);
			}
			if($("#displayCheck").val() == 1){
				document.getElementById("citys").style.display = "none";
				$("#displayCheck").val(0);
			}
			map = new kakao.maps.Map(mapContainer, mapOption);
			// 지도에 폴리곤으로 표시할 영역데이터 배열입니다 
			var areas = [
			    {
			        name : '용산구',
			        path : [
			            new kakao.maps.LatLng(37.5548768201904, 126.96966524449994),
			            new kakao.maps.LatLng(37.55308718044556, 126.97642899633566),
			            new kakao.maps.LatLng(37.55522076659584, 126.97654602427454),
			            new kakao.maps.LatLng(37.55320655210504, 126.97874667968763),
			            new kakao.maps.LatLng(37.55368689494708, 126.98541456064552),
			            new kakao.maps.LatLng(37.54722934282707, 126.995229135048),
			            new kakao.maps.LatLng(37.549694559809545, 126.99832516302801),
			            new kakao.maps.LatLng(37.550159406110104, 127.00436818301327),
			            new kakao.maps.LatLng(37.54820235864802, 127.0061334023129),
			            new kakao.maps.LatLng(37.546169758665414, 127.00499711608721),
			            new kakao.maps.LatLng(37.54385947805103, 127.00727818360471),
			            new kakao.maps.LatLng(37.54413326436179, 127.00898460651953),
			            new kakao.maps.LatLng(37.539639030116945, 127.00959054834321),
			            new kakao.maps.LatLng(37.537681185520256, 127.01726163044557),
			            new kakao.maps.LatLng(37.53378887274516, 127.01719284893274),
			            new kakao.maps.LatLng(37.52290225898471, 127.00614038053493),
			            new kakao.maps.LatLng(37.51309192794448, 126.99070240960813),
			            new kakao.maps.LatLng(37.50654651085339, 126.98553683648308),
			            new kakao.maps.LatLng(37.50702053393398, 126.97524914998174),
			            new kakao.maps.LatLng(37.51751820477105, 126.94988506562748),
			            new kakao.maps.LatLng(37.52702918583156, 126.94987870367682),
			            new kakao.maps.LatLng(37.534519656862926, 126.94481851935942),
			            new kakao.maps.LatLng(37.537500243531994, 126.95335659960566),
			            new kakao.maps.LatLng(37.54231338779177, 126.95817394011969),
			            new kakao.maps.LatLng(37.54546318600178, 126.95790512689311),
			            new kakao.maps.LatLng(37.548791603525764, 126.96371984820232),
			            new kakao.maps.LatLng(37.55155543391863, 126.96233786542686),
			            new kakao.maps.LatLng(37.5541513366375, 126.9657135934734),
			            new kakao.maps.LatLng(37.55566236579088, 126.9691850696746),
			            new kakao.maps.LatLng(37.5548768201904, 126.96966524449994)
			        ]
			    }, {
			        name : '중구',
			        path : [
			            new kakao.maps.LatLng(37.544062989758594, 127.00854659142894),
			            new kakao.maps.LatLng(37.54385947805103, 127.00727818360471),
			            new kakao.maps.LatLng(37.546169758665414, 127.00499711608721),
			            new kakao.maps.LatLng(37.54820235864802, 127.0061334023129),
			            new kakao.maps.LatLng(37.550159406110104, 127.00436818301327),
			            new kakao.maps.LatLng(37.549694559809545, 126.99832516302801),
			            new kakao.maps.LatLng(37.54722934282707, 126.995229135048),
			            new kakao.maps.LatLng(37.55368689494708, 126.98541456064552),
			            new kakao.maps.LatLng(37.55320655210504, 126.97874667968763),
			            new kakao.maps.LatLng(37.55522076659584, 126.97654602427454),
			            new kakao.maps.LatLng(37.55308718044556, 126.97642899633566),
			            new kakao.maps.LatLng(37.55487749311664, 126.97240854546743),
			            new kakao.maps.LatLng(37.5548766923893, 126.9691718124876),
			            new kakao.maps.LatLng(37.55566236579088, 126.9691850696746),
			            new kakao.maps.LatLng(37.55155543391863, 126.96233786542686),
			            new kakao.maps.LatLng(37.55498984534305, 126.96173858545431),
			            new kakao.maps.LatLng(37.55695455613004, 126.96343068837372),
			            new kakao.maps.LatLng(37.5590262922649, 126.9616731414449),
			            new kakao.maps.LatLng(37.56197662569172, 126.96946316364357),
			            new kakao.maps.LatLng(37.56582132960869, 126.96669525397355),
			            new kakao.maps.LatLng(37.56824746386509, 126.96909838710842),
			            new kakao.maps.LatLng(37.569485309984174, 126.97637402412326),
			            new kakao.maps.LatLng(37.56810323716611, 126.98905202099309),
			            new kakao.maps.LatLng(37.56961739576364, 127.00225936812329),
			            new kakao.maps.LatLng(37.56966688588187, 127.0152677241078),
			            new kakao.maps.LatLng(37.572022763755164, 127.0223363152772),
			            new kakao.maps.LatLng(37.57190723475508, 127.02337770475695),
			            new kakao.maps.LatLng(37.56973041414113, 127.0234585247501),
			            new kakao.maps.LatLng(37.565200182350495, 127.02358387477513),
			            new kakao.maps.LatLng(37.56505173515675, 127.02678930885806),
			            new kakao.maps.LatLng(37.563390358462826, 127.02652159646888),
			            new kakao.maps.LatLng(37.5607276739534, 127.02339232029838),
			            new kakao.maps.LatLng(37.55779412537163, 127.0228934248264),
			            new kakao.maps.LatLng(37.556850715898484, 127.01807638779917),
			            new kakao.maps.LatLng(37.55264513061776, 127.01620129137214),
			            new kakao.maps.LatLng(37.547466935106435, 127.00931996404753),
			            new kakao.maps.LatLng(37.54502351209897, 127.00815187343248),
			            new kakao.maps.LatLng(37.544062989758594, 127.00854659142894)
			        ]
			    }, {
			        name : '종로구',
			        path : [
			            new kakao.maps.LatLng(37.631840777111364, 126.9749313865046),
			            new kakao.maps.LatLng(37.632194205253654, 126.97609588529602),
			            new kakao.maps.LatLng(37.629026103322374, 126.97496405167149),
			            new kakao.maps.LatLng(37.6285585388996, 126.97992605309885),
			            new kakao.maps.LatLng(37.626378096236195, 126.97960492198952),
			            new kakao.maps.LatLng(37.6211493968146, 126.98365245774505),
			            new kakao.maps.LatLng(37.6177725051378, 126.9837302191854),
			            new kakao.maps.LatLng(37.613985109550605, 126.98658977758268),
			            new kakao.maps.LatLng(37.611364924201304, 126.98565700183143),
			            new kakao.maps.LatLng(37.60401657024552, 126.98665951539246),
			            new kakao.maps.LatLng(37.60099164566844, 126.97852019816328),
			            new kakao.maps.LatLng(37.59790270809407, 126.97672287261275),
			            new kakao.maps.LatLng(37.59447673441787, 126.98544283754865),
			            new kakao.maps.LatLng(37.59126960661375, 126.98919808879788),
			            new kakao.maps.LatLng(37.592300831997434, 127.0009511248032),
			            new kakao.maps.LatLng(37.58922302426079, 127.00228260552726),
			            new kakao.maps.LatLng(37.586091007146834, 127.00667090686603),
			            new kakao.maps.LatLng(37.58235007703611, 127.00677925856456),
			            new kakao.maps.LatLng(37.58047228501006, 127.00863575242668),
			            new kakao.maps.LatLng(37.58025588757531, 127.01058748333907),
			            new kakao.maps.LatLng(37.582338528091164, 127.01483104096094),
			            new kakao.maps.LatLng(37.581693162424465, 127.01673289259993),
			            new kakao.maps.LatLng(37.57758802896556, 127.01812215416163),
			            new kakao.maps.LatLng(37.5788668917658, 127.02140099081309),
			            new kakao.maps.LatLng(37.578034045208426, 127.02313962015988),
			            new kakao.maps.LatLng(37.57190723475508, 127.02337770475695),
			            new kakao.maps.LatLng(37.56966688588187, 127.0152677241078),
			            new kakao.maps.LatLng(37.56961739576364, 127.00225936812329),
			            new kakao.maps.LatLng(37.5681357695346, 126.99014772014593),
			            new kakao.maps.LatLng(37.569315246023024, 126.9732046364419),
			            new kakao.maps.LatLng(37.56824746386509, 126.96909838710842),
			            new kakao.maps.LatLng(37.56582132960869, 126.96669525397355),
			            new kakao.maps.LatLng(37.57874076105342, 126.95354824618335),
			            new kakao.maps.LatLng(37.581020184166476, 126.95812059678624),
			            new kakao.maps.LatLng(37.59354736740056, 126.95750665936443),
			            new kakao.maps.LatLng(37.595061575856455, 126.9590412421402),
			            new kakao.maps.LatLng(37.59833350100327, 126.9576941779143),
			            new kakao.maps.LatLng(37.59875701675023, 126.95306020161668),
			            new kakao.maps.LatLng(37.602476031211225, 126.95237386792348),
			            new kakao.maps.LatLng(37.60507154496655, 126.95404376087069),
			            new kakao.maps.LatLng(37.60912809443569, 126.95032198271032),
			            new kakao.maps.LatLng(37.615539700280216, 126.95072546923387),
			            new kakao.maps.LatLng(37.62433621196653, 126.94900237336302),
			            new kakao.maps.LatLng(37.62642708817027, 126.95037844036497),
			            new kakao.maps.LatLng(37.629590994617104, 126.95881385457929),
			            new kakao.maps.LatLng(37.629794440379136, 126.96376660599225),
			            new kakao.maps.LatLng(37.632373740990175, 126.97302793692637),
			            new kakao.maps.LatLng(37.631840777111364, 126.9749313865046)
			        ]
			    }, {
			        name : '서대문구',
			        path : [
			            new kakao.maps.LatLng(37.59851932019209, 126.95347706883003),
			            new kakao.maps.LatLng(37.5992407011344, 126.95499403097206),
			            new kakao.maps.LatLng(37.59833350100327, 126.9576941779143),
			            new kakao.maps.LatLng(37.595061575856455, 126.9590412421402),
			            new kakao.maps.LatLng(37.59354736740056, 126.95750665936443),
			            new kakao.maps.LatLng(37.581020184166476, 126.95812059678624),
			            new kakao.maps.LatLng(37.57874076105342, 126.95354824618335),
			            new kakao.maps.LatLng(37.56197662569172, 126.96946316364357),
			            new kakao.maps.LatLng(37.5575156365052, 126.95991288916548),
			            new kakao.maps.LatLng(37.55654562007193, 126.9413708153468),
			            new kakao.maps.LatLng(37.555098093384, 126.93685861757348),
			            new kakao.maps.LatLng(37.55884751347576, 126.92659242918415),
			            new kakao.maps.LatLng(37.5633319104926, 126.92828128083327),
			            new kakao.maps.LatLng(37.56510367293256, 126.92601582346325),
			            new kakao.maps.LatLng(37.57082994377989, 126.9098094620638),
			            new kakao.maps.LatLng(37.57599550420081, 126.902091747923),
			            new kakao.maps.LatLng(37.587223103650295, 126.91284666446226),
			            new kakao.maps.LatLng(37.58541570520177, 126.91531241017965),
			            new kakao.maps.LatLng(37.585870567159255, 126.91638068573187),
			            new kakao.maps.LatLng(37.583095195853055, 126.9159399866114),
			            new kakao.maps.LatLng(37.583459593417196, 126.92175886498167),
			            new kakao.maps.LatLng(37.587104600730505, 126.92388813813815),
			            new kakao.maps.LatLng(37.588386594820484, 126.92800815682232),
			            new kakao.maps.LatLng(37.59157595859555, 126.92776504133688),
			            new kakao.maps.LatLng(37.59455434247408, 126.93027139545339),
			            new kakao.maps.LatLng(37.59869748704149, 126.94088480070904),
			            new kakao.maps.LatLng(37.60065830191363, 126.9414041615336),
			            new kakao.maps.LatLng(37.60305781086164, 126.93995273804141),
			            new kakao.maps.LatLng(37.610598531321436, 126.95037536795142),
			            new kakao.maps.LatLng(37.6083605525023, 126.95056259057313),
			            new kakao.maps.LatLng(37.60507154496655, 126.95404376087069),
			            new kakao.maps.LatLng(37.602476031211225, 126.95237386792348),
			            new kakao.maps.LatLng(37.59851932019209, 126.95347706883003)
			        ]
			    }, {
			        name : '동대문구',
			        path : [
			            new kakao.maps.LatLng(37.607062869017085, 127.07111288773496),
			            new kakao.maps.LatLng(37.60107201319839, 127.07287376670605),
			            new kakao.maps.LatLng(37.59724304056685, 127.06949105186925),
			            new kakao.maps.LatLng(37.58953367466315, 127.07030363208528),
			            new kakao.maps.LatLng(37.58651213184981, 127.07264218709383),
			            new kakao.maps.LatLng(37.5849555116177, 127.07216063016078),
			            new kakao.maps.LatLng(37.58026781100598, 127.07619547037923),
			            new kakao.maps.LatLng(37.571869232268774, 127.0782018408153),
			            new kakao.maps.LatLng(37.559961773835425, 127.07239004251258),
			            new kakao.maps.LatLng(37.56231553903832, 127.05876047165025),
			            new kakao.maps.LatLng(37.57038253579033, 127.04794980454399),
			            new kakao.maps.LatLng(37.572878529071055, 127.04263554582458),
			            new kakao.maps.LatLng(37.57302061077518, 127.0381755492195),
			            new kakao.maps.LatLng(37.56978273516453, 127.03099733100001),
			            new kakao.maps.LatLng(37.57190723475508, 127.02337770475695),
			            new kakao.maps.LatLng(37.57838361223621, 127.0232348231103),
			            new kakao.maps.LatLng(37.58268174514337, 127.02953994610249),
			            new kakao.maps.LatLng(37.58894739851823, 127.03553876830637),
			            new kakao.maps.LatLng(37.5911852565689, 127.03621919708065),
			            new kakao.maps.LatLng(37.59126734230753, 127.03875553445558),
			            new kakao.maps.LatLng(37.5956815721534, 127.04062845365279),
			            new kakao.maps.LatLng(37.5969637344377, 127.04302522879048),
			            new kakao.maps.LatLng(37.59617641777492, 127.04734129391157),
			            new kakao.maps.LatLng(37.60117358544485, 127.05101351973708),
			            new kakao.maps.LatLng(37.600149587503246, 127.05209540476308),
			            new kakao.maps.LatLng(37.60132672748398, 127.05508130598699),
			            new kakao.maps.LatLng(37.6010580545608, 127.05917142337097),
			            new kakao.maps.LatLng(37.605121767227374, 127.06219611364686),
			            new kakao.maps.LatLng(37.607062869017085, 127.07111288773496)
			        ]
			    }, {
			        name : '성북구',
			        path : [
			            new kakao.maps.LatLng(37.63654916557213, 126.98446028560235),
			            new kakao.maps.LatLng(37.631446839436855, 126.99372381657889),
			            new kakao.maps.LatLng(37.626192451322005, 126.99927047335905),
			            new kakao.maps.LatLng(37.62382095469671, 127.00488450145781),
			            new kakao.maps.LatLng(37.624026217174986, 127.00788862747375),
			            new kakao.maps.LatLng(37.6205124078061, 127.00724034082933),
			            new kakao.maps.LatLng(37.61679651952433, 127.01014412786792),
			            new kakao.maps.LatLng(37.61472018601129, 127.01451127202589),
			            new kakao.maps.LatLng(37.614629670135216, 127.01757841621624),
			            new kakao.maps.LatLng(37.61137091590441, 127.02219857751122),
			            new kakao.maps.LatLng(37.612692696824915, 127.02642583551054),
			            new kakao.maps.LatLng(37.612367438936786, 127.03018593770908),
			            new kakao.maps.LatLng(37.60896889076571, 127.0302525167858),
			            new kakao.maps.LatLng(37.61279787695882, 127.03730791358603),
			            new kakao.maps.LatLng(37.62426467261789, 127.04973339977498),
			            new kakao.maps.LatLng(37.61449950127667, 127.06174181124696),
			            new kakao.maps.LatLng(37.61561580859776, 127.06985247014711),
			            new kakao.maps.LatLng(37.61351359068103, 127.07170798866412),
			            new kakao.maps.LatLng(37.60762512162974, 127.07105453180604),
			            new kakao.maps.LatLng(37.605121767227374, 127.06219611364686),
			            new kakao.maps.LatLng(37.6010580545608, 127.05917142337097),
			            new kakao.maps.LatLng(37.60132672748398, 127.05508130598699),
			            new kakao.maps.LatLng(37.600149587503246, 127.05209540476308),
			            new kakao.maps.LatLng(37.60117358544485, 127.05101351973708),
			            new kakao.maps.LatLng(37.59617641777492, 127.04734129391157),
			            new kakao.maps.LatLng(37.59644879095525, 127.04184728392097),
			            new kakao.maps.LatLng(37.59126734230753, 127.03875553445558),
			            new kakao.maps.LatLng(37.5911852565689, 127.03621919708065),
			            new kakao.maps.LatLng(37.58894739851823, 127.03553876830637),
			            new kakao.maps.LatLng(37.58268174514337, 127.02953994610249),
			            new kakao.maps.LatLng(37.57782865303167, 127.02296295333255),
			            new kakao.maps.LatLng(37.57889204835333, 127.02179043639809),
			            new kakao.maps.LatLng(37.57758802896556, 127.01812215416163),
			            new kakao.maps.LatLng(37.581693162424465, 127.01673289259993),
			            new kakao.maps.LatLng(37.582338528091164, 127.01483104096094),
			            new kakao.maps.LatLng(37.58025588757531, 127.01058748333907),
			            new kakao.maps.LatLng(37.58047228501006, 127.00863575242668),
			            new kakao.maps.LatLng(37.58235007703611, 127.00677925856456),
			            new kakao.maps.LatLng(37.586091007146834, 127.00667090686603),
			            new kakao.maps.LatLng(37.58922302426079, 127.00228260552726),
			            new kakao.maps.LatLng(37.592300831997434, 127.0009511248032),
			            new kakao.maps.LatLng(37.59126960661375, 126.98919808879788),
			            new kakao.maps.LatLng(37.59447673441787, 126.98544283754865),
			            new kakao.maps.LatLng(37.59790270809407, 126.97672287261275),
			            new kakao.maps.LatLng(37.60099164566844, 126.97852019816328),
			            new kakao.maps.LatLng(37.60451393107786, 126.98678626394351),
			            new kakao.maps.LatLng(37.611364924201304, 126.98565700183143),
			            new kakao.maps.LatLng(37.613985109550605, 126.98658977758268),
			            new kakao.maps.LatLng(37.6177725051378, 126.9837302191854),
			            new kakao.maps.LatLng(37.6211493968146, 126.98365245774505),
			            new kakao.maps.LatLng(37.626378096236195, 126.97960492198952),
			            new kakao.maps.LatLng(37.6285585388996, 126.97992605309885),
			            new kakao.maps.LatLng(37.62980449548538, 126.97468284124939),
			            new kakao.maps.LatLng(37.633657663246694, 126.97740053878216),
			            new kakao.maps.LatLng(37.63476479485093, 126.98154674721893),
			            new kakao.maps.LatLng(37.63780700422825, 126.9849494717052),
			            new kakao.maps.LatLng(37.63654916557213, 126.98446028560235)
			        ]
			    }, {
			        name : '성동구',
			        path : [
			            new kakao.maps.LatLng(37.57275246810175, 127.04241813085706),
			            new kakao.maps.LatLng(37.57038253579033, 127.04794980454399),
			            new kakao.maps.LatLng(37.56231553903832, 127.05876047165025),
			            new kakao.maps.LatLng(37.5594131360664, 127.07373408220053),
			            new kakao.maps.LatLng(37.52832388381049, 127.05621773388143),
			            new kakao.maps.LatLng(37.53423885672233, 127.04604398310076),
			            new kakao.maps.LatLng(37.53582328355087, 127.03979942567628),
			            new kakao.maps.LatLng(37.53581367627865, 127.0211714455564),
			            new kakao.maps.LatLng(37.53378887274516, 127.01719284893274),
			            new kakao.maps.LatLng(37.537681185520256, 127.01726163044557),
			            new kakao.maps.LatLng(37.53938672166098, 127.00993448922989),
			            new kakao.maps.LatLng(37.54157804358092, 127.00879872996808),
			            new kakao.maps.LatLng(37.54502351209897, 127.00815187343248),
			            new kakao.maps.LatLng(37.547466935106435, 127.00931996404753),
			            new kakao.maps.LatLng(37.55264513061776, 127.01620129137214),
			            new kakao.maps.LatLng(37.556850715898484, 127.01807638779917),
			            new kakao.maps.LatLng(37.55779412537163, 127.0228934248264),
			            new kakao.maps.LatLng(37.5607276739534, 127.02339232029838),
			            new kakao.maps.LatLng(37.563390358462826, 127.02652159646888),
			            new kakao.maps.LatLng(37.56505173515675, 127.02678930885806),
			            new kakao.maps.LatLng(37.565200182350495, 127.02358387477513),
			            new kakao.maps.LatLng(37.57190723475508, 127.02337770475695),
			            new kakao.maps.LatLng(37.56978273516453, 127.03099733100001),
			            new kakao.maps.LatLng(37.57302061077518, 127.0381755492195),
			            new kakao.maps.LatLng(37.57275246810175, 127.04241813085706)
			        ]
			    }, {
			        name : '마포구',
			        path : [
			            new kakao.maps.LatLng(37.584651324803644, 126.88883849288884),
			            new kakao.maps.LatLng(37.57082994377989, 126.9098094620638),
			            new kakao.maps.LatLng(37.56510367293256, 126.92601582346325),
			            new kakao.maps.LatLng(37.5633319104926, 126.92828128083327),
			            new kakao.maps.LatLng(37.55884751347576, 126.92659242918415),
			            new kakao.maps.LatLng(37.55675317809392, 126.93190919632814),
			            new kakao.maps.LatLng(37.555098093384, 126.93685861757348),
			            new kakao.maps.LatLng(37.55654562007193, 126.9413708153468),
			            new kakao.maps.LatLng(37.557241466445234, 126.95913438471307),
			            new kakao.maps.LatLng(37.55908394430372, 126.96163689468189),
			            new kakao.maps.LatLng(37.55820141918588, 126.96305432966605),
			            new kakao.maps.LatLng(37.554784413504734, 126.9617251098019),
			            new kakao.maps.LatLng(37.548791603525764, 126.96371984820232),
			            new kakao.maps.LatLng(37.54546318600178, 126.95790512689311),
			            new kakao.maps.LatLng(37.54231338779177, 126.95817394011969),
			            new kakao.maps.LatLng(37.539468942052544, 126.955731506394),
			            new kakao.maps.LatLng(37.536292068277106, 126.95128907260018),
			            new kakao.maps.LatLng(37.53569162926515, 126.94627494388307),
			            new kakao.maps.LatLng(37.53377712226906, 126.94458373402794),
			            new kakao.maps.LatLng(37.54135238063506, 126.93031191951576),
			            new kakao.maps.LatLng(37.539036674424615, 126.9271006565075),
			            new kakao.maps.LatLng(37.54143034750605, 126.9224138272872),
			            new kakao.maps.LatLng(37.54141748538761, 126.90483000187002),
			            new kakao.maps.LatLng(37.548015078285694, 126.89890097452322),
			            new kakao.maps.LatLng(37.56300401736817, 126.86623824787709),
			            new kakao.maps.LatLng(37.57178997971358, 126.85363039091744),
			            new kakao.maps.LatLng(37.57379738998644, 126.85362646212587),
			            new kakao.maps.LatLng(37.57747251471329, 126.864939928088),
			            new kakao.maps.LatLng(37.5781913017327, 126.87625939970273),
			            new kakao.maps.LatLng(37.57977132158497, 126.87767870371688),
			            new kakao.maps.LatLng(37.584440882833654, 126.87653889183002),
			            new kakao.maps.LatLng(37.59079311146897, 126.88205386700724),
			            new kakao.maps.LatLng(37.584651324803644, 126.88883849288884)
			        ]
			    }
			];
	
		    customOverlay = new kakao.maps.CustomOverlay({}),
		    infowindow = new kakao.maps.InfoWindow({removable: true});
	
			// 지도에 영역데이터를 폴리곤으로 표시합니다 
			for (var i = 0, len = areas.length; i < len; i++) {
			    displayArea(areas[i]);
			}
	
			// 다각형을 생상하고 이벤트를 등록하는 함수입니다
			function displayArea(area) {
		
			    // 다각형을 생성합니다 
			    var polygon = new kakao.maps.Polygon({
			        map: map, // 다각형을 표시할 지도 객체
			        path: area.path,
			        strokeWeight: 2,
			        strokeColor: '#004c80',
			        strokeOpacity: 0.5,
			        fillColor: '#fff', // 처음색
			        fillOpacity: 0.3 
			    });
		
			    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
			    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
			    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
			        polygon.setOptions({fillColor: '#09f'});
		
			        customOverlay.setContent('<div class="area">' + area.name + '</div>');
			        
			        customOverlay.setPosition(mouseEvent.latLng); 
			        customOverlay.setMap(map);
			    });
		
			    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
			    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
			        
			        customOverlay.setPosition(mouseEvent.latLng); 
			    });
		
			    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
			    // 커스텀 오버레이를 지도에서 제거합니다 
			    kakao.maps.event.addListener(polygon, 'mouseout', function() {
			        polygon.setOptions({fillColor: '#fff'});
			        customOverlay.setMap(null);
			    }); 
		
			    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
			    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
			    	map = new kakao.maps.Map(mapContainer, mapOption);
			    	var areaName = area.name;
			    	console.log(areaName);
			    	
			    	
			    	if(areaName == "용산구"){
			    		  // 이동할 위도 경도 위치를 생성합니다 
			    	    var moveLatLon = new kakao.maps.LatLng(37.5305195, 126.9634576);
			    	    
			    	    // 지도 중심을 이동 시킵니다
			    	    map.setCenter(moveLatLon);
			    	    map.setLevel(7);
			    	}
			    	else if(areaName == "중구"){
			  		  // 이동할 위도 경도 위치를 생성합니다 
				  	    var moveLatLon = new kakao.maps.LatLng(37.5595785, 126.9854963);
				  	    
				  	    // 지도 중심을 이동 시킵니다
				  	    map.setCenter(moveLatLon);
				  	 	map.setLevel(6);
				  	}
			    	else if(areaName == "종로구"){
			    		  // 이동할 위도 경도 위치를 생성합니다 
			  	  	    var moveLatLon = new kakao.maps.LatLng(37.5977094, 126.9591195);
			  	  	    
			  	  	    // 지도 중심을 이동 시킵니다
			  	  	    map.setCenter(moveLatLon);
			  	  	}
			    	else if(areaName == "서대문구"){
			    		  // 이동할 위도 경도 위치를 생성합니다 
			  	  	    var moveLatLon = new kakao.maps.LatLng(37.572427, 126.9226995);
			  	  	    
			  	  	    // 지도 중심을 이동 시킵니다
			  	  	    map.setCenter(moveLatLon);
			  	  	}
			    	else if(areaName == "동대문구"){
			    		  // 이동할 위도 경도 위치를 생성합니다 
			  	  	    var moveLatLon = new kakao.maps.LatLng(37.5827239, 127.0439008);
			  	  	    
			  	  	    // 지도 중심을 이동 시킵니다
			  	  	    map.setCenter(moveLatLon);
			  	  	}
			    	else if(areaName == "성북구"){
			    		  // 이동할 위도 경도 위치를 생성합니다 
			  	  	    var moveLatLon = new kakao.maps.LatLng(37.6011721, 127.0146358);
			  	  	    
			  	  	    // 지도 중심을 이동 시킵니다
			  	  	    map.setCenter(moveLatLon);
			  	  	}
			    	else if(areaName == "성동구"){
			    		  // 이동할 위도 경도 위치를 생성합니다 
			  	  	    var moveLatLon = new kakao.maps.LatLng(37.5508755, 127.0233856);
			  	  	    
			  	  	    // 지도 중심을 이동 시킵니다
			  	  	    map.setCenter(moveLatLon);
			  	  	}
			    	else if(areaName == "마포구"){
			    		  // 이동할 위도 경도 위치를 생성합니다 
			  	  	    var moveLatLon = new kakao.maps.LatLng(37.5615911, 126.8736237);
			  	  	    
			  	  	    // 지도 중심을 이동 시킵니다
			  	  	    map.setCenter(moveLatLon);
			  	  	}
			    	city='서울';
			    	county = areaName;
			    	
			    	MapLocations();
			    	clickKinds();

			    });
			}
			
	    	
	
		}
		
	
		function selectDisplay(){
			$(".cityOption").val('none');
			if($("#displayCheck").val() == 0){
				document.getElementById("citys").style.display = "block";
				$("#displayCheck").val(1);
			}
			if($("#addressDisplay").val() == 1){
				document.getElementById("hAddr").style.display = "none";
				$("#addressDisplay").val(0);
			}
		}
		
		function cityClick(){
			map = new kakao.maps.Map(mapContainer, mapOption);
			if($(".cityOption").val() != 'none'){
				city = $(".cityOption").val();
				if(city == '서울'){
					var moveLatLon = new kakao.maps.LatLng(37.5662952, 126.9757564);
				  	 // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
				}
				else if(city == '구미시'){
					var moveLatLon = new kakao.maps.LatLng(36.119624, 128.3421063);
				  	 // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
				}
				else if(city == '대구광역시'){
					var moveLatLon = new kakao.maps.LatLng(35.8819559, 128.5923414);
				  	 // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
				}
				else if(city == '인천시'){
					var moveLatLon = new kakao.maps.LatLng(37.4512346, 126.6997609);
				  	 // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
				}
				else if(city == '부산시'){
					var moveLatLon = new kakao.maps.LatLng(35.1795552, 129.0741443);
				  	 // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
				}
				else if(city == '경주시'){
					var moveLatLon = new kakao.maps.LatLng(35.8561716, 129.2226143);
				  	 // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
				}
				else if(city == '구리시'){
					var moveLatLon = new kakao.maps.LatLng(37.5942844, 127.1275537);
				  	 // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
				}
				else if(city == '부천시'){
					var moveLatLon = new kakao.maps.LatLng(37.5032783, 126.7640723);
				  	 // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
				}
			} 
			county = null;
			MapLocations();
			clickKinds();
		}		
		
		
		
		function MapLocations(){
			//createMarkers();
			console.log('city'+city+'county'+county+'kinds'+kinds+'beforekinds'+beforekinds+'beforeCity'+beforeCity);
			if(city != 'none' && city != 'null' && kinds != 'null'){
				if(kinds == beforekinds && city != beforeCity){
					location.href='markerCountList.doa?city='+city+'&kinds='+kinds+'&beforekinds='+beforekinds+'&county='+county;
				}
				else if(kinds != beforekinds){
					location.href='markerCountList.doa?city='+city+'&kinds='+kinds+'&beforekinds='+beforekinds+'&county='+county;
				}
				
			}
		}

		
		
		function clickKinds(){
			console.log('city'+city+'county'+county+'kinds'+kinds+'beforekinds'+beforekinds+'beforeCity'+beforeCity);
			if(city != 'null' || kinds !='null' || county != 'null'){// && beforekinds != 'null' && beforeCity != 'null'
				
				$.ajax({
					url : "markerList.doa",
					type : "get",
					data : {"city": city, "county": county, "kinds": kinds, "beforekinds": beforekinds},
					dataType : "json",
					success : function(data){
						$tableBody = $("#facilityTable tbody");
		    			$tableBody.html("");
		    			
		    			var $tr;
		    			var $facilityName;
		    			var $facilityField;
		    			console.log(data.length)
		    			if(data.length > 0){
		    				for(var i in data) {
								$tr = $("<tr>");
								$td = $("<td  height='40px;'>");
								$facilityName = $("<a href='facilityDetail.doa?facilityNo=" + data[i].facilityNo+"'>").text(decodeURIComponent(data[i].facilityName).replace(/\+/g, " "));
								$facilityField = $("<td>").text(decodeURIComponent(data[i].facilityField).replace(/\+/g, " "));  //디코딩 // 모든 영역의 + 는 띄어쓰기로 변경
								$facilityAddr = $("<td>").text(decodeURIComponent(data[i].facilityAddr).replace(/\+/g, " ")); 
								$td.append($facilityName);
								$tr.append($td);
								$tr.append($facilityAddr);
								$tr.append($facilityField);
								$tableBody.append($tr);
							}
		    			}
		    			else{
		    				$tr = $("<tr>"); // tr태그 객체회, /tr도 자동 생성
							$facilityName = $("<td colspan='2'>").text("등록된 시설이 없습니다."); // td라는 태그에는 "등록된 댓글이 없습니다."라는 글이 들어가고 자동으로 닫힘
							$tr.append($facilityName); // append를 이용해서 tr태그 안에 rContent를 넣어준다.
							$tableBody.append($tr);
		    			}
		    		}

				});
				
			//마커 위치 가져오기
				$.ajax({
					url : "markerPoints.doa",
					data : {"city": city, "county": county, "kinds": kinds, "beforekinds": beforekinds},
					success : function(result){
						console.log(result);
						/* for(var i = 0; i < result.length; i++){
							Positions.push(result[i]);
						} */
					}
					
				});
				
			//content값 가져오기
				$.ajax({
					url : "contentList.doa",
					data : {"city": city, "county": county, "kinds": kinds, "beforekinds": beforekinds},
					success : function(result){
						console.log(result);
					}
				});

			}
		}
		
		
	</script>
	
</body>
</html>