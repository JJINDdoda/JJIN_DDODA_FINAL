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
	@media ( max-width : 991px) {
		.menub li {
		width: 25%;
		}
	}
	.table-wrap {height:450px;}
textarea {resize:none;}
</style>
</head>
<body>
<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->
	<input type="hidden" id="sessionId" value="${loginUser.userId }">
	<div class="content" style="height:800px;">
		<div class="menub">
			<ul>
				<li><a href="#">회원정보 수정</a></li>
				<li><a href="mateContentsList.doa?userId=${loginUser.userId }">내가 쓴글</a></li>
				<li><a href="myMateAttendList.doa?userId=${loginUser.userId }">마이 메이트</a></li>
				<li><a href="#">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="main">
			<div class="main-name">
				<h2 class="main-name-h2">내가 쓴글</h2>
			</div>
			<div class="table-wrap">
			<table align="center" cellpadding="10" cellspacing="0" border="1" width="500" class="table" id="mymate">
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
					
				<tr align="center" valign="middle"> <!-- valign : 수직 가운데 -->
					<td height="15" width="70">제목</td>
					<td>${mateOne.mateTitle }</td>
				</tr>
				<tr>
					<td>작성자</td>
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
				<c:url var="mateList" value="mateContentsList.doa">
					<c:param name="userId" value="${loginUser.userId }"></c:param>
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
						<button type="button" onclick="askUpdate()">수정하기</button>
						<button type="button" onclick="askDelete()">삭제하기</button>
					
						<c:if test="${mateOne.mateEnd == 'N'}">
						<input type="button" id="askFinish" name="askFinish" class="btn-primary" value="모집 완료하기">
						</c:if>
						
					</c:if>
						<c:if test="${mateOne.mateEnd == 'Y'}">
						<c:if test="${ loginUser.userId == mateOne.userId}">
						<input type="button" id="askFinish" name="askFinish" class="btn-primary" value="모집완료" disabled="disabled">
						</c:if>
						<c:if test="${ loginUser.userId == mateOne.userId}">
						<input type="button" id="openChat" name="openChat" class="btn-primary" value="채팅방 오픈">
						</c:if>
						</c:if>
					<a href="${mateList }">목록으로</a>
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
		<div style="width:90%;float:left;">
		<c:if test="${ empty sessionScope.loginUser  }">
			
		</c:if>
			<table align="center" id="mymateTb" style="width:100%;margin-left:0px;margin-right:0px;">
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
		<!-- 댓글 등록 -->
		<table align="center">
			<tr>
				<th>댓글 등록
				</th>
			</tr>
			<tr>
				<c:if test="${ !empty sessionScope.loginUser }">
				<td><textarea rows="3" cols="145" id="mateComContents" placeholder="댓글 내용을 입력해주세요" ></textarea></td>
				<td>
					<button id="mateSubmit" >등록하기</button>
				</td>
				</c:if>
				<c:if test="${ empty sessionScope.loginUser }">
				<td><textarea rows="3" cols="145" id="mateComContents" placeholder="로그인 후 이용해주세요" readonly ></textarea></td>
				</c:if>
			</tr>
		</table>
		
		<!-- 댓글 목록 -->
		<table align="center" width="500" border="1" cellspacing="0" id="mateComTb">
			<thead>
			<tr>
				<td colspan="5"><b id="mateComCount"></b></td>
			</tr>
			</thead>
			<tbody>
				<tr>
				<td>
				</td>
				<table align="center" width="500" border="1" cellspacing="0" id="mateComReplyInsertTb">
						<tr><td></td></tr>
				</table>
				<table align="center" width="500" border="1" cellspacing="0" id="mateComReplyTb">
						<tr>
							<td colspan="5"><b id="mateComReplyCount"></b></td>
						</tr>
						<tr><td></td></tr>
				</table>
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
					$('input[name="attendBtn"]').attr('value', '모집인원 충족');
					$('input[name="attendBtn"]').css('background-color', "gray");
				}
				if(sessionId == mymateId) {
					$('input[name="attendBtn"]').attr('disabled', true);
					$('input[name="attendBtn"]').attr('value', '참여 중');
					$('input[name="attendBtn"]').css('background-color', "gray");
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
					data : {"mateNo" : mateNo},
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
				$("#mateComCount").text("댓글(" + data.length + ")");
				if(data.length >0) {
					for(var i in data) {
						mateCommentNo = data[i].mateComNo;
						console.log(mateCommentNo);
						var mateComId = data[i].userId;
						
						$tr = $("<tr style='font-weight:bolder;'>");
						$userId = $("<td width='100'>").text(data[i].userId);
						
						if(sessionId == "") {
							$mateComContents = $("<td  width='400' colspan='3'>").text(decodeURIComponent(data[i].mateComContents).replace(/\+/g, " "));
							$mateComDate = $("<td width='100'>").text(data[i].mateComDate);
							$tr.append($userId);
							$tr.append($mateComContents);
							$tr.append($mateComDate);
						} else {
							$mateComContents = $("<td  width='400'>").text(decodeURIComponent(data[i].mateComContents).replace(/\+/g, " "));
							$mateComDate = $("<td width='100'>").text(data[i].mateComDate);
							$modifyCom = $("<td width='100'>")
							.append("<button type='button' id='mateComReply' onclick='mateComReplyView(this," +data[i].mateComNo+ ")'>답변달기</button>");
							
							$tr.append($userId);
							$tr.append($mateComContents);
							$tr.append($mateComDate);
							$tr.append($modifyCom);
						}
						if(sessionId == mateComId) {
							$btn = $("<td width='100'>").append("<button type='button' onclick='mateComDelete("+ data[i].mateComNo +")'>삭제</button>");
							$tr.append($btn);
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
											.append("<button type='button' id='mateComReply' onclick='mateComeReplyDelete("+element[j].mateComNo+")'>삭제</button>");
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