<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 시설정보 조회</title>
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
	
	
	textarea{
		width:100%;
		resize:none;
		background:#f6f6f6;
		border:none;
	}
	
	
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="content" style="height:1000px;">
		<div class="menub" style="height:500px; position: fixed;">
			<ul>
				<li><a href="facilityListView.doa">시설정보</a></li>
				<li><a href="facilityRegistrationView.doa">시설등록</a></li>
			</ul>
		</div>
		<div class="main" style="margin-left: 180px;">
			<div class="main-name" style="height: 80px; width: 1200px;">
				<div id="modifyWrapper" class="table-wrap">
					<table class="table" id="facilityTbl">
						<tr align="center">
							<th>시설 상호명</th>
							<th>운동분야</th>
							<th>승인여부</th>
							<th>수정 / 조회</th>
							<th>삭제</th>
						</tr>
						<c:if test="${empty exerciseFacility }">
							<tr>
								<td colspan="5">등록된 시설정보가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${exerciseFacility }" var="exerciseFacility">
							
							<tr>
								<td>${exerciseFacility.facilityName }</td>
								<td>${exerciseFacility.facilityField }</td>
								<td>
									<c:if test="${exerciseFacility.termsYn eq 'Y'}">
										<span>승인완료</span>
									</c:if>
									<c:if test="${exerciseFacility.termsYn eq 'N'}">
										<span>승인대기</span>
									</c:if>
								</td>
								<td>
									<input type="button" value="수정하기" style="width: 100px;" onclick="location.href='facilityInfoModifyView.doa?facilityNo='+${exerciseFacility.facilityNo}">
									<input type="button" value="조회하기" style="width: 100px;" onclick="location.href='facilityDetail.doa?facilityNo='+${exerciseFacility.facilityNo}">
								</td>
								<td>
									<input type="hidden" value="${exerciseFacility.facilityNo }" name="facilityNo" id = "facilityNo">
									<input type="button" value="삭제하기" style="width: 100px;" onclick="deleteMyFacility(this)">
								</td>
							</tr>
						</c:forEach>
						
						<!-- 페이징 처리 -->
						<tr align="center" height="20">
							<td colspan="6">
								<!-- 이전 -->
								<c:if test="${pi.currentPage <= 1 }">
									[이전]&nbsp;
								</c:if>
								<c:if test="${pi.currentPage > 1 }">
									<c:url var="before" value="myfacilityList.doa">
										<!-- name값을 page로 하는 이유는 BoardController에서 RequestParam의 value값이 page이기 때문이다.  -->
										<c:param name="page" value="${pi.currentPage -1 }"></c:param>
									</c:url>
									<!-- boardList.kh?page=${pi.currentPage - 1} -->
									<a href="${before }">[이전]</a>&nbsp;
								</c:if>
								<!-- 페이지 -->
								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<c:if test="${p eq pi.currentPage }">
										<font color="red" size="4">[${p }]</font>
									</c:if>
									<c:url var="pagination" value="myfacilityList.doa">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<c:if test="${p ne pi.currentPage }">
										<a href="${pagination }">${p }</a>&nbsp;
									</c:if>
								</c:forEach>
								<!-- 다음 -->
								<c:if test="${pi.currentPage >= pi.maxPage }">
									[다음]
								</c:if>
								<c:if test="${pi.currentPage < pi.maxPage }">
									<c:url var="after" value="myfacilityList.doa">
										<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
									</c:url>
									<a href="${after }">[다음]</a>
								</c:if>
								
							</td>
						</tr>
					</table>
					
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
		function deleteMyFacility(obj){
			var facilityNo = $(obj).siblings()[0].value;
			var deleteFacility = confirm('시설을 삭제하시겠습니까?');
			if(deleteFacility == true){
				$.ajax({
					url : "deleteMyFacility.doa",
					type : "get",
					async : false,
					data : {"facilityNo" : facilityNo},
					success : function(result){
						if(result != 0){
							$(obj).parent().parent().remove();
						}
					}
				});
			}
		}
	</script>
</body>
</html>