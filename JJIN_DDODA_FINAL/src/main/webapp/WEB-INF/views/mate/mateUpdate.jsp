<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메이트모집글 수정하기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=310fc683ebc82542a03a51f91a654846&libraries=services,clusterer,drawing"></script>
<style>
.textarea{resize:none;}
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
	border : 1px solid lightgray;
}
textarea {
	width : 100%;
	border : 1px solid lightgray;
	resize : none;
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
	<div class="content" style="margin-left:5%;margin-right:5%;">
	<div class="main-name">
		<h2 class="main-name-h2">메이트 모집글 수정</h2>
	</div>
	<div class="table-wrap">
	<form name="fr" action="mateUpdate.doa" method="post"  onsubmit="return submitCheck();">
		<table align="center" id="tb" class="table">
			<input type="hidden" name="mateNo" value="${mate.mateNo }">
			<input type="hidden" name="page" value="${currentPage }">
			<input type="hidden" name="userId" value="${mate.userId }" >
			<tr>
				<td>제목</td>
				<td><input type="text" name="mateTitle" value="${mate.mateTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userId" value="${mate.userId }" readonly></td>
			</tr>	
			<tr>
				<td>장소</td>
				<td>
					<c:url var="matePlace" value="${mate.matePlace }"></c:url>
					<c:url var="detailAddr" value="${mate.detailAddr }"></c:url>
					<c:url var="roadAddr" value="${mate.roadAddr }"></c:url>
					<c:url var="sido" value="${mate.sido }"></c:url>
					<c:url var="latLong" value="${mate.latLong }"></c:url>
					<div style="float:left;width: 70%;">
					<input type="text" id="matePlace" name="matePlace" placeholder="장소를 검색해주세요" value="${matePlace }" readonly style="width:80%;">  <!-- 검색한 단어 -->
					<input type="text" id="detailAddr" name="detailAddr" value="${detailAddr }"  placeholder="추가사항이 있다면 적어주세요"style="width:80%;">
					</div>
					<button type="button" onclick="searchPlace()" class="btn btn-primary">장소검색</button>
					<input type="hidden" id="roadAddr" name="roadAddr" value="${roadAddr }"> <!-- 도로명주소 -->
					<input type="hidden" id="sido" name="sido" value="${sido}"> <!-- 도/시 이름 ex.경기 -->
					<input type="hidden" id="latLong" name="latLong" value="${latLong}"> <!-- 위도 경도 -->
					<div id="map" style="width:100%;height:300px;margin-top:10px;display:none;">
					</div>
					
				</td>
			</tr>	
			<tr>
				<td>희망 모집인원</td>
				<td>
					<select id="mateRequireNo" name="mateRequireNo">
						<option value="1|3" <c:if test="${mate.mateRequireNo == '1|3'}">selected</c:if> >1~3명</option>
						<option value="3|5" <c:if test="${mate.mateRequireNo == '3|5'}">selected</c:if>  >3~5명</option>
						<option value="5|7" <c:if test="${mate.mateRequireNo == '5|7'}">selected</c:if>  >5~7명</option>
						<option value="7|9" <c:if test="${mate.mateRequireNo == '7|9'}">selected</c:if>  >7~9명</option>
					</select>
				</td>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="mateContents">${mate.mateContents }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기"class="btn btn-primary">
					<button type="button" onclick="mateList.doa?category="+${mate.category } >목록으로</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	<div id="map" style="width:500px;height:300px;"></div>
	
	<script>
	//---------------지도부분 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	
    mapOption = {
        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };
	
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
	    map: map
	});
	
	var search;
	var detailAddr;
	var matePlace = '${matePlace}'; //검색단어
	var postcode = '${postcode}'; //우편번
	var roadAddr = '${roadAddr}'; //도로명주
	var sido = '${sido}'; //도/시
	var latLong = '${latLong}'; //위도경도 
	var latlng;
	function searchPlace() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	search = data.query;
	            var addr = data.address; // 최종 주소 변수
	         	
	            // 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("matePlace").value = search;
	            postcode = data.zonecode;
	            roadAddr = data.address ;
	            sido = data.sido;
	            $("#postcode").val(postcode);
	            $("#roadAddr").val(roadAddr);
	            $("#sido").val(sido);
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
	                    marker.setPosition(coords);
	                    latlng = result.y +"_"+result.x;
	                   console.log(result.y);
	                   console.log(result.x);
	                    $("#latLong").val(latlng);
	                }
	            });
	    		console.log(latlng); 
	        }
	    }).open();
	}

	// 마커를 지도에 표시합니다.
	marker.setMap(map);
	

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    zindex:1
	}); 
	
	function searchDetailAddrFromCoords(marker, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(marker.getPosition().getLng(), marker.getPosition().getLat(), callback);
	}
	
	// 마커에 마우스오버 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseover', function() {
		searchDetailAddrFromCoords(marker, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            detailAddr = !!search ? '<div><b>장소 : ' + search + '</b></div>' : '';
	            detailAddr += '<div> ' + result[0].address.address_name + '</div>'; 
	            
	            var content = '<div class="bAddr" style="height:50px;font-size:small;">' + detailAddr + '</div>';

	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(marker.getPosition());
	            marker.setMap(map);

	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	    });
	});
	// 마커에 마우스아웃 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseout', function() {
	    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	    infowindow.close();
	});
	
	//--------- 검사 
	$(document).ready(function() {
		$('form[name="fr"]').bind('submit', function() {
			var askUpdate = confirm("이대로 수정하시겠습니까?");
			if(askUpdate) {
				return true;
			} else {
				return false;
			}
		})
	})
	</script>
	<!-- end content -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>