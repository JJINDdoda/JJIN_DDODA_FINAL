<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>게시글 상세보기</title>
</head>
<body>
	<%-- ${nList.sNoticeTitle } --%>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<br><br><br><br>
	<!-- end header -->

	<!-- content -->
	<div class="content">
	<jsp:include page="/WEB-INF/views/common/admin_menubar.jsp"/>
	<div class="main">
		<input type="hidden" name="mateNo" id="mateNo" value="${mate.mateNo }">
		<div class="table-wrap2">
		    <table align="center" cellpadding="10" cellspacing="0" border="1" width="500" class="table">
		        <tr align="center" valign="middle">
		            <td>제목</td>
		            <td>${mate.mateTitle }</td>
		            <td>요청자</td>
		            <td>${mate.userId }</td>
		        </tr>
		        <tr>
		            <td colspan="4">
		            	<c:forEach items="${mList }" var="mymate">
		            		${mymate.userId }
		            	</c:forEach>
		            </td>
		        </tr>
		        <tr>
		            <td colspan="2"></td>
		            <td colspan="2"><button type="submit" style="float: right" id="submit">오픈</button></td>
		        </tr>
		    </table>
		</div>
		<button onclick="location.href='adminChatList.doa';" class="insert btn btn-primary" style="float: right;">목록으로</button>
		</div>
		</div>
	<!-- end content -->
		
		<script>
			$(function() {
				$("#submit").on("click", function() {
					var mateNo = $("#mateNo").val();
					
					$.ajax({
						url : "adminChatSuccess.doa",
						type : "post",
						data : {
									"mateNo" : mateNo
								},
						success : function(data) {
							alert("채팅이 오픈되었습니다");
							redirect:"adminChatList.doa";
						},
						error : function(data) {
							alert("채팅 오픈 실패했습니다");
							redirect:"adminChatList.doa";
						}
					});
				});
			});
		</script>
		
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- end footer -->
</body>
</html>