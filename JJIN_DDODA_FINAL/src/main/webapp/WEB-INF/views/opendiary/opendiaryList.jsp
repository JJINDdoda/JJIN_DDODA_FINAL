<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유일기 게시판 리스트</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<!-- <style>
	.content {height :300px;}
	.menub {
	background: pink; width:10%; height:100%; float:left; text-align:center;
	margin-left : 5%; margin-right : 5%;
	}
	.main {width:75%; float:left;}
	.menub li, table {color : black;}
</style> -->
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
			<li><a href="mateList.doa">메이트 커뮤니티</a></li>
			<li><a href="opendiaryList.doa">일기 공유 게시판</a></li>
		</ul>
	</div>
	<div class="main">
		<div class="main-name">
			<h2 class="main-name-h2">일기 공유 게시판</h2>
		</div>
		<div class="table-wrap">
		<table align="center" width="100%" border="1" cellspacing="0" style="clear:right;"
			class="table">
			
			<c:if test="${ empty opendiaryList }">
				<tr><td colspan="5" align="center">게시글이 없습니다</td></tr>
			</c:if>
			<c:forEach items="${opendiaryList }" var="odList">
				<tr>
					<td><img src="/resources/opendiaryUploadFiles/${opendairy.userId }/${diaryImg.imgRenamePath}"></td>
					<td>${odList.opendiaryTitle }</td>
					<td>${odList.userId }</td>
					<td>${odList.opendiaryDate }</td>
				</tr>
			</c:forEach>
		</table>
		</div>	
		<br><br>
		<div id="searchArea" align="center">
			<form action="openDiarySearch.doa" method="get">
			<select id="searchCondition" name="searchCondition">
				<option value="all" >전체</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchValue" value="#">
			<input type="submit" value="검색">
			<input type="checkbox" name="existFile">
			</form>		
		</div>
		<c:if test="${ !empty sessionScope.loginUser}">
				<button align="center" onclick="openInsertView()">글쓰기</button>
		</c:if>
		</div>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<script>
		//로그인하지 않은 경우 공유일기 작성 불가
		function openInsertView() {
			location.href="openInsertView.doa";
		}
	</script>
</body>
</html>