<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 쓰기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
@media ( max-width : 991px) {
		.menub li {
		width: 25%;
		}
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
			<li><a href="#">메인</a></li>
			<li><a href="#">기본 정보</a></li>
			<li><a href="#">마이 일기</a></li>
			<li><a href="#">마이 식단</a></li>
		</ul>
	</div>
	<div class="main">
		<div class="main-name">
			<h4 class="main-name-h2">${date } 일기쓰기</h4>
		</div>
		<div class="table-wrap">
		<form id="diaryToday" action="insertMyDiary.doa" method="post" name="diaryToday"   enctype="multipart/form-data"  onsubmit="return checkvalue();">
			<input type="hidden" name="opendiaryDate" value="${date }">
			<input type="hidden" name="userId" id="userId" value="${loginUser.userId }">
			<table class="table">
				<tr>
					<td>
					일기를 공개하시겠습니까? <input type="radio" id="openYn" name="openYn" value="Y" />네 
					<input type="radio" id="openYn" name="openYn" value="N" checked="checked" />아니요
					</td>
				</tr>
				<tr>
					<td>
					<input style="width:90%; height:30px;" type="text" name="opendiaryTitle" id="opendiaryTitle" placeholder="제목을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>
					<textarea cols="100" rows="7" name="opendiaryContents" id="opendiaryContents" placeholder="내용을 입력해주세요" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
				<td>
					<div class="form-group" id="file-list">
					<p>사진 업로드 시 대표사진을 지정해주세요</p>
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
					<td><input type="submit" value="작성하기"></td>
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