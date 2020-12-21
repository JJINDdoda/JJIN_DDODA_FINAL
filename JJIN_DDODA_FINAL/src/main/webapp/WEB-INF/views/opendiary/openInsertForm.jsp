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
	.table > tr > td{color : green;}
	input {width:100%; height:30px;font-size:1.2em;background:#f6f6f6;border:none;}
	.insert {width:100px;}
	.file {background : white;}
	textarea{width:100%;resize:none;background:#f6f6f6;border:none;}
	#fileList {border : 1px solid black;}
	#uploadfile{width:30%;float:left;height:20px;}
	.file-group {height : 23px;}
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
                            <button type="button" onclick="addFile()">파일추가</button>
                            <div class="file-group" >
                                 <input type="file" name="fileImg" id="uploadfile">
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
		}); 
		
		
		function addFile() {
			var divCount = $(".file-group").length;
			
	          	if (divCount > 4) {
	          		alert("5개까지만 업로드 가능합니다.");
	          		return false;
	          	}
	           var str = "<div class='file-group'><input type='file' name='fileImg' id='uploadfile'><a href='#this' class='btn' name='file-delete'>삭제</a></div>";
	           $("#file-list").append(str);
	           $("a[name='file-delete']").on("click", function(e) {
	               e.preventDefault();
	               deleteFile($(this));
	           });
	       }
		
	       function deleteFile(obj) {
	           obj.parent().remove();
	       }
	
		function returnOpenList() {
			var answer = confirm("일기작성을 그만두시겠습니까?");
			if(answer) {
				location.href="opendiaryList.doa";
			}
		}
		
		
		function checkvalue() {
			/* var odInfo = document.opendiaryForm; */
			var divCount = $(".file-group").length;
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
				/* var fCount = $("input[name='fileImg']").files.length;
				
				var fileImg = new Array(fCount);
				var i;
				for (i = 0; i< fCount ; i++) {
					fileImg[i] = $("input[name='fileImg']").eq(i).val();
					console.log(fileImg[i]);
					console.log(divCount);
				} */
				
				
				if(opendiaryTitle == "" || opendiaryContents == "") {
					alert("모두 작성해주세요");
					return false;
				}
				return false;
			
		}
	</script>
</body>
</html>