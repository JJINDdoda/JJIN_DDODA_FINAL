<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이일기 보기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
</head>
<body>
<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<!-- content -->
	<div class="content" style="height:800px;">
	<div class="menub" style="">
		<ul>
			<li><a href="mateList.doa">메이트 커뮤니티</a></li>
			<li><a href="opendiaryList.doa">공유일기 게시판</a></li>
		</ul>
	</div>
	<div class="main" style="height:600px;">
		<div class="main-name">
			<h2 class="main-name-h2">마이일기 보기</h2>
		</div>
		<div class="table-wrap">
			<input type="hidden" id="opendiaryNo" value="${opendiary.opendiaryNo }">
			<input type="hidden" id="sessionId" value="${loginUser.userId }">
			<table align="center" cellpadding="10" cellspacing="0" border="1" width="500" class="table">
				<tr >
				<td style="width:300px;height:310px;"rowspan="4">
					<div>
					<!-- <div class="containimg"> -->
						<div class="imgSlide-container">
						<div class="imgSlides sub">
							<c:forEach items="${diaryImg }" var="diaryImg" varStatus="status">
							<!--  class="panel-img" --> 
								<img class="main_slideImg" src="/resources/opendiaryUploadFiles/${diaryImg.userId }/${diaryImg.opendiaryNo}/${diaryImg.imgRenamePath}">
							
							</c:forEach>
						</div>
					<!-- </div> -->
							<a class="prevv"> &#10094;</a>
							<a class="nextt"> &#10095;</a>
						</div>
					</div>
				</td>
				</tr>
				<tr>
					<td height="20">제목</td>
					<td>${opendiary.opendiaryTitle }</td>
					
				</tr>
				<tr>
					<td colspan="2" height="20">${opendiary.opendiaryDate }</td>
				</tr>
				<tr>
					<td colspan="2">${opendiary.opendiaryContents }</td>
				</tr>
			</table>
		</div>
		<div>
			<c:url var="myDiaryDelete" value="myDiaryDelete.doa">
				<c:param name="opendiaryNo" value="${ opendiary.opendiaryNo }"></c:param>
			</c:url>
			<c:url var="myDiaryModify" value="myDiaryModifyView.doa">
				<c:param name="opendiaryNo" value="${ opendiary.opendiaryNo }"></c:param>
			</c:url>
			<c:url var="calendarView" value="calendarView.doa">
			</c:url>
			<c:if test="${ loginUser.userId eq opendiary.userId }">
				<button type="button" onclick="location.href='${myDiaryModify}'">수정하기</button>
				<button type="button" onclick="askquestion()">삭제하기</button>
			</c:if>
			<button type="button" onclick="location.href='${calendarView}'">달력화면</button>
		</div>
	
	</div>
	</div>
	<!-- end content -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script>
	var opendiaryNo = $('#opendiaryNo').val();
	function askquestion() {
		var ask = confirm("일기를 삭제할 경우, 이전 날짜에 대한 일기를 다시 기록할 수 없습니다.\n그래도 삭제하시겠습니까?");
		if(ask){
			location.href="myDiaryDelete.doa?opendiaryNo="+opendiaryNo;
			return true;
		}else {
			return false;
		}
	}
	</script>
</body>
</html>