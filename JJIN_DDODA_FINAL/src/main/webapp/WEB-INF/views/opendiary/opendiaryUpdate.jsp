<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유일기 수정하기</title>
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
	<h3 align="center">${opendiary.opendiaryNo }번 공유일기 수정하기</h3>
	<form id="fileForm" action="opendiaryUpdate.doa" method="post" name="opendiaryForm"  enctype="multipart/form-data"  onsubmit="return checkIt()">
		<input type="hidden" name="page" value="${currentPage }">
		<input type="hidden" name="opendiaryNo" id="opendiaryNo" value="${ opendiary.opendiaryNo}">
		<c:set value="${ mainImgPath}" var="mainImgP"/>
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="opendiaryTitle" id="opendiaryTitle" value="${opendiary.opendiaryTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userId" value="${loginUser.userId }" readonly></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="opendiaryContents" id="opendiaryContents">${opendiary.opendiaryContents }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일<br>(총 5개까지 업로드 가능합니다)</td>
				<td>
					<div class="form-group" id="file-list">
                            <div class="btn-group" style="width:100%;text-align:left;" ><button type="button" onclick="addFile()">파일추가</button></div>
                            <div class="file-group" style="width:100%;">
                                 <div style="width:50%;margin-right:0px;float:left;"><input type="file" name="reloadFile" id="reloadFile"></div>
                                 <div style="width:45%;margin-right:0px;float:left;text-align:left;margin-left:10px;">
                                 대표사진 선택 : <input type="checkbox" name="imgMainYn" value="0" style="width:20px;height:20px;margin:0px;"  onclick='checkMain(this);'></div>
                            </div>
                    </div>
				</td>
			</tr>
			<tr>
				<td>파일 라이브러리</td>
				<td>
				<div>
                    <c:forEach items="${diaryImg }" var="diaryImg" varStatus="status">
                    <input type="hidden" name="opendiaryNo" value="${diaryImg.opendiaryNo }">
                    <div id="${status.count}" class="file-container" style="float:left;width:100px;margin-right:5px; ">
                    <c:choose>
                    	<c:when test="${diaryImg.imgMainYn == 'Y' }">
							<div style="width:100px;height:100px;">
							<img src="/resources/opendiaryUploadFiles/${diaryImg.userId }/${diaryImg.opendiaryNo}/${diaryImg.imgRenamePath}" height="100" style=" border:5px solid #f7bf99; ">
							</div>
							<div class="fileBtn">
								<div style="margin-bottom:0px;height:40px;width:75%;float:left;"><p>${diaryImg.imgPath}
								</p>
								</div>
								<div id="mainImg" style="margin-top:5px;width:40%;float:left; color:#f7bf99;">[대표]</div>
								<input type="button" class="deleteBtn" id="${status.count}" value="X" style="margin-top:5%;margin-bottom:5%;padding-left:5%;padding-right:5%;float:left;"onclick="ImgQuestion('${diaryImg.imgRenamePath}')" />
							</div>
						</c:when>
						<c:when test="${diaryImg.imgMainYn == 'N' }">
							<div style="width:100px;height:100px;"><img src="/resources/opendiaryUploadFiles/${diaryImg.userId }/${diaryImg.opendiaryNo}/${diaryImg.imgRenamePath}" height="100"></div>
							<div class="fileBtn">
								<div style="margin-bottom:0px;height:40px;width:100%;float:left;"><p>${diaryImg.imgPath}</p>
								</div>
								<input type="button" class="deleteBtn" id="${status.count}" value="X" style="margin-top:5%;margin-bottom:5%;padding-left:5%;padding-right:5%;float:left;"onclick="ImgQuestion('${diaryImg.imgRenamePath}')" />
							</div>
						</c:when>
					</c:choose>
					</div>
					</c:forEach>
                </div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="submitBtn" value="수정하기" class="insert btn btn-primary"> &nbsp;
					<a href="javascript:returnOpenList()">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script>
	$(document).ready(function () {
		/* setTimeout(function() {
			reload();
		}, 5000); */
	});
	function ImgQuestion(imgRenamePath) {
		var opendiaryNo = ${opendiary.opendiaryNo };
		var dimgsCount = ${dimgsCount};
		/* var imgRenamePathhh = $(".file-container").attr('id'); */
		var ask = confirm("해당 파일을 삭제하시겠습니까? 삭제 시 본문에 첨부한 파일도 함께 삭제됩니다.");	
		if(ask) {
			$.ajax({
				url : "deleteFile.doa",
				type : "get",
				data : {"opendiaryNo" : opendiaryNo, "imgRenamePath" : imgRenamePath},
				success : function(data) {
					if(data == "success") {
						alert("파일이 삭제되었습니다.");
						
					} else {
						alert("파일 삭제에 실패했습니다.");
					}
				}
			})
		} else {
			return false;
		}
	}
	var fCount = 0;
	function addFile() {
		fCount++;
		var divCount = $(".file-group").length;
		var dimgsCount = ${dimgsCount};
		// 총 5개 올릴 수 있는데 divCount가 1
          	if (divCount > 4 || 4-dimgsCount < divCount) {
          		alert("더 이상 업로드 할 수 없습니다. 라이브러리의 파일을 삭제한 뒤 시도해주세요.");
          		return false;
          	}
           var str = "<div class='file-group' style='width:100%;'>" +
           			"<div style='width:50%;margin-right:0px;float:left;'><input type='file' name='reloadFile' id='reloadFile'></div>" +
           			"<div style='width:25%;margin-right:0px;float:left;text-align:left;margin-left:10px;'>대표사진 선택 : " +
           			"<input type='checkbox' name='imgMainYn' value='"+fCount+"' style='width:20px;height:20px;margin:0px;' onclick='checkMain(this);'></div>" +
           			"<div style='width:10%;margin-right:0px;float:left;'>" +
           			"<a href='#this' class='btn' name='file-delete' style='padding-top : 0px;padding-bottom : 0px;'>삭제</a></div>" +
           			"</div>";
           $("#file-list").append(str);
           $("a[name='file-delete']").on("click", function(e) {
               e.preventDefault();
               deleteFile($(this));
           });
       }
	function deleteFile(obj) {
        obj.parent().parent().remove();
    }
	
	function checkMain(chk) {
		var mainis = $("#mainImg").length;
		var opendiaryNo = $("#opendiaryNo").val();
		var objNum = 0;
		if(mainis == 1) {
			var changeMain = confirm("대표사진이 이미 있습니다. 대표사진을 바꾸시겠습니까?"); 
			var obj = document.getElementsByName("imgMainYn");
			if(changeMain) {
				$.ajax({
					url : "updateMainImg.doa",
					type : "get",
					data : {"opendiaryNo" : opendiaryNo},
					success : function(data) {
						if(data == "success") {
							console.log(opendiaryNo+"번경함");
							alert("대표사진을 변경했습니다.");
						}else {
							console.log(opendiaryNo + "변경못함");
							alert("대표사진을 변경하지 못했어요.");
						}
					}
				}); 
			} else {
				for ( var i = 0 ;i <obj.length ; i ++) {
					if(obj[i] == chk) {
						obj[i].checked = false;
						
					} else {
						obj[i].checked = true;
					}
				}
				return false;
			} 
			
		}
		
	}
	function returnOpenList() {
		var ask = confirm("목록으로 돌아가시겠습니까?");
		if(ask) {
			return true;
		} else {
			return false;
		}
	}
	function checkIt() {
		var ask = confirm("수정을 완료하시겠습니까?");
		if(ask) {
			return true;
		} else {
			return false;
		}
	}
	</script>
</body>
</html>