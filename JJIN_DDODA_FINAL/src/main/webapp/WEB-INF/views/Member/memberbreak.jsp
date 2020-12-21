<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 </title>

<style>
 form {
 height:150px;
 }
 .content {height : 500px;}
</style>
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
			<li><a href="myInfo.doa">내 정보 수정</a></li>
			<li><a href="#">내가 쓴 글</a></li>
			<li><a href="deleteMember.doa">탈퇴하기</a></li>
		</ul>
	</div>
	
	
		<div class="centerText">
		 <div class="col-lg-12" >
		 <h4 align="center">탈퇴 동의 </h4>
		 <div class="panel-body" style="border: 1px solid #ccc">
		  <p>탈퇴에 동의하십니까? 동의하시냐구요  </p>
		 </div>
		 
		 
		<form action="deleteMember.doa" name="form" method="post">
		     <div class="form-group">
		        <label class="checkbox-inline">
		           <input type="checkbox" name="agree">동의합니다.
		        </label>
		     </div>
		
	 			 	<c:url var="mDelete" value="memberDelete.doa">
	 					<c:param name="userId" value="${loginUser.userId }" />
	 				</c:url>
	 				<button type="button" class="btn btn-danger" onclick="return chk();">탈퇴하기</button>&nbsp;&nbsp;
	 				<a class="btn btn-info" onclick="nochk()">취소</a> 
		
		
		</form>
		</div>
		</div>
	</div>

	<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<script type="text/javascript">
	function chk(){
	var agree = document.form.agree.checked;
	if(agree) {
		var ask = confirm("탈퇴하시겠습니까?"); //체크를 했을 떄 
		if(ask) {
			location.href="${mDelete}";
			return true;
		} else {
			return false;
		}
	} else {
		// 체크를 안했을 때
		alert("탈퇴 동의에 체크해주세요.");
	}
	 /* if(agree){
	 /*  num = 1; */
	 /* alert("num");
	 return  true;
	 } */
	 /* if(num==1){
	  document.form.submit();
	  alert("num");
	 }*/
	 
	}
	function nochk(){
	 alert("탈퇴를 취소했습니다.");
	location.href="deleteMember.doa";}
	</script>
</body>
</html>