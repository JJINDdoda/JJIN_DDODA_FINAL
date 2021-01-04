<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 칼로리</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">

<style>
	.wrapper{
		height: 800px;
	}
	
	.inputArea{
		margin-left: 300px;
		width: 1300px;
	}
	
	.mealInput{
		float: left;
		border: 1px solid black;
		width: 420px;
		height: 550px;
		margin-left: 8px;
		border-radius: 5px;
	}
	
	/* #totalCalorie{
		margin: auto;
		width: 1000px;
		height:50px;
		margin-top: 50px;
	}
	 */
	#mealCalorie{
		width: 1300px;
		height: 500px;
	}
	
	#breakfastWrapping{
		width: 420px;;
		height: 580px;
		float: left;
		margin-left: 8px;
	}
	
	#breakfastSubmitBtn{
		height: 30px;
		
	}
	
	#breakfastTblDiv{
		width: 420px;
		height: 500px;
	}
	
	#lunchWrapping{
		width: 420px;;
		height: 580px;
		float: left;
		margin-left: 8px;
	}
	
	#lunchSubmitBtn{
		height: 30px;
		
	}
	
	#lunchTblDiv{
		width: 420px;
		height: 500px;
	}
	
	#dinnerWrapping{
		width: 420px;;
		height: 580px;
		float: left;
		margin-left: 8px;
	}
	
	#dinnerSubmitBtn{
		height: 30px;
		
	}
	
	#dinnerTblDiv{
		width: 420px;
		height: 500px;
	}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<br><br>
	<div class="wrapper">
		<div class="menub" style="height:500px; position: fixed;">
			<ul>
				<li><a href="diaryView.doa">일기적성</a></li>
				<li><a href="#">칼로리작성</a></li>
				<li><a href="calendarView.doa">기본정보입력</a></li>
			</ul>
		</div>
		
		<div class="inputArea">
			<div style="font-size: 20pt; margin-bottom: 10px;">칼로리 작성(${changeDate })</div>
			<br>
			<div id="mealCalorie">
			<c:if test="${empty breakFastmyCalorie }">
				<form action="inputBreakFastInfo.doa" method="post" id="breakfastForm">
					<input type="hidden" value="${changeDate }" name="changeDate">
					<input type="hidden" value="아침" name="mealKinds">
					<div id="breakfastWrapping">
						<div id="breakfastCalorie" class="mealInput">
							<div>아침</div>
							<div id="breakfastTblDiv" style="overflow-y: scroll;">
								<table class="" id="breakfastTbl">
									<thead>
										<tr>
											<td colspan="7" align="left">
												<a href='#' onclick="addBreakFastFood()">+ 추가하기</a>
											</td>
										</tr>
									</thead>
									<tbody id="breakfastTblBody">
										<tr>
											<td>음식명</td>
											<td>
												<select name="foodName" id="foodName">
													<option value="none">선택</option>
													<c:forEach items="${foodName }" var="foodName">
														<option value="${foodName }">${foodName }</option>
													</c:forEach>
												</select>
											</td>
											<td>칼로리</td>
											<td>
												<input type="text" name="kcal" id="kcal" value="0" readonly>
											</td>
										</tr>
										<tr>
											<td>음식총량</td>
											<td>
												<input type="text" name="foodAmount" id="foodAmount" value="" onblur="foodCalc(this);" placeholder="숫자를 입력해주세요(g/개)" required>
											</td>
											<td style="width: 30px;">
												<input type="text" value="" name="unit" id="unit" style="width: 30px;" readonly>
											</td>
											<td>
												<a href="#this" onclick="deleteBreakFastFood(this)" id="breakfastRemoveBtn">- 삭제하기</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="breakfastTotal">
								<div>
									총 열량<input type="text" value="0" name="breakfastTotalCalorie" id="breakfastTotalCalorie">
								</div>
							</div> 
						</div>
						<div id="breakfastSubmitBtn">
							<input type="submit" id="breakfastBtn" value="입력하기">
						</div>
					</div>
				</form>
			</c:if>
			<c:if test="${!empty breakFastmyCalorie }">
				<form action="updateBreakFastInfo.doa" method="get" id="breakfastForm">
					<input type="hidden" value="${changeDate }" name="changeDate">
					<input type="hidden" value="${breakfastmydietNo }" name="mydietNo" id="breakfastmydietNo">
					<input type="hidden" value="아침" name="mealKinds">
					<div id="breakfastWrapping">
						<div id="breakfastCalorie" class="mealInput">
							<div>아침</div>
							<div id="breakfastTblDiv" style="overflow-y: scroll;">
								<table class="" id="breakfastTbl">
									<thead>
										<tr>
											<td colspan="7" align="left">
												<a href='#' onclick="addBreakFastFood()">+ 추가하기</a>
											</td>
										</tr>
									</thead>
									<tbody id="breakfastTblBody">
										<c:forEach items="${breakFastmyCalorie }" var="breakFastmyCalorie">
											<tr>
												<td>음식명</td>
												<td>
													<select name="foodName" id="foodName">
														<option value="none">선택</option>
														<c:forEach items="${foodName }" var="foodName">
															<option value="${foodName }"  <c:if test="${foodName eq  breakFastmyCalorie.foodName}">selected</c:if>>${foodName }</option>
														</c:forEach>
													</select>
												</td>
												<td>칼로리</td>
												<td>
													<input type="text" name="kcal" id="kcal" value="${breakFastmyCalorie.kcal }" readonly>
												</td>
											</tr>
											<tr>
												<td>음식총량</td>
												<td>
													<input type="text" name="foodAmount" id="foodAmount" value="${breakFastmyCalorie.foodAmount }" onblur="foodCalc(this);" placeholder="숫자를 입력해주세요(g/개)" required>
												</td>
												<td style="width: 30px;">
													<input type="text" value="${breakFastmyCalorie.unit }" name="unit" id="unit" style="width: 30px;" readonly>
												</td>
												<td>
													<a href="#this" onclick="deleteBreakFastFood(this)" id="breakfastRemoveBtn">- 삭제하기</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div id="breakfastTotal">
								<div>
									총 열량<input type="text" value="${breakfastTotal }" name="breakfastTotalCalorie" id="breakfastTotalCalorie">
								</div>
							</div> 
						</div>
						<div id="breakfastSubmitBtn">
							<input type="submit" id="breakfastBtn" value="수정하기">
							<input type="button" id="breakfastDeleteBtn" value="삭제하기" onclick="return breakfastDelete()">
						</div>
					</div>
				</form>
			</c:if>
			
			<!-- 점심 -->
			<c:if test="${empty lunchmyCalorie }">
				<form action="inputLunchInfo.doa" method="post" id="lunchForm">
					<input type="hidden" value="${changeDate }" name="changeDate">
					<input type="hidden" value="점심" name="mealKinds">
					<div id="lunchWrapping">
						<div id="lunchCalorie" class="mealInput">
							<div>점심</div>
							<div id="lunchTblDiv" style="overflow-y: scroll;">
								<table class="" id="lunchTbl">
									<thead>
										<tr>
											<td colspan="7" align="left">
												<a href='#' onclick="addLunchFood()">+ 추가하기</a>
											</td>
										</tr>
									</thead>
									<tbody id="lunchTblBody">
										<tr>
											<td>음식명</td>
											<td>
												<select name="lunchFoodName" id="lunchFoodName">
													<option value="none">선택</option>
													<c:forEach items="${foodName }" var="foodName">
														<option value="${foodName }">${foodName }</option>
													</c:forEach>
												</select>
											</td>
											<td>칼로리</td>
											<td>
												<input type="text" name="kcal" id="kcal" value="0" readonly>
											</td>
										</tr>
										<tr>
											<td>음식총량</td>
											<td>
												<input type="text" name="foodAmount" id="foodAmount" value="" onblur="foodLunchCalc(this);" placeholder="숫자를 입력해주세요(g/개)" required>
											</td>
											<td style="width: 30px;">
												<input type="text" value="" name="unit" id="unit" style="width: 30px;" readonly>
											</td>
											<td>
												<a href="#this" onclick="deleteLunchFood(this)" id="lunchRemoveBtn">- 삭제하기</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="lunchTotal">
								<div>
									총 열량<input type="text" value="0" name="lunchTotalCalorie" id="lunchTotalCalorie">
								</div>
							</div> 
						</div>
						<div id="lunchSubmitBtn">
							<input type="submit" id="lunchBtn" value="입력하기">
						</div>
					</div>
				</form>
			</c:if>
			<c:if test="${!empty lunchmyCalorie }">
				<form action="updateLunchInfo.doa" method="get" id="lunchForm">
					<input type="hidden" value="${changeDate }" name="changeDate">
					<input type="hidden" value="${lunchmydietNo }" name="mydietNo" id="lunchmydietNo">
					<input type="hidden" value="점심" name="mealKinds">
					<div id="lunchWrapping">
						<div id="lunchCalorie" class="mealInput">
							<div>점심</div>
							<div id="lunchTblDiv" style="overflow-y: scroll;">
								<table class="" id="lunchTbl">
									<thead>
										<tr>
											<td colspan="7" align="left">
												<a href='#' onclick="addLunchFood()">+ 추가하기</a>
											</td>
										</tr>
									</thead>
									<tbody id="lunchTblBody">
										<c:forEach items="${lunchmyCalorie }" var="lunchmyCalorie">
											<tr>
												<td>음식명</td>
												<td>
													<select name="lunchFoodName" id="lunchFoodName">
														<option value="none">선택</option>
														<c:forEach items="${foodName }" var="foodName">
															<option value="${foodName }"  <c:if test="${foodName eq  lunchmyCalorie.foodName}">selected</c:if>>${foodName }</option>
														</c:forEach>
													</select>
												</td>
												<td>칼로리</td>
												<td>
													<input type="text" name="kcal" id="kcal" value="${lunchmyCalorie.kcal }" readonly>
												</td>
											</tr>
											<tr>
												<td>음식총량</td>
												<td>
													<input type="text" name="foodAmount" id="foodAmount" value="${lunchmyCalorie.foodAmount }" onblur="foodLunchCalc(this);" placeholder="숫자를 입력해주세요(g/개)" required>
												</td>
												<td style="width: 30px;">
													<input type="text" value="${lunchmyCalorie.unit }" name="unit" id="unit" style="width: 30px;" readonly>
												</td>
												<td>
													<a href="#this" onclick="deleteLunchFood(this)" id="lunchRemoveBtn">- 삭제하기</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div id="lunchTotal">
								<div>
									총 열량<input type="text" value="${lunchTotal }" name="lunchTotalCalorie" id="lunchTotalCalorie">
								</div>
							</div> 
						</div>
						<div id="lunchSubmitBtn">
							<input type="submit" id="lunchBtn" value="수정하기">
							<input type="button" id="lunchDeleteBtn" value="삭제하기" onclick="return lunchDelete()">
						</div>
					</div>
				</form>
			</c:if>
			
			
			<!-- 저녁 -->
				<c:if test="${empty dinnermyCalorie }">
				<form action="inputDinnerInfo.doa" method="post" id="dinnerForm">
					<input type="hidden" value="${changeDate }" name="changeDate">
					<input type="hidden" value="저녁" name="mealKinds">
					<div id="dinnerWrapping">
						<div id="dinnerCalorie" class="mealInput">
							<div>
								저녁
								<select id="dinnerSelectBox" name="dinnerSelectBox">
									<option value="저녁">저녁</option>
									<option value="야식">야식</option>
								</select>
							</div>
							<div id="dinnerTblDiv" style="overflow-y: scroll;">
								<table class="" id="dinnerTbl">
									<thead>
										<tr>
											<td colspan="7" align="left">
												<a href='#' onclick="addDinnerFood()">+ 추가하기</a>
											</td>
										</tr>
									</thead>
									<tbody id="dinnerTblBody">
										<tr>
											<td>음식명</td>
											<td>
												<select name="dinnerFoodName" id="dinnerFoodName">
													<option value="none">선택</option>
													<c:forEach items="${foodName }" var="foodName">
														<option value="${foodName }">${foodName }</option>
													</c:forEach>
												</select>
											</td>
											<td>칼로리</td>
											<td>
												<input type="text" name="kcal" id="kcal" value="0" readonly>
											</td>
										</tr>
										<tr>
											<td>음식총량</td>
											<td>
												<input type="text" name="foodAmount" id="foodAmount" value="" onblur="foodDinnerCalc(this);" placeholder="숫자를 입력해주세요(g/개)" required>
											</td>
											<td style="width: 30px;">
												<input type="text" value="" name="unit" id="unit" style="width: 30px;" readonly>
											</td>
											<td>
												<a href="#this" onclick="deleteDinnerFood(this)" id="dinnerRemoveBtn">- 삭제하기</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="dinnerTotal">
								<div>
									총 열량<input type="text" value="0" name="dinnerTotalCalorie" id="dinnerTotalCalorie">
								</div>
							</div> 
						</div>
						<div id="dinnerSubmitBtn">
							<input type="submit" id="dinnerBtn" value="입력하기">
						</div>
					</div>
				</form>
			</c:if>
			<c:if test="${!empty dinnermyCalorie }">
				<form action="updateDinnerInfo.doa" method="get" id="dinnerForm">
					<input type="hidden" value="${changeDate }" name="changeDate">
					<input type="hidden" value="${dinnermydietNo }" name="mydietNo" id="dinnermydietNo">
					<input type="hidden" value="저녁" name="mealKinds">
					<div id="dinnerWrapping">
						<div id="dinnerCalorie" class="mealInput">
							<div>
								저녁
								<select id="dinnerSelectBox" name="dinnerSelectBox">
									<option value="저녁">저녁</option>
									<option value="야식">야식</option>
								</select>
							</div>
							<div id="dinnerTblDiv" style="overflow-y: scroll;">
								<table class="" id="dinnerTbl">
									<thead>
										<tr>
											<td colspan="7" align="left">
												<a href='#' onclick="addDinnerFood(this)">+ 추가하기</a>
											</td>
										</tr>
									</thead>
									<tbody id="dinnerTblBody">
										<c:forEach items="${dinnermyCalorie }" var="dinnermyCalorie">
											<tr>
												<td>음식명</td>
												<td>
													<select name="dinnerFoodName" id="dinnerFoodName">
														<option value="none">선택</option>
														<c:forEach items="${foodName }" var="foodName">
															<option value="${foodName }"  <c:if test="${foodName eq  dinnermyCalorie.foodName}">selected</c:if>>${foodName }</option>
														</c:forEach>
													</select>
												</td>
												<td>칼로리</td>
												<td>
													<input type="text" name="kcal" id="kcal" value="${dinnermyCalorie.kcal }" readonly>
												</td>
											</tr>
											<tr>
												<td>음식총량</td>
												<td>
													<input type="text" name="foodAmount" id="foodAmount" value="${dinnermyCalorie.foodAmount }" onblur="foodDinnerCalc(this);" placeholder="숫자를 입력해주세요(g/개)" required>
												</td>
												<td style="width: 30px;">
													<input type="text" value="${dinnermyCalorie.unit }" name="unit" id="unit" style="width: 30px;" readonly>
												</td>
												<td>
													<a href="#this" onclick="deleteDinnerFood(this)" id="dinnerRemoveBtn">- 삭제하기</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div id="dinnerTotal">
								<div>
									총 열량<input type="text" value="${dinnerTotal }" name="dinnerTotalCalorie" id="dinnerTotalCalorie">
								</div>
							</div> 
						</div>
						<div id="dinnerSubmitBtn">
							<input type="submit" id="dinnerBtn" value="수정하기">
							<input type="button" id="dinnerDeleteBtn" value="삭제하기" onclick="return dinnerDelete()">
						</div>
					</div>
				</form>
			</c:if>
			
			
			<div class="table-wrap">
				<table class="table">
					<tr>
						<th>아침</th>
						<th>점심</th>
						<th>저녁</th>
						<th>Total</th>
					</tr>
					<tr>
						<td>${breakfastTotal }</td>
						<td>${lunchTotal }</td>
						<td>${dinnerTotal }</td>
						<td>${breakfastTotal + lunchTotal + dinnerTotal }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	
	<script>
		
		//아침
		var breakfastTotalCalorie = $('#breakfastTotalCalorie').val();
		
		var breakfastClicked = 1;
		//아침 목록 추가
		function addBreakFastFood(obj){
			var str = "<tr><td>음식명</td><td><select name='foodName' id='foodName'><option value='none'>선택</option>"
						+"<c:forEach items='${foodName }' var='foodName'><option>${foodName }</option></c:forEach></select></td>"
						+"<td>칼로리</td><td><input type='text' name='kcal' id='kcal' value='' readonly></td></tr>"
						+"<tr><td>음식총량</td><td><input type='text' name='foodAmount' value='' onblur='foodCalc(this);' placeholder='숫자를 입력해주세요(g/개)' required></td>"
						+"<td style='width: 30px;'><input type='text' value='' name='unit' id='unit' style='width: 30px;' readonly></td>"
						+"<td><a href='#this' onclick='deleteBreakFastFood(this)'>- 삭제하기</a></td></tr>";
						
			$('#breakfastTblBody').append(str);
			breakfastClicked++;
		}
		
		//아침 목록 삭제
		function deleteBreakFastFood(obj){
			if(breakfastClicked > 1){
				var choiceRow = $(obj).parent().parent();
				var prevRow = choiceRow.prev();
				var kcal = $(obj).parent().parent().prev().find("input").val();
				breakfastTotalCalorie -= kcal;
				console.log(breakfastTotalCalorie);
				//console.log(kcal);
				choiceRow.remove();
				prevRow.remove();
				breakfastClicked--;
			}
			else{
				alert('최소 1개이상 등록 해야합니다.');
			}
			$('#breakfastTotalCalorie').val(breakfastTotalCalorie);
			//document.getElementById("breakfastTotalCalorie").value = breakfastTotalCalorie;
			
		}
		
		//아침음식 선택
		var beforeBreakfastVal = 0;
		var beforeBreakfastFoodName = null;
		var foodName;//현재 foodName
		var beforeBreakfastKcal = 0;
		$(document).on("change", "#foodName", function(){
			beforeFoodName = foodName;
			
			foodName = $(this).find(":selected").val();//선택된 값 가져오기
			console.log('foodaNme' + foodName);
			if(beforeBreakfastFoodName == foodName){
				
			}
			else{
				/* alert('dd'); */
				beforeBreakfastVal = $(this).parent().siblings(":last").find("input").val();
				breakfastTotalCalorie -= beforeBreakfastVal;
			}
			
			
			console.log('before' + beforeBreakfastVal);
			var $element = $(this);
			console.log(foodName);
			  $.ajax({
				  type: "get",
				  url: "changeFoodName.doa",
				  data: {"foodName": foodName},
				  async : false,
				  success: function (result) 
				  {
				     console.log(result.kcal);
				     console.log(result.foodAmount);
				     beforeBreakfastKcal = result.kcal;
				     $element.parent().siblings(":last").find("input").val(result.kcal);
				     $element.parent().parent().next().children().siblings(":first").find("input").val(result.foodAmount);
				     $element.parent().parent().next().children().siblings(":last").find("input").val(result.unit);
				    
	        		console.log('breakfastTotalCalorie ' + breakfastTotalCalorie);
				    breakfastTotalCalorie += result.kcal;
				    $('#breakfastTotalCalorie').val(breakfastTotalCalorie);
				  }
			  });
			  
			});
		
		//점심
		var lunchTotalCalorie = $('#lunchTotalCalorie').val();
		
		var lunchClicked = 1;
		//점심 목록 추가
		function addLunchFood(obj){
			var str = "<tr><td>음식명</td><td><select name='lunchFoodName' id='lunchFoodName'><option value='none'>선택</option>"
						+"<c:forEach items='${foodName }' var='foodName'><option>${foodName }</option></c:forEach></select></td>"
						+"<td>칼로리</td><td><input type='text' name='kcal' id='kcal' value='' readonly></td></tr>"
						+"<tr><td>음식총량</td><td><input type='text' name='foodAmount' value='' onblur='foodLunchCalc(this);' placeholder='숫자를 입력해주세요(g/개)' required></td>"
						+"<td style='width: 30px;'><input type='text' value='' name='unit' id='unit' style='width: 30px;' readonly></td>"
						+"<td><a href='#this' onclick='deleteLunchFood(this)'>- 삭제하기</a></td></tr>";
						
			$('#lunchTblBody').append(str);
			lunchClicked++;
			console.log(lunchClicked);
		}
		
		//점심 목록 삭제
		function deleteLunchFood(obj){
			console.log(lunchClicked);
			if(lunchClicked > 1){
				var choiceRow = $(obj).parent().parent();
				var prevRow = choiceRow.prev();
				var kcal = $(obj).parent().parent().prev().find("input").val();
				lunchTotalCalorie -= kcal;
				console.log(lunchTotalCalorie);
				//console.log(kcal);
				choiceRow.remove();
				prevRow.remove();
				lunchClicked--;
			}
			else{
				alert('최소 1개이상 등록 해야합니다.');
			}
			$('#lunchTotalCalorie').val(lunchTotalCalorie);
			//document.getElementById("breakfastTotalCalorie").value = breakfastTotalCalorie;
			
		}
		
		//점심음식 선택
		var beforeLunchVal = 0;
		var beforeLunchFoodName = null;
		var beforeLunchKcal = 0;
		var lunchFoodName;//현재 foodName
		$(document).on("change", "#lunchFoodName", function(){
			beforeLunchFoodName = lunchFoodName;
			
			lunchFoodName = $(this).find(":selected").val();//선택된 값 가져오기
			console.log('foodaNme' + lunchFoodName);
			if(beforeLunchFoodName == lunchFoodName){
				
			}
			else{
				/* alert('dd'); */
				beforeLunchVal = $(this).parent().siblings(":last").find("input").val();
				lunchTotalCalorie -= beforeLunchVal;
			}
			
			
			console.log('before' + beforeLunchVal);
			var $element = $(this);
			console.log(lunchFoodName);
			  $.ajax({
				  type: "get",
				  url: "changeFoodName.doa",
				  data: {"foodName": lunchFoodName},
				  async : false,
				  success: function (result) 
				  {
				     console.log(result.kcal);
				     console.log(result.foodAmount);
				     beforeLunchKcal = result.kcal;
				     $element.parent().siblings(":last").find("input").val(result.kcal);
				     $element.parent().parent().next().children().siblings(":first").find("input").val(result.foodAmount);
				     $element.parent().parent().next().children().siblings(":last").find("input").val(result.unit);
				    
	        		console.log('breakfastTotalCalorie ' + lunchTotalCalorie);
	        		lunchTotalCalorie += result.kcal;
				    $('#lunchTotalCalorie').val(lunchTotalCalorie);
				  }
			  });
			  
			});
		
		
		//저녁
		var dinnerTotalCalorie = $('#dinnerTotalCalorie').val();
		
		var dinnerClicked = 1;
		//저녁 목록 추가
		function addDinnerFood(obj){
			var str = "<tr><td>음식명</td><td><select name='dinnerFoodName' id='dinnerFoodName'><option value='none'>선택</option>"
						+"<c:forEach items='${foodName }' var='foodName'><option>${foodName }</option></c:forEach></select></td>"
						+"<td>칼로리</td><td><input type='text' name='kcal' id='kcal' value='' readonly></td></tr>"
						+"<tr><td>음식총량</td><td><input type='text' name='foodAmount' value='' onblur='foodDinnerCalc(this);' placeholder='숫자를 입력해주세요(g/개)' required></td>"
						+"<td style='width: 30px;'><input type='text' value='' name='unit' id='unit' style='width: 30px;' readonly></td>"
						+"<td><a href='#this' onclick='deleteDinnerFood(this)'>- 삭제하기</a></td></tr>";
						
			$('#dinnerTblBody').append(str);
			dinnerClicked++;
			console.log(dinnerClicked);
		}
		
		//저녁 목록 삭제
		function deleteDinnerFood(obj){
			console.log(dinnerClicked);
			if(dinnerClicked > 1){
				var choiceRow = $(obj).parent().parent();
				var prevRow = choiceRow.prev();
				var kcal = $(obj).parent().parent().prev().find("input").val();
				dinnerTotalCalorie -= kcal;
				console.log(dinnerTotalCalorie);
				//console.log(kcal);
				choiceRow.remove();
				prevRow.remove();
				dinnerClicked--;
			}
			else{
				alert('최소 1개이상 등록 해야합니다.');
			}
			$('#dinnerTotalCalorie').val(dinnerTotalCalorie);
			//document.getElementById("breakfastTotalCalorie").value = breakfastTotalCalorie;
			
		}
		
		//저녁 음식 선택
		var beforeDinnerVal = 0;
		var beforeDinnerFoodName = null;
		var beforeDinnerKcal = 0;
		var dinnerFoodName;//현재 foodName
		$(document).on("change", "#dinnerFoodName", function(){
			beforeDinnerFoodName = dinnerFoodName;
			
			dinnerFoodName = $(this).find(":selected").val();//선택된 값 가져오기
			console.log('foodaNme' + dinnerFoodName);
			if(beforeDinnerFoodName == dinnerFoodName){
				
			}
			else{
				/* alert('dd'); */
				beforeDinnerVal = $(this).parent().siblings(":last").find("input").val();
				dinnerTotalCalorie -= beforeDinnerVal;
			}
			
			
			console.log('before' + beforeDinnerVal);
			var $element = $(this);
			console.log(dinnerFoodName);
			  $.ajax({
				  type: "get",
				  url: "changeFoodName.doa",
				  data: {"foodName": dinnerFoodName},
				  async : false,
				  success: function (result) 
				  {
				     console.log(result.kcal);
				     console.log(result.foodAmount);
				     beforeDinnerKcal = result.kcal;
				     $element.parent().siblings(":last").find("input").val(result.kcal);
				     $element.parent().parent().next().children().siblings(":first").find("input").val(result.foodAmount);
				     $element.parent().parent().next().children().siblings(":last").find("input").val(result.unit);
				    
	        		console.log('dinnerTotalCalorie ' + dinnerTotalCalorie);
	        		dinnerTotalCalorie += result.kcal;
				    $('#dinnerTotalCalorie').val(dinnerTotalCalorie);
				  }
			  });
			  
			});
		
				
		//아침 음식양 변경
		//var temp = 0;
		function foodCalc(obj) {
			var foodAmount = $(obj).val();
			var kcal = $(obj).parent().parent().prev().find("input");
			var unit = $(obj).parent().next().find("input");
			breakfastTotalCalorie -= parseInt(kcal.val());
			console.log(kcal);
			console.log(foodAmount);
			if(unit.val() == '개'){
				kcal.val(foodAmount * beforeBreakfastKcal);
			}else if(unit.val() == 'g') {
				kcal.val(foodAmount/100 * beforeBreakfastKcal);
			}
			breakfastTotalCalorie += parseInt(kcal.val());
			$('#breakfastTotalCalorie').val(breakfastTotalCalorie);
		};
		
		//점심 음식양 변경
		//var lunchTemp = 0;
		function foodLunchCalc(obj){
			var foodAmount = $(obj).val();
			var kcal = $(obj).parent().parent().prev().find("input");
			var unit = $(obj).parent().next().find("input");
			lunchTotalCalorie -= parseInt(kcal.val());
			console.log(kcal);
			console.log(foodAmount);
			if(unit.val() == '개'){
				kcal.val(foodAmount * beforeLunchKcal);
			}else if(unit.val() == 'g') {
				kcal.val(foodAmount/100 * beforeLunchKcal);
			}
			lunchTotalCalorie += parseInt(kcal.val());
			$('#lunchTotalCalorie').val(lunchTotalCalorie);
		}
		
		//저녁 음식양 변경
		//var lunchTemp = 0;
		function foodDinnerCalc(obj){
			var foodAmount = $(obj).val();
			var kcal = $(obj).parent().parent().prev().find("input");
			var unit = $(obj).parent().next().find("input");
			dinnerTotalCalorie -= parseInt(kcal.val());
			console.log(kcal);
			console.log(foodAmount);
			if(unit.val() == '개'){
				kcal.val(foodAmount * beforeDinnerKcal);
			}else if(unit.val() == 'g') {
				kcal.val(foodAmount/100 * beforeDinnerKcal);
			}
			dinnerTotalCalorie += parseInt(kcal.val());
			$('#dinnerTotalCalorie').val(dinnerTotalCalorie);
		}

		//아침 삭제
		function breakfastDelete(){
			var deleteConfirm = confirm('정말 삭제하시겠습니까?');
			if(deleteConfirm){
				var breakfastmydietNo = $('#breakfastmydietNo').val();
				location.href='deleteMyDietInfo.doa?breakfastmydietNo='+breakfastmydietNo;//삭제로직으로 이동
			}
			else{
				return false;
			}
		}
		
		//점심 삭제
		function lunchDelete(){
			var deleteConfirm = confirm('정말 삭제하시겠습니까?');
			if(deleteConfirm){
				var lunchmydietNo = $('#lunchmydietNo').val();
				console.log(lunchmydietNo);
				location.href='deleteLunchMyDietInfo.doa?lunchmydietNo='+lunchmydietNo;//삭제로직으로 이동
			}
			else{
				return false;
			}
		}
		
		//저녁 삭제
		function dinnerDelete(){
			var deleteConfirm = confirm('정말 삭제하시겠습니까?');
			if(deleteConfirm){
				var dinnermydietNo = $('#dinnermydietNo').val();
				location.href='deleteDinnerMyDietInfo.doa?dinnermydietNo='+dinnermydietNo;//삭제로직으로 이동
			}
			else{
				return false;
			}
		}
		
		$(document).on("change", "#dinnerSelectBox", function(){
			var dinnerSelectBox = $('#dinnerSelectBox').val();
			if(dinnerSelectBox == '야식'){
				var answer = confirm('제정신입니까? 휴먼');
				if(answer){
					alert('탈퇴하기로 이동합니다.');
					location.href='deleteMember.doa';
				}
				else{
					
				}
			}
		});
		
	</script>
</body>
</html>