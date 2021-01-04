<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드</title>
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
			<h2 class="main-name-h2">제목 : ${nList.sNoticeTitle }</h2>
		</div>
		<div>
				<c:url var="noticeList" value="noticeRequireList.doa">
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<c:url var="nUpdate" value="noticeUpdateView.doa">
					<c:param name="noticeNo" value="${notice.noticeNo }"/>
					<c:param name="menuName" value="${notice.menuName }"/>
				</c:url>
				<c:url var="nDelete" value="noticeDelete.doa">
					<c:param name="noticeNo" value="${notice.noticeNo }"/>
					<c:param name="menuName" value="${notice.menuName }"/>
				</c:url>
					<div style="text-align: right; width: 100%;">
						<button type="button" class="btn btn-primary"  onClick="location.href='${nDelete }'">삭제하기</button>
						<a href="${noticeList }" class="btn btn-primary">목록으로</a>
					</div>
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
					
				<tr>
					<td width="70">작성자</td>
					<td>${nList.userId }</td>
				</tr>
				<tr>
					<td>작성 날짜</td>
					<td>${nList.sNoticeDate }</td>
				</tr>
				<tr>
					<td height="50">내용</td>
					<td>${nList.sNoticeContents }</td>
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
					$userId = $("<td width='80' height='10'>").text("참여한 메이트가 없습니다.");
					
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
	
	//--------댓글등록
	$(function() {
		mateComList();
		/* setInterval(function() {
			console.log("동작중");
		}, 5000); */
		
		$("#mateSubmit").on("click", function() {
			var mateComContents = $("#mateComContents").val();
			var mateNo = ${mateOne.mateNo};
			var ask = confirm("댓글을 등록하시겠습니까?");
			if (ask){
			$.ajax({
				url : "addMateComments.doa",
				type : "post",
				data : { "mateComContents" : mateComContents, "mateNo" : mateNo },
				success : function(data) {
					if(data == "success") {
						mateComList();
						$("#mateComContents").val("");
					}else {
						alert("댓글 등록에 실패했습니다.");
					}
				}
			});
			}
		});
	});
	//---------댓글 리스트
	function mateComList() {
		var mateNo = ${mateOne.mateNo};
		var mateCommentNo;
		
		$.ajax({
			url : "mateComList.doa",
			type : "get",
			data : {"mateNo" : mateNo},
			dataType : "json",
			success : function(data) {
				$tableBody = $("#mateComTb tbody");
				$tableBody.html("");
				
				var $tr;
				var $userId;
				var $mateComContents;
				var $mateComDate;
				var $modifyCom;
				var $mateComReply;
				var $btn;
				var $td;
				$("#mateComCount").text("댓글 목록");
				if(data.mateComList.length >0) {
					for(var i in data.mateComList) {
						mateCommentNo = data.mateComList[i].mateComNo;
						var mateComId = data.mateComList[i].userId;
						
						$tr = $("<tr style='font-weight:bolder;'>");
						$userId = $("<td  style='margin-left:20px;margin-top:7px;padding-right:15px;border-right:1px solid black;'>").text(data.mateComList[i].userId);
						$mateComDate = $("<td width='100' style='margin-top:7px;'>").text(data.mateComList[i].mateComDate);
						$mateComContents = $("<td  width='100%' height='25' style='text-align:left;padding-left:20px;margin-top:10px;'>").text(decodeURIComponent(data.mateComList[i].mateComContents).replace(/\+/g, " "));
						if(sessionId == "") {
							$tr.append($userId);
							$tr.append($mateComDate);
							$tr.append($mateComContents);
						} else if(sessionId != "" && sessionId == mateComId) {
							$btn = $("<td class='btndelete'>").append("<button type='button' style='width:40px;' onclick='mateComDelete("+ data.mateComList[i].mateComNo +")'>삭제</button>");
							$tr.append($userId);
							$tr.append($mateComDate);
							$tr.append($mateComContents);
							$tr.append($btn);
							
							if(sessionId != ""){
								$modifyCom = $("<td class='addReply'>")
								.append("<button type='button' id='mateComReply' style='width:40px;' onclick='mateComReplyView(this," +data.mateComList[i].mateComNo+ ")'>답글</button>");
								
								$tr.append($modifyCom);
								
							} 
						}  
						$tableBody.append($tr);
						
						$.ajax({
							url : "mateComReplyList.doa",
							async: false,
							type : "get",
							data : {"mateNo":mateNo, "mateComRefNo" : mateCommentNo },
							dataType : "json",
							success: function(element) {
								console.log("1element" + element + mateNo +mateCommentNo );
								$replyBody = $("#mateComReplyTb");
								$replyBody.html("");
								
								var $trr;
								/* var $position; */
								var $replyUserId;
								var $replyContents;
								var $replyDate;
								var $replyDelete;
								if(element.length >0) {
									for(var j in element) {
										var mateComReplyId = element[j].userId;
										
										$trr = $("<tr colspan='4'>");
										$replyUserId = $("<td >").text("-->  " + decodeURIComponent(element[j].userId));
										/* $position = $("<td width='100' colspan='2'>").text("->"); */
										if(sessionId == mateComReplyId) {
											$replyContents = $("<td width='100'>").text(decodeURIComponent(element[j].mateComContents));
											$replyDate = $("<td>").text(element[j].mateComDate);
											
											$trr.append($replyUserId);
											$trr.append($replyContents);
											$trr.append($replyDate);
											$replyDelete = $("<td colspan='2'>")
											.append("<button type='button' id='mateComReply'  style='width:40px;' onclick='mateComeReplyDelete("+element[j].mateComNo+")'>삭제</button>");
											$trr.append($replyDelete);
										} else {
											$replyContents = $("<td width='100' colspan='3'>").text(decodeURIComponent(element[j].mateComContents));
											$replyDate = $("<td>").text(element[j].mateComDate);
											$trr.append($replyUserId);
											$trr.append($replyContents);
											$trr.append($replyDate);
										}
										$tr.after($trr);
										
										console.log("2element"+element);
									}
								}
							}
						});
					}
				} else {
					$tr =$("<tr>");
					$mateComContents = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
					$tr.append($mateComContents);
					$tableBody.append($tr);
				}
			}
		})
	}
	//--------댓글 삭제 시 입력자가 아니면 삭제 못하게 하기
	function mateComDelete(mateComNo) {
		var ask = confirm("댓글을 정말로 삭제하시겠습니까? 삭제 시 해당 댓글의 대댓글들도 모두 삭제됩니다.");
		if(ask) {
		$.ajax({ 
			url : "deleteMateCom.doa",
			type : "get",
			data : { "mateComNo":mateComNo },
			success : function(data) {
				if(data == "success") {
					$.ajax({
						url:"deleteMateComReply.doa",
						type : "get",
						data : {"mateComNo" : mateComNo},
						success : function(element) {
							if(element == "success") {
								mateComList();
							}else {
								alert("대댓글 삭제에 실패했습니다.");
							}
						}
					});
					alert("댓글 삭제 및 대댓글 삭제에 성공했습니다.");
				}else {
					alert("댓글 삭제에 실패했습니다.");
				}
			}
		});
		} else {
			return false;
		}
	}
	//대댓글 삭제
	function mateComeReplyDelete(mateComNo) {
		var ask = confirm("대댓글을 삭제하시겠습니까?");
		if(ask) {
		$.ajax({
			url:"deleteMateComReply.doa",
			type : "get",
			data : {"mateComNo" : mateComNo},
			success : function(element) {
				if(element == "success") {
					mateComList();
				}else {
					alert("대댓글 삭제에 실패했습니다.");
				}
			}
		});
		} else {
			return false;
		}
	}
	
	var rCount = 1;
	//--------대댓글 입력
	function mateComReplyView(e, mateComNo) {
		$replyTableBody = $("#mateComReplyInsertTb");
		$replyTableBody.html("");
		if (rCount > 1) {
			return false;
		} else {
			rCount++;
			var replyTextArea = $(e).parent().parent();
			replyTextArea.after("<tr colspan='5'><td colspan='5'><div>"+mateComNo+ 
					"번 댓글에 답변달기</div><textarea rows='3' cols='165' id='mateComReplyCon' placeholder='내용을 입력해주세요'></textarea>" +
					"<button type='button' id='mateComReply' onclick='mateComReplyInsert("+mateComNo+")'>답글등록</button>"+
					"<button type='button' id='mateComReply' >취소</button></td></tr>");
			console.log("view : "+mateComNo);
			return false;
			$("#mateComReply").on("click", function(e) {
	               e.preventDefault();
	               removeReply($(this));
	        });
		}
	}
	function removeReply(obj) {
		obj.parent().parent().remove();
	}
	//--------대댓글 등록
	function mateComReplyInsert(mateComNo) {
		mateComList();
			var mateComReplyCon = $('#mateComReplyCon').val();
			var mateNo = $("#mateNo").val();
			var ask = confirm("대댓글 등록을 완료하시겠습니까?");
			if(ask) {
			if(mateComReplyCon != "") {
			$.ajax({
				url : "addMateComReply.doa",
				type : "post",
				data : { "mateComContents" : mateComReplyCon, "mateNo" : mateNo, "mateComRefNo" : mateComNo },
				success : function(data) {
					if(data == "success") {
						$("#mateComReplyCon").val("");
						/* $("#mateComReplyInsertTb").remove(); */
						mateComList();
						console.log("대댓글 성공");
					}else {
						alert("댓글 등록에 실패했습니다.");
					}
				}
			}); 
			} else {
				alert("답글 내용을 입력해주세요");
				return false;
			}
			} 
			return true;
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