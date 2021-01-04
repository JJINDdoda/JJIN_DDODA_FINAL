<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설관리</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.table-wrap{
		
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="content" style="height:1000px;">
		<jsp:include page="../common/admin_menubar.jsp"></jsp:include>
		<br><br>
		<div class="main">
			<div id="search" align="right">
				<form action="termsYnSearch.doa" method="get">
					<label><input type="checkbox" value="Y" id="approved" name="termsYn" <c:if test="${termsYn eq 'Y' || termsYn eq 'D'}">checked</c:if>>승인</label>
					<label><input type="checkbox" value="N" id="waiting" name="termsYn" <c:if test="${termsYn eq 'N' || termsYn eq 'D'}">checked</c:if>>대기</label>
					<input type="text" placeholder="검색할 아이디를 입력하세요." name="userId" id="userId" value="${userId }">
					<input type="submit" value="검색" onclick="return termsYnSearch()">
				</form>
			</div>
			<br>
			<div id="facilityTbl" class="table-wrap">
				<table class="table">
					<thead>
						<tr style="font-size: 15px">
							<th>시설명</th>
							<th>분야</th>
							<th>시설주소</th>
							<th>승인여부</th>
							<th>승인/거절/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty exerciseFacility }">
							<tr>
								<td>등록된 시설정보가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${exerciseFacility }" var="exerciseFacility">
							<tr>
								<td>${exerciseFacility.facilityName }</td>
								<td>${exerciseFacility.facilityField }</td>
								<td>${exerciseFacility.facilityAddr }</td>
								<td>${exerciseFacility.termsYn }</td>
								<td>
									<c:if test="${exerciseFacility.termsYn eq 'Y' || exerciseFacility.termsYn eq 'R'}">
										<input type="hidden" value="${exerciseFacility.facilityNo }" name="facilityNo" id="facilityNo">
										<input type="button" value="삭제" onclick="deleteClick(this)">
									</c:if>
									<c:if test="${exerciseFacility.termsYn eq 'N'}">
										<input type="hidden" value="${exerciseFacility.facilityNo }" name="facilityNo" id="facilityNo">
										<input type="button" value="승인" onclick="approvedClick(this)">
										<input type="button" value="거절" onclick="rejectClick(this)">
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					
					<tr align="center" height="20">
						<td colspan="6">
							<!-- 이전 -->
							<c:if test="${pi.currentPage <= 1 }">
								[이전]&nbsp;
							</c:if>
							<c:if test="${pi.currentPage > 1 }">
								<c:url var="before" value="adminFacilityManage.doa">
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
								<c:url var="pagination" value="adminFacilityManage.doa">
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
								<c:url var="after" value="adminFacilityManage.doa">
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
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
	
		function termsYnSearch(){ // 검색버튼 눌렀을 때
            var check_count = $("input[name='termsYn']:checked").length;
            console.log(check_count);
            if(check_count < 1){
            	alert("하나이상의 조건을 선택해주세요.");
            	return false;
            }
            else{
            	return true;
            }
		}
		
		
		//승인(update)
		function approvedClick(obj){
			var facilityNo = $(obj).siblings()[0].value;
			console.log(facilityNo);
			location.href="approvedClick.doa?facilityNo="+facilityNo;
			
			
		}
		
		//거절(update)
		function rejectClick(obj){
			var facilityNo = $(obj).siblings()[0].value;
			var userId = $('#userId').val();
			console.log(facilityNo);
			location.href="rejectClick.doa?facilityNo=" + facilityNo;
			
		}
		
		//삭제(delete)
		function deleteClick(obj){
			var facilityNo = $(obj).siblings()[0].value;
			console.log(facilityNo);
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