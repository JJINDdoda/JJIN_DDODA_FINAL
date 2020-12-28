<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
</head>
<body>

<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br><br><br>
	<!-- end header -->
	
	
	<!-- content -->	
	<div class="content" style='height:400px;'>
	<h3 align="center">아이디찾기</h3>
	<div class="container" align="center">
	<div class="card bg-light">
	<article class="card-body" style="width: 700px;">
		<form action="IdmailSending.doa" method="post" name="memberInfo">
		
		      <div class="form-row">
		      <div class="col form-group">
	 				<input  class="form-control" style="width:250px;" type="text" name="userName" placeholder="이름을 입력하세요">
	 			</div>
	 			</div>
	 			
	 			<div class="form-group input-group">
	 			<div class="input-group-prepend">
    	              
		              <span class="input-group-text"></span>
		             </div>
	 				<input  style="width:120px;  height:40px;"  type="text" class="form-control" placeholder="이메일 입력" name="emailId">
	 				   <select style="width:130px;  height:40px;" class="form-control" name="emailTag" onkeydown="inputEmailChk();">
	 				     <option value="@gmail.com">@gmail.com</option>
	 				     <option value="@iei.or.kr">@iei.or.kr</option>
	 				     <option value="@naver.com">@naver.com</option>
	 				     <option value="@daum.net">@daum.net</option>
	 				   </select> 
	 				</div>
	 						
	 		
	 		
	 				<!-- 사용불가 id 유효성검사 : validate()가 false면 가입 불가/ true이면 action url로 넘어감 -->
	 				 <!-- <button  onclick="return  validate();">가입하기</button> --> 
	 				 <input style="width:125px; height:37px;" type="submit" class="btn btn-primary btn-xs" value="아이디 찾기"> 
	 				<!-- <button onclick="return validate();">가입하기</button> -->
	 				<button style="width:125px; height:37px;" class="btn btn-info" type="button" onclick="location.href='/';">취소</button>
	 			
	 			
	 		
	</form>
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