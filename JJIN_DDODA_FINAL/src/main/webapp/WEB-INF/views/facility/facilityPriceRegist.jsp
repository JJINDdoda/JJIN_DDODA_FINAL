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
	
	<div class="content" style="height:1200px;">
		<jsp:include page="../common/facilityMenubar.jsp"></jsp:include>
		<div class="main">
			<div class="main-name" style="height: 80px; width: 1200px;">
				<div class="facilityInfo">
					<div class="facilityMenu" onclick="facilityInfoClick()"></div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo">
					<div class="facilityMenu" id="facilityRegistor"></div>
				</div>
				<div class="nextMarker"><img src="../resources/images/facilityMap/nextImg.png" class="nextMarkerImg"></div>
				<div class="facilityInfo" onclick="facilityInstructorClick()">
					<div class="facilityMenu"></div> 
				</div>
				<!-- <div class="facilityInfo"><img src="../resources/images/facilityMap/facilityInstrutor.png" class="facilityImg"></div> -->
			</div>
			<br><br>
			<div class="table-wrap">
				<form id="fileForm" action="facilityPriceRegist.doa" method="post" enctype="multipart/form-data">
					<table class="table" id="facilityTbl">
						<thead>
							<tr>
								<td colspan="5" align="left">
									<a href='#this' onclick="addPrice()">+ 추가하기</a>
								</td>
							</tr>
						</thead>
						<tbody id="tablebody">
							<tr>
								<td>개월수</td>
								<td>
									<input type="text" name="months" placeholder="숫자를 입력해주세요" required>개월
								</td>
								<td>가격</td>
								<td>
									<input type="text" name="price" placeholder="숫자를 입력해주세요" required>원
								</td>
								<td>
									<a href="#this" onclick="deletePrice(this)">- 삭제하기</a>
								</td>
							</tr>
							<tr>
								<td>옵션가격</td>
								<td colspan="4">
									<textarea rows="5" cols="50" name="options" required></textarea>
								</td>
							</tr>
							<tr>
								<td>혜택</td>
								<td colspan="4">
									<textarea rows="5" cols="50" name="benefits" required></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div align="center">
						<input type="submit" value="등록하기" class="insert btn btn-primary"> &nbsp;
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
	<script>

		
		function facilityInfoClick(){
			location.href='facilityInfoRegistView.doa';
		}
		
		function facilityInstructorClick(){
			location.href='facilityInstructorRegistView.doa';
		}
		
		var clickCnt = 1;
		function addPrice(){
			if(clickCnt < 6){
				var str = "<tr><td>개월수</td><td><input type='text' name='months'></td><td>가격</td><td><input type ='text' name = 'price'></td><td><a href='#this' onclick='deletePrice(this)'>- 삭제하기</td></tr>" +
				"<tr><td>옵션가격</td><td colspan='4'><textarea rows='5' cols='50' name='options'></textarea></td></tr>"
				+ "<tr><td>혜택</td><td colspan='4'><textarea rows='5' cols='50' name='benefits'></textarea></td></tr>";
				$('#tablebody').append(str);
				clickCnt++;
				console.log(clickCnt);
			}
			else{
				alert('최대6개 등록 가능합니다.');
			}
			
		}
		
		function deletePrice(obj){
			if(clickCnt > 1){
				clickCnt--;
				var choiceRow = $(obj).parent().parent();
				var nextRow = choiceRow.next(); //nth-child()
				var doubleRow = nextRow.next();
				choiceRow.remove();
				nextRow.remove();
				doubleRow.remove();
			}
			else{
				alert('최소 1개이상 등록 해야합니다.');
			}
		}
		
		
		

	</script>
</body>
</html>