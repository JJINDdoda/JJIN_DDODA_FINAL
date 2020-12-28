<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 쓰기</title>
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
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->	
	<div class="content">
	<div class="menub">
		<ul>
			<li></li>
			<li><div class="name"><a>달력</a></div><div class="imgwrapper"> > </div></li>
			<li><div class="name more"><a>기본 정보</a></div><div class="imgwrapper"> > </div></li>
			<li><div class="name more"><a>마이 일기</a></div><div class="imgwrapper"> > </div></li>
			<li><div class="name more"><a>마이 식단</a></div><div class="imgwrapper"> > </div></li>
		</ul>
	</div>
	<div class="main">
		<div class="main-name">
			<h4 class="main-name-h2">${date } 오늘의 일기</h4>
		</div>
		<div class="table-wrap">
		<form id="diaryToday" action="insertMyDiary.doa" method="post" name="diaryToday"   enctype="multipart/form-data"  onsubmit="return checkvalue();">
			<input type="hidden" name="opendiaryDate" value="${date }">
			<input type="hidden" name="opendiaryModifyDate" value="${date }">
			<input type="hidden" name="userId" id="userId" value="${loginUser.userId }">
			<table class="table">
				<tr>
					<td>
					일기를 공개하시겠습니까? <input type="radio" id="openYn" name="openYn" value="Y" /> 네 
					<input type="radio" id="openYn" name="openYn" value="N" checked="checked" /> 아니요
					</td>
				</tr>
				<tr>
					<td>
					<input style="height:30px;" type="text" name="opendiaryTitle" id="opendiaryTitle" placeholder="제목을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>
					<textarea rows="7" name="opendiaryContents" id="opendiaryContents" placeholder="내용을 입력해주세요" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
				<td>
					<div class="form-group" id="file-list">
					<p style="margin-bottom:5px;">사진 업로드 시 대표사진을 지정해주세요</p>
                            <div class="btn-group" style="width:100%;text-align:left;margin-bottom:5px;" ><button type="button" onclick="addFile()">파일추가</button></div>
                            <div class="file-group" style="width:100%;">
                                 <div style="width:50%;margin-right:0px;float:left;"><input type="file" name="fileImg" id="uploadfile"></div>
                                 <div style="width:45%;margin-right:0px;float:left;text-align:left;margin-left:10px;height:24px;">
                                 <p style="width:80px;float:left;">대표사진 선택 : </p><input type="checkbox" name="imgMainYn" value="0" style="width:20px;height:20px;margin:0px;"  onclick='checkMain(this);'></div>
                            </div>
                    </div>
				</td>
				</tr>
				<tr>
					<td style="text-align:right;"><input type="submit" class="btn btn-primary" value="작성하기"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script>
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
	//file 칸 추가 
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
	           			 "<div style='width:25%;margin-right:0px;float:left;text-align:left;margin-left:10px;height:24px;'><p style='width:80px;float:left;'>대표사진 선택 : </p> " +
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
	//file 칸 삭제 
	function deleteFile(obj) {
	           obj.parent().parent().remove();
	       }
	function checkvalue() {
		var opendiaryTitle = $('#opendiaryTitle').val();
		var opendiaryContents = $('#opendiaryContents').val();
		var objchk = $("input[name='imgMainYn']:checked").val();
		var radiochk = $("input[name='openYn']:checked").val();
		console.log(radiochk);
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
			var quest = confirm("일기 작성을 마치시겠습니까?");
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