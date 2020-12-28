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

.btndelete {
	width:68%;
	text-align:right;
	}
.addReply{
	width:7%;
	text-align:right;
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
		.btndelete {
			width:63%;
			text-align:right;
		}
		.addReply{
			width:7%;
			text-align:right;
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
	.tableComment tbody {margin:5px;}
	.tableComment tbody tr {border : 1px solid lightgray;}
	.tableComment tr td, .mateComReplyTb tr td {
		float:left;
	}
	.tableComment>tr>td {
		border-top : 1px splid white;
	}
	/* Position the image container (needed to position the left and right arrows) */
	.containers {
	  position: relative;
	  width : 500px;
	  height : 350px;
	  margin : auto;
	}
	
	/* Hide the images by default */
	.mySlides {
	  display: none;
	  width : 500px;
	  height : 350px;
	  margin : auto;
	}
	
	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
	  cursor: pointer;
	}
	
	/* Next & previous buttons */
	.prevv,
	.nextt {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: black;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	
	/* Position the "next button" to the right */
	.nextt {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	.prevv {
		left : 0;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prevv:hover,
	.nextt:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	}

/* On hover, add a black background color with a little bit see-through */
.prevv:hover, .nextt:hover {
  background-color: rgba(0,0,0,0.8);
}
.main_slideImg {position:absolute;}
.main_slideImg{width:100%;height:300px;
-webkit-transition: opacity 1s ease-in-out; 
-moz-transition: opacity 1s ease-in-out; 
-o-transition: opacity 1s ease-in-out; 
transition: opacity 1s ease-in-out; 
opacity: 0;
}
</style>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->
	<div class="content" style="height:1000px;">
	<div class="menub">
		<ul>
				<li></li>
				<li><div class="name"><a href="myInfo.doa">회원정보 수정</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="opendiaryContentsList.doa?userId=${loginUser.userId }">내가 쓴글</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="myMateAttendList.doa?userId=${loginUser.userId }">마이 메이트</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="deleteMember.doa">회원탈퇴</a></div><div class="imgwrapper"> > </div></li>
			</ul>
	</div>
	<div class="main" style="height:600px;">
		<div class="main-name">
			<h2 class="main-name-h2"> " ${opendiaryOne.opendiaryTitle } " </h2>
		</div>
		<div style="text-align:right;">
			<c:url var="opendiaryDelete" value="opendiaryDelete.doa">
				<c:param name="opendiaryNo" value="${ opendiaryOne.opendiaryNo }"></c:param>
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="opendiaryUpdate" value="opendiaryUpdateView.doa">
				<c:param name="opendiaryNo" value="${ opendiaryOne.opendiaryNo }"></c:param>
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="opendiaryList" value="opendiaryContentsList.doa">
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:if test="${ loginUser.userId eq opendiaryOne.userId }">
				<button type="button" class="btn btn-primary" onclick="location.href='${opendiaryUpdate}'">수정하기</button>
				<button type="button" class="btn btn-primary" onclick="askquestion()">삭제하기</button>
			</c:if>
			<button type="button"  class="btn btn-primary" onclick="location.href='${opendiaryList}'">목록으로</button>
		</div>
		<div class="table-wrap">
			<input type="hidden" id="opendiaryNo" value="${opendiaryOne.opendiaryNo }">
			<input type="hidden" id="sessionId" value="${loginUser.userId }">
			<table align="center" cellpadding="10" cellspacing="0" border="1" width="100" class="table">
				<tr >
				<td style="width:100px;height:310px;"rowspan="4">
					<div class="containers">
							<c:forEach items="${diaryImg }" var="diaryImg" varStatus="status">
								<div class="mySlides">
									<img src="/resources/opendiaryUploadFiles/${diaryImg.userId }/${diaryImg.opendiaryNo }/${diaryImg.imgRenamePath}" style="width:100%;height:100%;">
								</div>
							</c:forEach>
							<a class="prevv" onclick="plusSlides(-1)"> &#10094;</a>
							<a class="nextt" onclick="plusSlides(1)"> &#10095;</a>
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
					<button id="opendComSubmit" class="btn btn-primary">등록하기</button>
				</td>
				</c:if>
				<c:if test="${ empty sessionScope.loginUser }">
				<td><textarea rows="3" cols="145" id="opendComContents" placeholder="로그인 후 이용해주세요" readonly ></textarea></td>
				</c:if>
			</tr>
		</table>
		
		<!-- 댓글 목록 -->
		<table align="center" width="500" cellspacing="0" id="opendComTb">
			<thead>
			<tr>
				<td colspan="5"><b id="opendComCount"></b></td>
			</tr>
			</thead>
			<tbody>
				<tr>
				<td>
				</td>
				<table align="center" width="500" cellspacing="0" id="opendComReplyInsertTb">
						<tr><td></td></tr>
				</table>
				<table align="center" width="500"  cellspacing="0" id="opendComReplyTb">
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
	
	$(document).ready(function() {
		
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
				success : function(data,pi) {
					$tableBody = $("#opendComTb tbody");
					$tableBody.html("");
					
					/* var $tr;
					var $userId;
					var $openComContents;
					var $openComDate;
					var $modifyCom;
					var $openComReply;
					var $btn;
					var $td; */
					var $tr;
					var $userId;
					var $mateComContents;
					var $mateComDate;
					var $modifyCom;
					var $mateComReply;
					var $btn;
					var $td;
					$("#opendComCount").text("댓글");
					if(data.length >0) {
						for(var i in data) {
							/* opendCommentNo = data[i].openComNo;
							console.log(opendCommentNo); */
							var opendComId = data[i].openComUser;
							openCommentNo = data[i].openComNo;
							var idx = Number()
							console.log(pi.currentPage);
							
							/* $tr = $("<tr style='font-weight:bolder;'>");
							$userId = $("<td width='100' style='margin-left:20px;margin-top:7px;padding-right:15px;border-right:1px solid black;'>").text(data[i].openComUser);
							$openComDate = $("<td width='100' style='margin-top:7px;'>").text(data[i].openComDate);
							if(sessionId == "") {
								$openComContents = $("<td width='100%' height='25' style='text-align:left;padding-left:20px;margin-top:10px;' >").text(decodeURIComponent(data[i].openComContents).replace(/\+/g, " "));
								
								$tr.append($userId);
								$tr.append($openComDate);
								$tr.append($openComContents);
							} else {
								$openComContents = $("<td width='100%' height='25' style='text-align:left;padding-left:20px;margin-top:10px;'>").text(decodeURIComponent(data[i].openComContents).replace(/\+/g, " "));
								
								$modifyCom = $("<tdclass='addReply'>")
								.append("<button type='button' id='mateComReply' onclick='openComReplyView(this," +data[i].openComNo+ ")'>답글 </button>");
								
								$tr.append($userId);
								$tr.append($openComDate);
								$tr.append($openComContents);
								$tr.append($modifyCom);
							}
							if(sessionId == opendComId) {
								$btn = $("<td class='btndelete'>").append("<button type='button' onclick='openComReplyDelete("+ data[i].openComNo +")'>삭제</button>");
								$tr.append($btn);
							}
							$tableBody.append($tr); */
								openCommentNo = data[i].openComNo;
								var comuser = data[i].openComUser;
								
								$tr = $("<tr style='font-weight:bolder;'>");
								$userId = $("<td colspan='5' style='margin-left:20px;margin-top:7px;padding-right:15px;border-right:1px solid black;'>").text(data[i].openComUser);
								$mateComDate = $("<td width='100' style='margin-top:7px;'>").text(data[i].openComDate);
								$mateComContents = $("<td  width='100%' height='25' style='text-align:left;padding-left:20px;margin-top:10px;'>").text(decodeURIComponent(data[i].openComContents).replace(/\+/g, " "));
								if(sessionId == "") {
									$tr.append($userId);
									$tr.append($mateComDate);
									$tr.append($mateComContents);
								} else if(sessionId != "" && sessionId == opendComId) {
									$btn = $("<td class='btndelete'>").append("<button type='button' onclick='openComReplyDelete("+ data[i].openComUser +")'>삭제</button>");
									$tr.append($userId);
									$tr.append($mateComDate);
									$tr.append($btn);
									
									if(sessionId != ""){
										$modifyCom = $("<td class='addReply'>")
										.append("<button type='button' id='mateComReply' onclick='openComReplyView(this," +data[i].openComUser+ ")'>답글</button>");
										
										$tr.append($modifyCom);
										
									} 
									$tr.append($mateComContents);
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
					}else {
						$tr =$("<tr>");
						$mateComContents = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						$tr.append($mateComContents);
						$tableBody.append($tr);
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
	});
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
	</script>
</body>
</html>