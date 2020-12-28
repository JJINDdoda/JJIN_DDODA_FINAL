<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=310fc683ebc82542a03a51f91a654846&libraries=services,clusterer,drawing"></script>
<style>
	  .main-name-h2 {
	font-family: 'Wemakeprice-Regular';
	color: #424242;
	font-size : 1.7em;
}
.menub {
	margin-left:6%;
	width:150px;
	background-color:white;
	text-align:left;
	float:left;
	border : 1px solid #edd5c5;
	border-top : 1px solid #f7bf99;
	height : 550px;
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
	margin-left:3%;
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
.content {
		height : 1200px;
	}
@media ( max-width : 991px) {
		.menub {
			width:85%;
			height : 48px;
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
		.content{
			height: 700px;
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
	<input type="hidden" id="sessionId" value="${loginUser.userId }">
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
		<div class="main">
		<div class="main-name">
			<h2 class="main-name-h2">제목 : ${mateOne.mateTitle }</h2>
		</div>
		<div>
				<c:url var="mateList" value="mateList.doa">
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<c:url var="mateDelete" value="mateDelete.doa">
					<c:param name="mateNo" value="${mateOne.mateNo }"></c:param>
				</c:url>
				<c:url var="mateUpdateView" value="mateUpdateView.doa">
					<c:param name="mateNo" value="${mateOne.mateNo }"></c:param>
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
					<c:if test="${ loginUser.userId == mateOne.userId}">
						<button type="button" class="btn btn-primary" onclick="askUpdate()">수정하기</button>
						<button type="button" class="btn btn-primary" onclick="askDelete()">삭제하기</button>
					
						<c:if test="${mateOne.mateEnd == 'N'}">
						<input type="button" id="askFinish" name="askFinish" class="btn btn-primary"  value="모집 완료하기">
						</c:if>
						
					</c:if>
						<c:if test="${mateOne.mateEnd == 'Y'}">
						<c:if test="${ loginUser.userId == mateOne.userId}">
						<input type="button" id="askFinish" name="askFinish" class="btn btn-primary"  value="모집완료" disabled="disabled">
						</c:if>
						<c:if test="${ loginUser.userId == mateOne.userId}">
						<input type="button" id="openChat" name="openChat" class="btn btn-primary"  value="채팅방 오픈">
						</c:if>
						</c:if>
					<a href="${mateList }">목록으로</a>
					</div>
		<div class="table-wrap">
			<table align="center" cellpadding="10" cellspacing="0"width="500" class="table" id="mymate">
				<!-- 최대최소 모집 인원 -->
				<c:set var="requireNumber" value="${mateOne.mateRequireNo }"/>
				<c:set var="min" value="${ fn:substring(requireNumber,0,1) }"/>
				<c:set var="max" value="${ fn:substring(requireNumber,2,3) }"/>
				
				<c:set var="position" value="${mateOne.latLong}"/>
				<c:set var="llat" value="${ fn:substringBefore(position, '_')}" />
				<c:set var="llng" value="${ fn:substringAfter(position, '_')}" />
				
				<input type="hidden" id="loginUserId" value="${loginUser.userId }"> 
				<input type="hidden" id="mateUser" value="${mateOne.userId }"> 
				<input type="hidden" id="mateNo" value="${mateOne.mateNo }"> 
				<input type="hidden" id="search" value="${mateOne.matePlace }" >
				<input type="hidden" is="mateEnd" value="${mateOne.mateEnd }">
					
				<%-- <tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
					<td height="15" width="70">제목</td>
					<td>${mateOne.mateTitle }</td>
				</tr> --%>
				<tr>
					<td width="70">작성자</td>
					<td>${mateOne.userId }</td>
				</tr>
				<tr>
					<td>작성 날짜</td>
					<td>${mateOne.mateDate }</td>
				</tr>
				<tr>
					<td>모집 인원</td>
					<td>최소인원 : ${ min }, 최대인원 : ${max }</td>
				</tr>
				<c:if test="${ mateOne.detailAddr != null}">
					<tr>
						<td rowspan="3">모임 장소</td>
						<td>${mateOne.matePlace }</td>
					<tr>
						<td>${mateOne.detailAddr }</td>
					</tr>
				</c:if>
				<c:if test="${ mateOne.detailAddr == null}">
					<tr>
						<td rowspan="2">모임 장소</td>
						<td>${mateOne.matePlace }</td>
				</c:if>
				<tr>
					<td><div id="map" style="width:100%;height:200px;margin-top:10px;">
					</div></td>
				</tr>
				<tr>
					<td height="30">내용</td>
					<td>${mateOne.mateContents }</td>
				</tr>
				<tr>
				
				</tr>
			</table>
		</div>
		<hr>
		<c:if test="${ !empty sessionScope.loginUser }">
			<c:if test="${ loginUser.userId != mateOne.userId }">
				<div style="width:10%;float:left;">
					<input type="button" name="attendBtn" value="참여하기" class="btn btn-primary" >
				</div>
			</c:if>
		</c:if>
		<div style="width:90%;float:left;height:100px;">
		<c:if test="${ empty sessionScope.loginUser  }">
			
		</c:if>
			<table align="center" id="mymateTb" style="width:100%;margin-left:0px;margin-right:0px;margin-bottom:15px;">
				<thead>
					<tr><td style="text-align:left;"><b>[ 참여자 리스트 ]</b></td></tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br><hr>
		<div>
		
		</div>
	</div>
	</div>
		<!-- end content -->

	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<script>
	/* if(${sessionScope.loginUser eq null}) {
		var loginUserId = null;		
	} else {
		var loginUserId = ${loginUserId};
	} */
	var sessionId = $("#loginUserId").val();
	var mateId = $("#mateUser").val();
	
	//--------게시글 수정하기 
	function askUpdate() {
		var askUpdate = confirm("수정하시겠습니까?");
		if(askUpdate) {
			location.href='${mateUpdateView}';
		} else {
			return false;
		}
	}
	//--------게시글 삭제하기 
	function askDelete() {
		var askDelete = confirm("정말 삭제하시겠습니까?");
		if(askDelete) {
			location.href='${mateDelete}';
		} else {
			return false;
		}
	}
	//--------참여하기 
	function loginquest() {
		alert("로그인 후 이용해주세요");
		return false;
	}
	$(function() {
		myMateList();
		mateComList();
		/* setInterval(function() {
			myMateList();
		}, 5000); */
		
		$('input[name="attendBtn"]').on("click", function() {
			var really = confirm("정말로 참여하시겠습니까?");
			if(really) {
				var mateNo = ${mateOne.mateNo};
				$.ajax({
					url : "addMymate.doa",
					type : "post",
					async:false,
					data : {"mateNo" : mateNo},
					success : function(data) {
						if(data == "success") {
							alert("모임에 참여되셨습니다.");
							$('input[name="attendBtn"]').attr('disabled', true);
							$('input[name="attendBtn"]').attr('value', '참여 중');
							$('input[name="attendBtn"]').css('background-color', "gray");
							myMateList();
						}else {
							alert("모임 참여에 실패했습니다.");
						}
					}
				});
			} else {
				return false;
			}
		});
	});
	/* var id = ${mateOne.userId}; */
	//--------참여자 목록
	function myMateList() {
		var mateNo = ${mateOne.mateNo};
		var max = ${max };
		var min = ${min};
		
		$.ajax({
			url : "myMateList.doa",
			type : "get",
			data : {"mateNo" : mateNo},
			dataType : "json",
			success : function(data) {
				$tableBody = $("#mymateTb tbody");
				$tableBody.html("");
				$openchat = $("#mymate");
				
				var $tr;
				var $userId;
				var $openchatBtn;
				var mymateId = null;
				if(data.length > 0) {
					for(var i in data) {
						mymateId = data[i].userId;
						$tr = $("<tr  style='float:left;'>");
						$userId = $("<td width='80' height='10'>").text(decodeURIComponent(data[i].userId));
						$tr.append($userId);
						$tableBody.append($tr);
						
						if(sessionId == mymateId) {
							console.log("참여리스트세션아이디와 참여한 아이디가 같다");
							$('input[name="attendBtn"]').attr('value', '참여 중');
							$('input[name="attendBtn"]').attr('disabled', true);
						}
					}
				} else {
					$tr =$("<tr>");	
					$userId = $("<td width='80' height='10' style='text-align:left;'>").text("참여한 메이트가 없습니다.");
					
					$tr.append($userId); 
					$tableBody.append($tr);
				}
				if(data.length == max) {
					$('input[name="attendBtn"]').attr('disabled', true);
					$('input[name="attendBtn"]').attr('value', '인원 충족');
					$('input[name="attendBtn"]').css('background-color', "gray");
				}
				if(sessionId == mymateId) {
					$('input[name="attendBtn"]').attr('disabled', true);
					$('input[name="attendBtn"]').attr('value', '참여 중');
					$('input[name="attendBtn"]').css('background-color', "gray");
					console.log(sessionId);
				}
				
				/* if(data.length > min && ) */
				$("#askFinish").on("click", function(e) {
		               e.preventDefault();
		               askFinish(data);
		        });
			}
			
		});
	}
	//--------메이트 게시판 완료하기
	function askFinish(obj) {
		var mateNo = ${mateOne.mateNo};
		var max = ${max };
		var min = ${min};
		if(obj.length >= min) {
			var ask = confirm("메이트 모집을 완료하시겠습니까?");
			if(ask) {
				$.ajax({
					url : "askFinish.doa",
					type : "get",
					data : {"mateNo" : mateNo, "userId":mateId},
					success : function(data) {
						alert("메이트 모집이 완료되었습니다.");
						$('#askFinish').attr('value', '모집완료');
						$('#askFinish').attr('diasbled', true);
					}
				});
			} else {
				return false;
			}
		} else {
			alert("최소정원 이상의 참여자가 필요합니다.");
		}
	}
	
	
	//--------지도 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	
    mapOption = {
        center: new daum.maps.LatLng(${llat}, ${llng}), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };
	
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(${llat}, ${llng}),
	    map: map
	});
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
	var search = $("#search").val();
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
	</script>
	
</body>
</html>