<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.card {position:relative;display:flex;flex-direction:column;min-width:0;word-wrap:break-word;background-color:#fff;background-clip:border-box;border:1px solid rgba(0,0,0,.125);border-radius:.25rem;}
	.text-dark {color:#212529!important}
	.bg-light {background-color:#f8f9fa!important}
	.mb-3 {margin-bottom:1rem!important}
	.card-header {padding:.5rem 1rem;margin-bottom:0;background-color:rgba(0,0,0,.03);border-bottom:1px solid rgba(0,0,0,.125)}
	.card-body {flex:1 1 auto;padding:1rem 1rem}
	.card-title {margin-bottom:.5rem}
	.card-text:last-child{margin-bottom:0}
	/*Button*/
	.btn{
	    -webkit-transition: all 0.6s;
	    transition: all 0.6s;
	    font-size:14px;
	    font-weight: 600;
	    border:1px solid;
	}
	.btn-primary{
	    color: #fff;
	    background-color: #f7bf99;
	    border:1px solid;
	    border-color: #f7bf99;
	}
	.btn-primary:hover{
	    background-color: #f6f6f6;
	    border-color: #f6f6f6;
	    color:#f6ac79;
	}
	.btn-default{
	    color: #fff;
	    background-color: transparent;
	    border:1px solid;
	    border-color: #b6b6b6;
	}
	.btn-default:hover{
	    color: #fff;
	    background-color: #00a885;
	    border-color: #00a885;
	}
	input,textarea {border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
</style>
<title>게시글 상세보기</title>
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
				<li class="dropdowns"><a href="#">커뮤니티</a>
					<ul class="dropdown-contents" style="text-align: center;">
						<li><a href="#">요청사항</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">채팅</a></li>
					</ul>
				</li>
				<li><a href="#">운동시설</a></li>
				<li><a href="#">음식칼로리</a></li>
				<li class="dropdowns"><a href="#">회원관리</a>
					<ul class="dropdown-contents" style="text-align: center;">
						<li><a href="#">상세보기</a></li>
						<li><a href="#">탈퇴결정</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		<form action="adminRequireUpdate.doa" method="post">
			<input type="hidden" name="requireNo" value="${require.requireNo }">
			<!-- 사용자 -->
			<div style="width:450px; height:530px; border:1px solid red; float:left; margin-right:30px;">
				<div class="card text-dark bg-light mb-3" style="width: 100%; height: 100%;">
				  <div class="card-header">제목 : <input type="text" name="requireTitle" value="${require.requireTitle }"></div>
				  <div class="card-header">작성자 : ${require.userId }</div>
				  <div class="card-body">
				    <h5 class="card-title"><textarea style="width: 100%; height: 100%;" name="requireContents">${require.requireContents }</textarea></h5>
				  </div>
				</div>
			</div>
			<!-- 관리자 -->
			<div style="width:450px; height:530px; border:1px solid green; float:left;">
				<div class="card text-dark bg-light mb-3" style="width: 100%; height: 100%;">
				  <div class="card-header">제목 : 
				  	<c:if test="${!empty reply.rComTitle }">
				  		<input type="text" name="rComTitle" value="${reply.rComTitle }">
				  	</c:if>
				  </div>
				  <div class="card-header">작성자 : ${loginUser.userId }</div>
				  <div class="card-body">
				  	<c:if test="${!empty reply.rComContents }">
				  		<h5 class="card-title"><textarea style="width: 100%; height: 100%;" name="rComContents">${reply.rComContents }</textarea></h5>
				  	</c:if>
				  </div>
				</div>
			</div>
			<button type="submit" class="insert btn btn-primary" style="float: right; margin-top: 20px; margin-right: 35px;">수정하기</button>
			<a onclick="location.href='adminRequireList.doa';" class="insert btn btn-primary" style="float: right; margin-top: 20px; margin-right: 35px;">목록으로</a>
		</form>
	</div>
	<!-- end content -->
	
	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- end footer -->
</body>
</html>