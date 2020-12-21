<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	.centerText table {
		margin: auto;
	}
	span.guide {
		display :none;
		font-size : 12px;
		top : 12px;
		right : 10px;
	}
	span.ok {color : green;}
	span.error {color:red;}
	
	
</style>
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
		<form action="insertMember.doa" method="post" name="memberInfo">
		<table width="650" cellspacing="5">
		        <tr>
	 				<td>이름</td>
	 				<td><input type="text" name="userName" placeholder="이름을 입력하세요" required ></td>
	 			</tr>
	 			<tr>
	 				<td>아이디</td>
	 				<td><input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요" required >
		 				<span class="guide ok">사용 가능한 아이디 입니다.</span>
		 				<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
		 				<input type="hidden" id="idCheck" value="0">
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<td>비밀번호</td>
	 				<td><input type="password" name="userPassword" onkeyup="pwCheck();" placeholder="비밀번호를 입력하세요" required ></td>
	 				<td><span id="pwdCheck" style="font-size: 1.3em; float:left;"></span> </td>
	 			</tr>
	 			<tr>
	 				<td>비밀번호 확인</td>
	 				<td><input type="password" name="userPasswordChk" onkeyup="pwCheck();" placeholder="비밀번호 재확인" required></td>
	 				
	 			</tr>
	 			<tr>
	 				<td>성별</td>
	 				<td><input type="radio" name="gender" value="M" required>남
	 				<input type="radio" name="gender" value="F" required>여</td>
	 			</tr>
	 			<tr>
	 				<td>이메일</td>
	 				<td><input type="text" placeholder="이메일" name="emailId" required >@
	 				   <select name="emailTag" onkeydown="inputEmailChk();">
	 				     <option value="@iei.or.kr">iei.or.kr</option>
	 				     <option value="@naver.com">naver.com</option>
	 				     <option value="@google.com">google.com</option>
	 				     <option value="@daum.net">daum.net</option>
	 				   </select> <a> Example) mail2im@ iei.or.kr</a>
	 				
	 				</td>
	 				<td>
	 				  <input type="button" value="중복확인" onclick="openEmailChk();" class="btn btn-primary btn-xs"  style="width : 70px; height: 40px; font-size : 0.8em; text-align:center;">
	 				  <input type="hidden" name="emailCheck" value="emailUncheck">
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<td>전화번호</td>
	 				<td><select name="firstPhone" style="width: 70px;">
	 				    <option value="010">010</option>
	 				    <option value="010">017</option>
	 				    
	 				</select>
	 				- <input type="text" size="4" name="secondPhone" id="secondPhone" style="width: 70px;" onkeypress="javascript:checkInputNum();"  onkeydown="inputPhoneChk();"  maxlength="4" required  >
	 				- <input type="text" size="4" name="lastPhone" id="lastPhone" style="width: 70px;" onkeypress="javascript:checkInputNum();"  onkeydown="inputPhoneChk();"  maxlength="4" required  >
	 				
	 				</td>
	 				<td>
	 				  <input type="button" value="중복확인" onclick="openPhoneChk();" class="btn btn-primary btn-xs" style="width : 70px; height: 40px; font-size : 0.8em; text-align:center;">
	 				</td>
	 				<td>
	 				  <input type="hidden" name="phoneCheck" value="phoneUncheck">
	 				</td>
	 				
	 				
	 			</tr>
	 			
	 			<tr>
	 			 <td>생년월일</td>
	 			 <td><input type="date" name="userBitrhday" /> </td>
	 			
	 			</tr>
	 			
	 			
	 			
	 			
	 			<tr>
	 				<td>가입분류</td>
	 				<td><input type="radio" name="userField" value="member" required>사용자(일반)
	 				    <input type="radio" name="userField" value="healthCeo"required>사장님(시설)
	 				    <input type="radio" name="userField" value="admin" required>관리자
	 				    </td>
	 			</tr>
	 		
	 			<tr>
	 				<td colspan="2" align="center">
	 				<!-- 사용불가 id 유효성검사 : validate()가 false면 가입 불가/ true이면 action url로 넘어감 -->
	 				 <!-- <button  onclick="return  validate();">가입하기</button> --> 
	 				 <input type="submit" class="" value="가입하기"> 
	 				<!-- <button onclick="return validate();">가입하기</button> -->
	 				<button type="button" onclick="location.href='home.doa';">홈으로</button></td>
	 			
	 			</tr>
	 		</table>
	</form>
	</div>
	</div>
	
	
		<!-- footer -->
	<br><br><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
	  <script>
	  function test() {
		 
	  }
	  
	  function checkValue() {
		  var gender = $("input[name='gender']:checked").val();
			 if (gender == null) {
				 alert("성별을 선택해주세요.");
			 }
		  
		   var form = document.memberInfo;
		  if(!form.userId.value){
			  alert('아이디를 입력해주세요.');
			  return false;
			  
		  }
		  if(form.idCheck.value == "idUncheck"){
			  alert('아이디 중복체크란을 클릭해주세요.');
			  return false;
			
		  }
		  if(!form. userPassword.value){
			  alert('비밀번호를 입력해주세요.');
			  return false;
			  
		  }
		  if(form.userPassword.value != form. userPasswordChk.value){
			  alert('비밀번호를 동일하게 입력해주세요.');
			  return false;
			  
		  }
		  if(!form.userName.value){
			  alert('이름을 입력해주세요.');
			  return false;
			  
		  }
		  if(!form.secondPhone.value || !form.lastPhone.value){
			  alert('번호를 정확히 입력해주세요.');
			  return false;
			  
		  }
		  if(form.phoneCheck.value=="phoneUncheck"){
			  alert('전화번호 중복확인을 해주세요.');
			  return false;
		  }
		  if(!form.emailId.value){
			  alert('이메일 아이디를 입력해주세요.');
			  return false;
			  
		  }
		  if(form.emailCheck.value=="emailUncheck"){
			  alert('이메일 중복확인을 해주세요.');
			  return false;
			  
		  }
		  
		  
		  
	  }
	  //핸드폰 중복 검사
	  function openPhoneChk() {
		  window.name ="parentForm";
		  window.open("memberPhoneCheckView.doa","chkForm","width=500, height=400, resizable=no, scrollbars=no");
	  }
	  
	  //이메일 중복검사 해야하는 자리
	  function openEmailChk() {
		  window.name = "parentForm";
		  window.open("memberEmailCheckView.doa","chkForm","width=500, height=400, resizable=no, scrollbars=no");
		  
	  }
	  
	  
	  
	  function inputPhoneChk(){
		  document.memberInfo.phoneCheck.value ="phoneUncheck";
	  }
	  
	  function inputEmailChk(){
		  document.memberInfo.emailCheck.value ="emailUncheck";
		  
	  }
	  
	  function pwCheck(){
		  var passWord = $("input[name='userPassword']").val();
		  var passwordChk = $("input[name='userPasswordChk']").val();
		  if(passWord != passwordChk){
			  $("#pwdCheck").css("color","red");
			  $("#pwdCheck").text('비밀번호가 다릅니다.');
			  
		  }else if(passWord==''&& passwordChk==''){
				  $("#pwdCheck").css("color","red");
				  $("#pwdCheck").text('비밀번호를 입력해주세요.');  
		  }else if(passWord == passwordChk){
			  $("#pwdCheck").css("color","green");
			  $("#pwdCheck").text('비밀번호가 일치합니다.'); 
			  
		  }
		  
		  
	  }
	  
	  
	  
	  
		// 사용할 수 있는 아이디인가 체크해서 가입하기 버튼이 동작하도록 함.    userPassword  userPasswordChk  118
		function validate() {
			//return false; //가입하기 버튼을 아무리 눌러도 절대 넘어가지 않지       
			                 
			//input type=hidden id="idDuplicateCheck" 태그를 사용함
			//이 태그의  value값이 0 이면 가입 x, 1이면 가입 o  가입이 그냥 뚫려..
			if($("#idCheck").val() == 0){
				alert("사용가능한 아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}else{
				return true;
			}
		}
	
		//아이디 중복검사 (ajax)
		 $("#userId").on("blur", function() {
			var userId = $(this).val(); ///#userId 인풋태그 = this
			//아이디가 5글자 미만인 경우도 검사
			 if(userId.length < 5){
				$(".guide").hide();
				$("#idCheck").val(0);
				alert("아이디는 5글자 이상이어야 합니다.");
				return false;
			}  
			$.ajax({
				url : "dupId.doa",
				data : {"userId" : userId},
				success : function(result) { //memberController에서 isUsable = result 
					//result가 true이면 사용할 수 있습니다.
					//result가 false이면 사용할 수 없습니다.
					console.log(result);
					if(result == "true") {
						$(".guide.error").hide();
						$(".guide.ok").show();
						$("#idCheck").val(1);
					}else if(result =="false") {
						$(".guide.error").show();
						$(".guide.ok").hide();
						$("#idCheck").val(0);
					}
				},
				error : function(error) {
					
				}
			});
		});
		
		
		
		
		
		/*  $(function(){

			//비밀번호 확인
				$('#pw2').blur(function(){
				   if($('#pw1').val() != $('#pw2').val()){
				    	if($('#pw2').val()!=''){
					    alert("비밀번호가 일치하지 않습니다.");
				    	    $('#pw2').val('');
				          $('#pw2').focus();
				       }
				    }
				})  	   
			});

 */

			
		
		
		
	</script> 
	
	<!-- <script type="text/javascript">
	 $(function(){
		 $("#alert-success").hide();
		 $("#alert-danger").hide();
		 $("input").keyup(function() {
			var pw1=$("#pw1").val();
			var pw2=$("#pw2").val();
			if(pw1 != "" || pw2 != "") {
				if(pw1 == pw2){
					$("#alert-success").show();
				    $("#alert-danger").hide();
				    $("#submit").removeAttr("disabled");
					
				}else{
					$("#alert-success").show();
				    $("#alert-danger").hide();
				    $("#submit").attr("disabled","disabled");
				}
				
			}
		 })
		 
	 })
	</script> -->
	
</body>
</html>