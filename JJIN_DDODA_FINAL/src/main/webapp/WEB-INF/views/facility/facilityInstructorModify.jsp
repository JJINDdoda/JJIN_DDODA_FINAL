<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Name</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.table > tr > td {
		color : green;
	}
	
	input {
		width:100%;
		height:30px;
		font-size:1.2em;
		background:#f6f6f6;
		border:none;
	}
	
	.insert {
		width:100px;
	}
	
	.file {
		background : white;
	}
	
	textarea{
		width:100%;
		resize:none;
		background:#f6f6f6;
		border:none;
	}
	
	.facilityInfo{
		height: 80px;
		width: 150px;
		float: left;
	}
	
	.facilityImg{
		height: 80px;
		width: 100px;
	}
	
	.nextMarker{
		height: 80px;
		width: 70px;
		float: left;
	}
	
	.nextMarkerImg{
		height: 80px;
		width: 50px;
		margin-left: 10px;
	}
	
	.facilityMenu{
		border: 1px solid darkgray;
		height: 80px;
		weight: 300px;
		border-radius: 10px;
	}
	
	#facilityRegistor{
		background-color: #FCE4D4;
	}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<br><br>
	<!-- end header -->

	<!-- content -->	
	
	<div class="content" style="height:1000px;">
		<div class="menub" style="height:500px; position: fixed;">
			<ul>
				<li><a href="facilityListView.doa">시설정보</a></li>
				<li><a href="facilityRegistrationView.doa">시설등록</a></li>
			</ul>
		</div>
		<div class="main" style="margin-left: 180px;">
			<div class="main-name" style="height: 80px; width: 1200px;">
				<!-- <img src="../resources/images/facilityMap/facilityRegistor.png" class="facilityImg"> -->
				<div class="facilityInfo">
					<div class="facilityMenu" onclick="facilityInfoClick()"></div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityPriceClick()">
					<div class="facilityMenu"></div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityInstructorClick()">
					<div class="facilityMenu"  id="facilityRegistor"></div>
				</div>
			</div>
			<br><br>
			<div class="table-wrap">
				<form id="fileForm" action="facilityInstructorModify.doa" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${facilityNo }" name="facilityNo">
					<table class="table" id="facilityTbl">
						<thead>
							<tr>
								<td colspan="5" align="left">
									<a href='#this' onclick="addInstructor()">+ 추가하기</a>
								</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${instructorInfo }" var="instructorInfo">
								<input type="hidden" value="${instructorInfo.instructorRename}" name="instructorRename">
								<tr>
									<td>강사이름</td>
									<td>
										<input type="text" name="instructorNameDB" id = "instructorName" value="${instructorInfo.instructorName }" readonly>
									</td>
									<td>강사사진</td>
									<td>
										<a href="./resources/facilityFiles/instructorPicture/${instructorInfo.instructorRename}">${instructorInfo.instructorPicture }</a>
										<input type="hidden" value="${instructorInfo.instructorRename }" name="instructorRename" id="instructorRename">
									</td>
									<td>
										<a href="#this" onclick="deleteDBPrice(this)">- 삭제하기</a>
									</td>
								</tr>
								<tr>
									<td>경력</td>
									<td colspan="3"><input type="text" name="carrerDB" value="${instructorInfo.carrer }"></td>
								</tr>
								<tr>
									<td>다짐</td>
									<td colspan="3">
										<textarea rows="5" cols="50" name="promiseDB">${instructorInfo.promise }</textarea>
									</td>
								</tr>
							
							</c:forEach>
						</tbody>
						
						
					</table>
					<div align="center">
						<input type="submit" value="등록하기" class="insert btn btn-primary" onclick="instructorDeleteSubmit()"> &nbsp;
						<a href="javascript:returnOpenList()">목록으로</a>
					</div>
				</form>
				
				
			</div>
			
		</div>
	</div>

	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68326c8ad1d84bdc1f10d98cebe524dc&libraries=services"></script>
	<script>
		
		function facilityInfoClick(){
			location.href='facilityInfoRegistView.doa';
		}
		
		function facilityPriceClick(){
			location.href='facilityPriceRegistView.doa';
		}
		
		function addInstructor(){
			var str = "<tr><td>강사이름</td><td><input type='text' name='instructorName'></td><td>강사사진</td><td><input type ='file' name = 'instructorPicture'></td><td><a href='#this' onclick='deletePrice(this)'>- 삭제하기</td></tr>"
						+"<tr><td>경력</td><td colspan='3'><input type='text' name='carrer'></td></tr>"+
						"<tr><td>다짐</td><td colspan='3'><textarea rows='5' cols='50' name='promise'></textarea></td></tr>";
			$('#facilityTbl').append(str);
			
		}
		
		
		function deletePrice(obj){
			var choiceRow = $(obj).parent().parent();
			var nextRow = choiceRow.next(); //nth-child()
			var doubleRow = nextRow.next();
			choiceRow.remove();
			nextRow.remove();
			doubleRow.remove();
            deleteFile($(this));
		}
		
		function deleteFile(obj) {
	        obj.parent().remove();
	    }
		
		var instructorRenameArr = [];
		function deleteDBPrice(obj){
			var instructorRename = $('#instructorRename').val();
			instructorRenameArr.push(instructorRename);
			var choiceRow = $(obj).parent().parent();
			var nextRow = choiceRow.next(); //nth-child()
			var doubleRow = nextRow.next();
			choiceRow.remove();
			nextRow.remove();
			doubleRow.remove();
            deleteFile($(this));
		}
		
		function instructorDeleteSubmit() {
			$.ajax({
				url : "instructorDeleteSubmit.doa",
				type : "get",
				traditional : true,
				data : {"instructorRenameArr" : instructorRenameArr},
				success : function(result) {
					
				}
			});
		}

	</script>
</body>
</html>