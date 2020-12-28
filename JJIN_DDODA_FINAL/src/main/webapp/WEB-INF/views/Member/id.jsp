<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다 아이디 졸 너의  합니다 려 감사 이용해 요 </title>
</head>
<body>


<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br><br><br>
	<!-- end header -->
		<!-- content -->	
	<div class="content">
	
	
	<div class="container" align="center" style="height:300px;">
	<h3>아이디 찾기 </h3>
	
	<div class="card bg-light">
	<article class="card-body" style="width: 700px;">
	
	 <div class="form-row">
		      <div class="col form-group">
	 				<input class="form-control" style="width:250px;"  type="text" value="회원님의 아이디는 '${memberd.userId }' 입니다.">
	 			</div>
	 			</div>
	 			
	
	<button style="width:250px; height:37px;" class="btn btn-info" type="button" onclick="location.href='/';">메인페이지로</button>
	
	</article>
	</div>
	</div>
	</div>
		<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
</body>
</html>