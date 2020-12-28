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
		<jsp:include page="../common/facilityMenubar.jsp"></jsp:include>
		<div class="main">
			<div class="main-name" style="height: 80px; width: 1200px;">
				<!-- <img src="../resources/images/facilityMap/facilityRegistor.png" class="facilityImg"> -->
				<div class="facilityInfo">
					<div class="facilityMenu"id="facilityRegistor" style="font-size: 20px; text-align: center; line-height: 80px;">시설정보입력</div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityPriceClick()">
					<div class="facilityMenu" style="font-size: 20px; text-align: center; line-height: 80px;">시설가격입력</div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityInstructorClick()">
					<div class="facilityMenu" style="font-size: 20px; text-align: center; line-height: 80px;">강사정보입력</div>
				</div>
			</div>
			<br><br>
			<div class="table-wrap">
				<form action="facilityModify.doa" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${facilityNo }" name="facilityNo" id="facilityNo">
					<table class="table" id="facilityTbl">
						<tr>
							<td>시설명</td>
							<td>
								<input type="text" name="facilityName" value="${exerciseFaciliy.facilityName }" style="width: 800px;" required>
							</td>
							<td style="width: 100px;">시설종류</td>
							<td>
								<select name="facilityField" style="width: 200px; height: 25px; font-size: 12pt;" required>
									<option value="health" <c:if test="${exerciseFaciliy.facilityField eq 'health' }">selected</c:if>>헬스장</option>
									<option value="yoga" <c:if test="${exerciseFaciliy.facilityField eq 'yoga' }">selected</c:if>>요가</option>
									<option value="fila" <c:if test="${exerciseFaciliy.facilityField eq 'fila' }">selected</c:if>>필라테스</option>
								</select>
							</td>
						</tr>
								
						<tr>
							<td>시설주소</td>
							<td colspan="4">
								<c:forTokens items="${exerciseFaciliy.facilityAddr }" delims="," var="address" varStatus="status">
									<c:if test="${status.index eq 0 }">
										<input type="text" id="sample5_address" placeholder="주소" name="addr" value="${address }" style="width:600px;" readonly>
									</c:if>
									<c:if test="${status.index eq 1 }">
										<input type="text" id="detailAddr" placeholder="상세주소" name="detailAddr" value="${address }" style="width:500px;" required>
									</c:if>
								</c:forTokens>
								<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="width:100px;"><br>
								<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
								<input type="hidden" value="" id="latiLong" name="latiLong">
							</td>
						</tr>
						<tr>
							<td>시설상세정보</td>
							<td colspan="4">
								<textarea cols="50" rows="7" name="facilityKinds" required>${exerciseFaciliy.facilityKinds }</textarea>
							</td>
						</tr>
						<tr>
							<td>블로그 / 카페</td>
							<td colspan="4">
								<input type="text" name="facilityBlog" value="${exerciseFaciliy.facilityBlog }">
							</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td colspan="4">
								<input type="text" name="facilityPhone" value="${exerciseFaciliy.facilityPhone }" required>
							</td>
						</tr>
						<tr>
							<td>이용약관</td>
							<td colspan="4">
								<textarea rows="5" cols="50" name="termsOfUse">${exerciseFaciliy.termsOfUse }</textarea>
							</td>
						</tr>
						<tr>
							<td rowspan="6">시설사진</td>
							<td colspan="4">
								<a href="#this" onclick="addFile()">파일추가</a><br>
								<span>시설사진등록순서대로 첨부해주세요.</span>
							</td>
						 </tr>
						 <c:forEach items="${facilityPicture }" var="facilityPicture" varStatus="status">
						 	<tr>
							 	<td style="width: 500px">
							 		<%-- <input type="file" name="picturePath" style="width:500px; float: left"> --%>
							 		<c:if test="${!empty facilityPicture.pictureRename }">
										<a href="./resources/facilityFiles/facilityPicture/${facilityPicture.pictureRename}" style="float: left;" download>${facilityPicture.picturePath }</a>
										<input type="hidden" value="${facilityPicture.pictureRename}" id="deleteFileRename">
										<input type="hidden" value="${status.index }" id="deleteNumber">
									</c:if>
							 	</td>
							 	<td colspan="3">
							 		<a href='#this' onclick='uploadfiledelete(this)' style="width: 100px; float: left; line-height: 25px;">- 삭제</a>
							 	</td>
							 </tr>
						 </c:forEach>
						 
						
					</table>
					<div align="center">
						<input type="submit" value="등록하기" class="insert btn btn-primary" onclick="return fildDeleteSubmit()"> &nbsp;
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
		function facilityPriceClick(){
			location.href='facilityPriceRegistView.doa';
		}
		
		function facilityInstructorClick(){
			location.href='facilityInstructorRegistView.doa';
		}
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                        var location = result.y + ', ' + result.x;
	                        console.log(location);
	                        $("#latiLong").val(location);
	                    }
	                });
	            }
	        }).open();
	    }
	    
	    var clicked = ${pictureNum};
	    console.log(clicked);
	    
	    function addFile(){
	    	if(clicked < 5){
	    		var str = "<tr><td style='width: 500px'><input type='file' name='picturePath' style='width:500px; float: left'></td>" + 
					"<td colspan='3'><a href='#this' onclick='filedelete(this)' style='width: 100px; float: left; line-height: 25px;'>- 삭제</a></td></tr>";
				$('#facilityTbl').append(str);
				clicked++;
	    	}
	    	else{
	    		alert('최대5개 등록 가능합니다.');
	    	}
	    	
	    }
	    
	    function filedelete(obj){ // 삭제버튼 눌렀을때
	    	if(clicked > 1){
	    		var choiceRow = $(obj).parent().parent();
				choiceRow.remove();
	            deleteFile($(this));
	            clicked--;
	    	}
	    	else{
	    		alert('최소 1개이상 등록 해야합니다.');
	    	}
	    }

	    
	    function deleteFile(obj) {
	        obj.parent().remove();
	    }
	    
	    function uploadfiledelete(obj){ // 삭제버튼 눌렀을때
	    	if(clicked > 1){
	    		fileDeleteLogic();
	    		var choiceRow = $(obj).parent().parent();
				choiceRow.remove();
	            deleteFile($(this));
	            clicked--;
	    	}
	    	else{
	    		alert('최소 1개이상 등록 해야합니다.');
	    	}
	    }
	    
	   
	    var pictureFiles = [];
	    function fileDeleteLogic(){ //hidden값 가져오기
	    	var pictureRename = $('#deleteFileRename').val();//삭제버튼을 누른 파일이름
	    	console.log(pictureRename);
	    	//선택한 파일 삭제 -> ajax말고 다른거로 해야될듯
	    	//배열에 담아서 submit했을 때 한번에 전송해야될듯
	    	pictureFiles.push(pictureRename);
	    	
	    }
	    
	    function fildDeleteSubmit(){
	    	console.log(pictureFiles);
	    	$.ajax({
	    		url : "deleteSelectFile.doa",
	    		type : "get",
	    		traditional : true,
	    		data : {"pictureFiles" : pictureFiles},
	    		success : function(data){
	    			return true;
	    		}
	    	});
	    }



	</script>
</body>
</html>