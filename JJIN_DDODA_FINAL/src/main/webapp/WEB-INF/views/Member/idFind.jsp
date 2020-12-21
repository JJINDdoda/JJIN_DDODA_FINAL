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
	<br><br><br><br>
	<!-- end header -->
	
	
	<!-- content -->	
	<div class="content">
	<h3 align="center">회원가입</h3>
	<div class="centerText" align="center">
		<form action="findId.doa" method="post" name="memberInfo">
		<table width="650" cellspacing="5">
		        <tr>
	 				<td>이름</td>
	 				<td><input type="text" name="userName" placeholder="이름을 입력하세요"></td>
	 			</tr>	 		
	 			 			
	 			<tr>
	 				<td>이메일</td>
	 				<td><input type="text" placeholder="이메일" name="emailId">@
	 				   <select name="emailTag" onkeydown="inputEmailChk();">
	 				     <option value="@google.com">google.com</option>
	 				     <option value="@iei.or.kr">iei.or.kr</option>
	 				     <option value="@naver.com">naver.com</option>
	 				     <option value="@daum.net">daum.net</option>
	 				   </select> <a> Example) mail2im@ google.com</a>
	 				
	 				</td>
	 				
	 			</tr>
	 							
	 		
	 			<tr>
	 				<td colspan="2" align="center">
	 				<!-- 사용불가 id 유효성검사 : validate()가 false면 가입 불가/ true이면 action url로 넘어감 -->
	 				 <!-- <button  onclick="return  validate();">가입하기</button> --> 
	 				 <input type="submit" class="" value="아이디 찾기"> 
	 				<!-- <button onclick="return validate();">가입하기</button> -->
	 				<button type="button" onclick="location.href='home.doa';">취소</button></td>
	 			
	 			</tr>
	 		</table>
	</form>
	</div>
	</div>
	
	
		<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->


</body>
</html>