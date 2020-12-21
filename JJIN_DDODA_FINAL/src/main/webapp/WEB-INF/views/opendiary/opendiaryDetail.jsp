<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공유일기 상세보기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
.slideshow-container{list-style:none;padding-left:0px;}
.table-wrap{height:420px;}
* {
  margin: 0px;
  padding: 0px;
}

#panel {
  list-style: none;
}
.slider {
  width: 100%;
  height: 100%;
  margin: 0 auto;
  background-color: aqua;
  position: relative;
  overflow: hidden;
}

.slider .panel {
  width: 100%;
  height: 100%;
  position: relative;
}

.slider .panel li {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0px;
  left: 0px;
  color: #fff;
  font-size: 30px;
  display: none;
}

.panel li:nth-child(1) {
  background-color: red;
  display: block;
}

.panel li:nth-child(2) {
  background-color: blue;
}

.panel li:nth-child(3) {
  background-color: gray;
}

.panel li:nth-child(4) {
  background-color: yellow;
}

.btn {
  position: absolute;
  bottom: 30px;
  left: 50%;
  margin-left: -70px;
}

.btn li {
  float: left;
  width: 20px;
  height: 20px;
  background-color: cadetblue;
  border-radius: 50%;
  text-indent: -9999px;
  margin-right: 20px;
  cursor: pointer;
}

.btn .on {
  background-color: #000;
}

.btn li:hover {
  background-color: #000;
}

.btn li:last-child {
  margin-right: 0px;
}

.prev {
  position: absolute;
  left: 30px;
  top: 50%;
  width: 30px;
  height: 30px;
  background-color: none;
  margin-top: -15px;
}

.next {
  position: absolute;
  right: 30px;
  top: 50%;
  width: 30px;
  height: 30px;
  background-color: none;
  margin-top: -15px;
}

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->
	<div class="content" style="height:800px;">
	<div class="menub" style="">
		<ul>
			<li><a href="mateList.doa">메이트 커뮤니티</a></li>
			<li><a href="opendiaryList.doa">공유일기 게시판</a></li>
		</ul>
	</div>
	<div class="main" style="height:600px;">
		<div class="main-name">
			<h2 class="main-name-h2">${opendiaryOne.opendiaryNo }번 글 상세보기</h2>
		</div>
		<div class="table-wrap">
			<input type="hidden" id="opendiaryNo" value="${opendiaryOne.opendiaryNo }">
			<input type="hidden" id="sessionId" value="${loginUser.userId }">
			<table align="center" cellpadding="10" cellspacing="0" border="1" width="500" class="table">
				<tr >
				<td height="300" width="300" rowspan="4">
				<div class="slider" style="margin-left:0px;margin-right:0px;">
					<ul class="panel">
					<c:forEach items="${diaryImg }" var="diaryImg" varStatus="status">
						<li class="panel-img">
						<img style="width:100%;height:100%;" src="/resources/opendiaryUploadFiles/${diaryImg.userId }/${diaryImg.opendiaryNo}/${diaryImg.imgRenamePath}" style="width:70%;height:150px;">
						</li>
					</c:forEach>
					<button class="prev">&#10094;</button>
					<button class="next">&#10095;</button>
					</ul>
				</div>
				</td>
				</tr>
				<tr>
					<td height="20">제목</td>
					<td>${opendiaryOne.opendiaryTitle }</td>
					
				</tr>
				<tr>
					<td colspan="2" height="20">${opendiaryOne.opendiaryDate }</td>
				</tr>
				<tr>
					<td colspan="2">${opendiaryOne.opendiaryContents }</td>
				</tr>
			</table>
		</div>
		<div>
			<c:url var="opendiaryDelete" value="opendiaryDelete.doa">
				<c:param name="opendiaryNo" value="${ opendiaryOne.opendiaryNo }"></c:param>
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="opendiaryUpdate" value="opendiaryUpdateView.doa">
				<c:param name="opendiaryNo" value="${ opendiaryOne.opendiaryNo }"></c:param>
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="opendiaryList" value="opendiaryList.doa">
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:if test="${ loginUser.userId eq opendiaryOne.userId }">
				<button type="button" onclick="location.href='${opendiaryUpdate}'">수정하기</button>
				<button type="button" onclick="askquestion()">삭제하기</button>
			</c:if>
			<button type="button" onclick="location.href='${opendiaryList}'">목록으로</button>
		</div>
	
	<!-- 댓글 등록 -->
		<table align="center">
			<tr>
				<th>댓글 등록
				</th>
			</tr>
			<tr>
				<c:if test="${ !empty sessionScope.loginUser }">
				<td><textarea rows="3" cols="145" id="opendComContents" placeholder="내용을 입력해주세요" ></textarea></td>
				<td>
					<button id="opendComSubmit" >등록하기</button>
				</td>
				</c:if>
				<c:if test="${ empty sessionScope.loginUser }">
				<td><textarea rows="3" cols="145" id="opendComContents" placeholder="로그인 후 이용해주세요" readonly ></textarea></td>
				</c:if>
			</tr>
		</table>
		
		<!-- 댓글 목록 -->
		<table align="center" width="500" border="1" cellspacing="0" id="opendComTb">
			<thead>
			<tr>
				<td colspan="5"><b id="opendComCount"></b></td>
			</tr>
			</thead>
			<tbody>
				<tr>
				<td>
				</td>
				<table align="center" width="500" border="1" cellspacing="0" id="opendComReplyInsertTb">
						<tr><td></td></tr>
				</table>
				<table align="center" width="500" border="1" cellspacing="0" id="opendComReplyTb">
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
	<!-- end content -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script>
	//이미지 슬라이드
	$(document).ready(function() {
		  //좌우버튼, 동그라미 버튼 연동 //
		  var wid = $(".slider").width();
		  var i = $(".btn li.on").index();
		  var len = $(".panel li").length;
		  $(".prev").click(function() {
		    if (i == 0) {
		      i = len - 1;
		    } else {
		      i = i - 1;
		    }
		    showSlide();
		  });

		  $(".next").click(function() {
		    if (i == 3) {
		      i = 0;
		    } else {
		      i = i + 1;
		    }
		    showSlide();
		  });

		  $(".btn li").click(function() {
		    i = $(this).index();
		    showSlide();
		  });

		  function showSlide() {
		    $(".btn li").removeClass("on");
		    $(".btn li").eq(i).addClass("on");
		    $(".panel li").stop(true, true).fadeOut();
		    $(".panel li").eq(i).stop(true, true).fadeIn();
		  }
		});
	
	
	var opendiaryNo = $("#opendiaryNo").val();
	var sessionId = $("#sessionId").val();
		function askquestion() {
			var ask = confirm("정말로 삭제하시겠습니까?");
			if(ask) {
				location.href='${opendiaryDelete}';
				return true;
			} else {
				return false;
			}
		}
		//--------댓글등록
		$(function() {
			openComList();
			/* opendiaryComList(); */
			/* setInterval(function() {
				console.log("동작중");
			}, 5000); */
			$("#opendComSubmit").on("click", function() {
				var openComContents = $("#opendComContents").val();
				console.log(openComContents);
				var ask = confirm("댓글을 등록하시겠습니까?");
				if(ask) {
					$.ajax({
						url : "addOpendComments.doa",
						type : "post",
						data : { "openComContents" : openComContents, "opendiaryNo" : opendiaryNo},
						success : function(data) {
							if(data == "success") {
								$("#opendComContents").val("");
								openComList();
								alert("댓글 등록에 성공했습니다.");
							}else {
								alert("댓글 등록에 실패했습니다.");
							}
						}
					});
				}
			});
		});
		//---------댓글 리스트
		function openComList() {
			var openCommentNo;
			$.ajax({
				url : "opendiaryComList.doa",
				type : "get",
				data : {"opendiaryNo" : opendiaryNo},
				dataType : "json",
				success : function(data) {
					$tableBody = $("#opendComTb tbody");
					$tableBody.html("");
					
					var $tr;
					var $userId;
					var $openComContents;
					var $openComDate;
					var $modifyCom;
					var $openComReply;
					var $btn;
					var $td;
					$("#opendComCount").text("댓글(" + data.length + ")");
					if(data.length >0) {
						for(var i in data) {
							/* opendCommentNo = data[i].openComNo;
							console.log(opendCommentNo); */
							var opendComId = data[i].openComUser;
							openCommentNo = data[i].openComNo;
							$tr = $("<tr style='font-weight:bolder;'>");
							$userId = $("<td width='100'>").text(data[i].openComUser);
							
							if(sessionId == "") {
								$openComContents = $("<td  width='400' colspan='3'>").text(decodeURIComponent(data[i].openComContents).replace(/\+/g, " "));
								$openComDate = $("<td width='100'>").text(data[i].openComDate);
								$tr.append($userId);
								$tr.append($openComContents);
								$tr.append($openComDate);
							} else {
								$openComContents = $("<td  width='400'>").text(decodeURIComponent(data[i].openComContents).replace(/\+/g, " "));
								$openComDate = $("<td width='100'>").text(data[i].openComDate);
								$modifyCom = $("<td width='100'>")
								.append("<button type='button' id='mateComReply' onclick='openComReplyView(this," +data[i].openComNo+ ")'>답변달기</button>");
								
								$tr.append($userId);
								$tr.append($openComContents);
								$tr.append($openComDate);
								$tr.append($modifyCom);
							}
							if(sessionId == opendComId) {
								$btn = $("<td width='100'>").append("<button type='button' onclick='openComReplyDelete("+ data[i].openComNo +")'>삭제</button>");
								$tr.append($btn);
							}
							$tableBody.append($tr);
							//대댓글리스
							$.ajax({
								url : "openComReplyList.doa",
								async: false,
								type : "get",
								data : {"opendiaryNo" : opendiaryNo, "refNo" : openCommentNo },
								dataType : "json",
								success: function(element) {
									$replyBody = $("#opendComReplyTb");
									$replyBody.html("");
									
									var $trr;
									/* var $position; */
									var $replyUserId;
									var $replyContents;
									var $replyDate;
									var $replyDelete;
									if(element.length >0) {
										for(var j in element) {
											var openComUser = element[j].openComUser;
											
											$trr = $("<tr colspan='4'>");
											$replyUserId = $("<td >").text("-->  " + decodeURIComponent(element[j].openComUser));
											/* $position = $("<td width='100' colspan='2'>").text("->"); */
											if(sessionId == openComUser) {
												$replyContents = $("<td width='100'>").text(decodeURIComponent(element[j].openComContents));
												$replyDate = $("<td>").text(element[j].openComDate);
												
												$trr.append($replyUserId);
												$trr.append($replyContents);
												$trr.append($replyDate);
												$replyDelete = $("<td colspan='2'>")
												.append("<button type='button' id='openComReply' onclick='openComReplyDelete("+element[j].openComNo+")'>삭제</button>");
												$trr.append($replyDelete);
											} else {
												$replyContents = $("<td width='100' colspan='3'>").text(decodeURIComponent(element[j].openComContents));
												$replyDate = $("<td>").text(element[j].openComDate);
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
					}
				}
			});
		}
		var rCount = 1;
		//--------대댓글 입력
		function openComReplyView(e, openComNo) {
			$replyTableBody = $("#opendComReplyInsertTb");
			$replyTableBody.html("");
			if (rCount > 1) {
				return false;
			} else {
				rCount++;
				var replyTextArea = $(e).parent().parent();
				replyTextArea.after("<tr colspan='5'><td colspan='5'><div>"+openComNo+ 
						"번 댓글에 답변달기</div><textarea rows='3' cols='165' id='openComReplyCon' placeholder='내용을 입력해주세요'></textarea>" +
						"<button type='button' id='openComReply' onclick='openComReplyInsert("+openComNo+")'>답글등록</button>"+
						"<button type='button' id='openComReplyDelete' >취소</button></td></tr>");
				console.log("view : "+openComNo);
				return false;
				$("#openComReplyDelete").on("click", function(e) {
		               e.preventDefault();
		               removeReply($(this));
		        });
			}
		}
		function removeReply(obj) {
			obj.parent().parent().remove();
		}
		//--------대댓글 등록
		function openComReplyInsert(refNo) {
				var openComReplyCon = $('#openComReplyCon').val();
				var ask = confirm("대댓글 등록을 완료하시겠습니까?");
				if(ask) {
				if(openComReplyCon != "") {
				$.ajax({
					url : "addOpenComReply.doa",
					type : "post",
					data : { "openComContents" : openComReplyCon, "opendiaryNo" : opendiaryNo, "refNo" : refNo },
					success : function(data) {
						if(data == "success") {
							$("#openComReplyCon").val("");
							/* $("#mateComReplyInsertTb").remove(); */
							alert("댓글 등록에 성공했습니다.");
							openComList();
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
		//대댓글 삭제
		function openComReplyDelete(openComNo) {
			var ask = confirm("대댓글을 삭제하시겠습니까?");
			if(ask) {
			$.ajax({
				url:"deleteOpendCom.doa",
				type : "get",
				data : {"openComNo" : openComNo},
				success : function(element) {
					if(element == "success") {
						openComList();
					}else {
						alert("대댓글 삭제에 실패했습니다.");
					}
				}
			});
			} else {
				return false;
			}
		}
	</script>
</body>
</html>