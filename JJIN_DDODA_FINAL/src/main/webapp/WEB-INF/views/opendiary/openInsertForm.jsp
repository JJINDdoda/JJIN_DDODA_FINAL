<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 글쓰기</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	/* .table > tr > td{color : green;}
	input {width:100%; height:30px;font-size:1.2em;background:#f6f6f6;border:none;}
	.insert {width:100px;}
	.file {background : white;}
	textarea{width:100%;resize:none;background:#f6f6f6;border:none;}
	#fileList {border : 1px solid black;}
	#uploadfile{width:100%;float:left;height:20px;}
	.file-group {height : 23px;}
	.textarea{resize:none;} */
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
	<h3 align="center">공유일기 글쓰기</h3>
	<form id="fileForm" action="opendiaryInsert.doa" method="post" name="opendiaryForm"  enctype="multipart/form-data" onsubmit="return checkvalue();">
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="opendiaryTitle" id="opendiaryTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userId" value="${loginUser.userId }" readonly></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="opendiaryContents" id="opendiaryContents"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<!-- <td><div style="width : 200px;margin-right:0px;float:left;">
					<input type="file" name="uploadFiles" class="file" id="fileupload" 
					id="input_imgs" maxlength="1" accept="image/jpeg,.jpg,.png" />
					</div>
					<button  type="button" onclick="intaddBtn()" id="addBtn">추가하기</button><br>
					<div id="fileList" style="width:250px;float:left;text-align:left;margin-left:5%;"></div>
				</td> -->
				<td>
					<div class="form-group" id="file-list">
                            <div class="btn-group" style="width:100%;text-align:left;" ><button type="button" onclick="addFile()">파일추가</button></div>
                            <div class="file-group" style="width:100%;">
                                 <div style="width:50%;margin-right:0px;float:left;"><input type="file" name="fileImg" id="uploadfile"></div>
                                 <div style="width:45%;margin-right:0px;float:left;text-align:left;margin-left:10px;">
                                 대표사진 선택 : <input type="checkbox" name="imgMainYn" value="0" style="width:20px;height:20px;margin:0px;"  onclick='checkMain(this);'></div>
                            </div>
                    </div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="submitBtn" value="등록하기" class="insert btn btn-primary"> &nbsp;
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
		var filecount = 1;
		var max = 5;
		function intaddBtn() {
			alert("작동중"); 
		}
		function checkMain(chk) {
			/* var obj = chk.val(); */
			/* if(obj > 1) {
				alert("1이상");
				$("input[name='imgMainYn']:checked").attr("checked", true);
				$("input[name='imgMainYn']").attr("checked", false);
			} */
			var obj = document.getElementsByName("imgMainYn");
			for ( var i = 0 ;i <obj.length ; i ++) {
				if(obj[i] != chk) {
					obj[i].checked = false;
				}
			}
		}
		
		$(document).ready(function() {
			/* var add = 'ADD'; */
			var remove = 'REMOVE';
			 $("a[name='file-delete']").on("click", function(e) {
	               e.preventDefault();
	               deleteFile($(this));
	           });
			/* $("#uploadfile").change(function() {
				fileName = "";
				fileName += "<div>"+ fileList +"<button type='button' id='remove'>" +remove+ "</button></div>";
				console.log(fileList );
			}) */
				/*$("#fileList").append(fileName); */
				/* for(var i = 0; i < 5; i++) {
					fileList = $("#fileupload")[0].files;  
					fileListTag = [];
					fileListTag += "<div>"+ fileList[i].name +"<button id='remove'>" +remove+ "</button></div>";
					fileLimit += fileListTag[i].length;
					console.log(fileList[i].name +", "+fileLimit);
					if(fileLimit > 5) {
						alert("이미지는 5개까지만 선택할 수 있습니다.");
						fileLimit = 6;
						break;
					}
					$("#fileList").append(fileListTag);
					break;
				}
				console.log(fileList[i].name +", "+fileLimit); */
			/* }); */
			
			/* var fCount = $("input[name='fileImg']").files.length;
				
			var fileImgs = new Array(fCount);
			var i;
			for (i = 0; i< fCount ; i++) {
				fileImg[i] = $("input[name='fileImg']").eq(i).val();
				console.log(fileImg[i]);
				console.log(divCount);
			}  */
		}); 
		
		function returnOpenList() {
			var answer = confirm("일기작성을 그만두시겠습니까?");
			if(answer) {
				location.href="opendiaryList.doa";
			}
		}
		
		var fCount = 0
		function addFile() {
			fCount++;
			var divCount = $(".file-group").length;
			
	          	if (divCount > 4) {
	          		alert("5개까지만 업로드 가능합니다.");
	          		return false;
	          	}
	           var str = "<div class='file-group' style='width:100%;'>" +
	           			 "<div style='width:50%;margin-right:0px;float:left;'><input type='file' name='fileImg' id='uploadfile'></div>" +
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
		
		function checkvalue() {
			/* var odInfo = document.opendiaryForm; */
			var divCount = $(".file-group").length;
			var chek = $("input[name='imgMainYn']:checked").val();
				
			/* var temp = $("input:checkbox[name='imgMainYn']:checked").val();
			var tempArray = new Array();
			$("input:checkbox[name='imgMainYn']:checked").each(function() {
				tempArray.push(this.value);
			});
			alert(tempArray); */
			/*
			if(!odInfo.opendiaryTitle.value){
				alert("제목을 입력해주세요");
				return false;
			}
			if(!odInfo.userId.value){
				alert("아이디를 입력해주세요");
				return false;
			}
			if(!odInfo.opendiaryContents.value){
				alert("내용을 입력해주세요");
				return false; 
			} */
			var opendiaryTitle = $('#opendiaryTitle').val();
			var opendiaryContents = $('#opendiaryContents').val();
			var objchk = $("input[name='imgMainYn']:checked").val();
			
			if(opendiaryTitle == "" || opendiaryContents == "") {
				alert("내용을 모두 입력해주세요");
				return false;
			}  else if(chek == null) {
				var ask = confirm("업로드할 사진은 없으신가요?");
				if(ask){
					return true;
				}else {
					alert("업로드할 사진과 대표사진을 선택해주세요");
					return false;
				}
			} else {
				var quest = confirm("공유일기를 작성하시겠습니까?");
				if(quest){
					return true;
				}else {
					return false;
				}
			} 
			
		}
		
	</script>
</body>
</html>