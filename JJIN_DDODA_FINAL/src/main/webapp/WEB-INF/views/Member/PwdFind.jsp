<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
</head>
<body>

<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	
	<!-- content -->	
	<div class="content">
	<h3 align="center">비밀번호 찾기</h3>
	<div class="centerText" align="center">
		<form action="mailSending.doa" method="post" name="memberInfo">
		<table width="550" cellspacing="5">
		        <tr>
	 				<td>아이디</td>
	 				<td><input type="text" name="userId" placeholder="아이디를 입력하세요"></td>
	 			</tr>	 		
	 			 			
	 			<tr>
	 				<td>이메일</td>
	 				<td><input type="text" placeholder="이메일" name="emailId" placeholder="@빼고 입력">
	 				   <select name="emailTag" onkeydown="inputEmailChk();">
	 				     <option value="@gmail.com">@gmail.com</option>
	 				     <option value="@iei.or.kr">@iei.or.kr</option>
	 				     <option value="@naver.com">@naver.com</option>
	 				     <option value="@daum.net">@daum.net</option>
	 				   </select> 
	 				
	 				</td>
	 				
	 			</tr>
	 							
	 		
	 			<tr>
	 				<td colspan="2" align="center">
	 				<!-- 사용불가 id 유효성검사 : validate()가 false면 가입 불가/ true이면 action url로 넘어감 -->
	 				 <!-- <button  onclick="return  validate();">가입하기</button> --> 
	 				 <input type="submit" class="" value="비밀번호 찾기"> 
	 				<!-- <button onclick="return validate();">가입하기</button> -->
	 				<button type="button" onclick="location.href='/';">취소</button></td>
	 			
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