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
	.guide {
		display :none;
		font-size : 12px;
		top : 12px;
		right : 10px;
	}
	span.ok {color : green;}
	span.error {color:red;}
	span.idLength {color:red;}
	
	.formcontrol{
	width:800px;
	}
	#pwdCheck{
	font-size :12px;
	top : 12px;
    right : 10px;
	}
	/* .align:: -webkit-input-placeholder{text-align:center} */
	
	
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->
	
	<div class="container" align="center">
	
	<!-- content -->	
	<div class="content">
	<h3 align="center">회원가입</h3>
	<div class="card bg-light">
	<article class="card-body" style="width: 700px;">
		<form  style="width:100%;"  action="insertMember.doa" method="post" name="memberInfo">
		  
		  <!-- 이름-->
		        	<div class="form-row">
	 				 	<div class="col form-group">
	 				 	   	<label class="fa fa-user">이름</label>  
	 				 	   	<input style="width:346px;" type="text" name="userName"  class="form-control" placeholder="이름을 입력하세요"  required >
	 				 	</div>
	 				
	 			      </div>
	 				
	 				<!-- 아이디 -->
	 				<div class="form-row">
	 					<div class="col form-group">
		              	<label class="fa fa-id-card">아이디</label> 
		             
		             <input style="width:346px;" type="text" name="userId" id="userId" class="form-control" onkeyup="chk(this);" placeholder="아이디를 입력하세요" required >
		 				<span class="guide idLength" id="idLength"></span>
		 				<span class="guide ok">사용 가능한 아이디 입니다.</span>
		 				<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
		 				<input type="hidden" id="idCheck" value="0">	 	
		             </div>
	 							
	 			   </div>
	 			   
	 			   <!-- 비밀번호 -->
	 			   <div class="form-row">
	 			   	<div  class="col form-group">
	 			   	 <label class="fa fa-lock">비밀번호</label> 
		          <input style="width:346px;" maxlength="16"  type="password" name="userPassword"  class="form-control"  onkeyup="pwCheck();" placeholder="비밀번호를 입력하세요"  required >
	 				<span id="pwdCheck"></span>
		          
		          
	      	       </div>
	 				
	 			
	 				<div>
	 				<input  style="width:346px;" maxlength="16"  type="password" name="userPasswordChk" class="form-control"  onkeyup="pwCheck();" placeholder="비밀번호 재확인" required>
	 				</div>
	 				</div>
	 				
	 				
	 			<!-- 성별 -->
	 				   <div class="form-group input-group">
	 				   <div class="input-group-prepend">
		           <span  class="input-group-text"><i class="fa fa-check" >성별</i> </span>
	      	       </div>
	 				   
	 				<input type="radio" name="gender" value="M" required>남
	 				<input type="radio" name="gender" value="F" required>여
	 			
	 				</div>
	 				
	 				
	 				
	 				<!-- 이메일 -->
	 				<div class="form-group input-group">
    	              <div class="input-group-prepend">
    	              
		              <span class="input-group-text"> <i class="fa fa-envelope">이메일</i> </span>
		             </div>
	 				<input style="width:136px;  height:40px;" type="text" class="form-control"  placeholder="@없이 아이디만" name="emailId" required >
	 				   <select style="width:130px;  height:40px;" class="form-control"  name="emailTag" onkeydown="inputEmailChk();">
	 				     <option value="@gmail.com">@gmail.com</option>
	 				     <option value="@iei.or.kr">@iei.or.kr</option>
	 				     <option value="@naver.com">@naver.com</option>			  
	 				     <option value="@daum.net">@daum.net</option>
	 				   </select> 
	 				
	 				
	 				  <input style="width:82px; font-size : 0.8em; text-align:center; height:40px" type="button" value="중복확인" onclick="openEmailChk();" class="btn btn-primary btn-lg btn-block" >
	 				  <input type="hidden" name="emailCheck" value="emailUncheck">
	 			</div>
	 			
	 			
	 			
	 			 <div class="form-group input-group" style="width:100%;">
    	         <div class="input-group-prepend">
		            <span class="input-group-text"> <i class="fa fa-phone">전화번호</i> </span>
		         </div>
	 				<select class="form-control"  style="width: 89px; height:40px; margin-left:176px;" name="firstPhone" >
	 				    <option value="010">010</option> 				   		
	 				</select>
	 				<input class="form-control" placeholder="-없이 번호만" type="text" size="4" name="secondPhone" id="secondPhone" style="width:  89px; height:40px;" onkeypress="javascript:checkInputNum();"  onkeydown="inputPhoneChk();"  maxlength="4" required  >
	 				<input class="form-control" placeholder="-없이 번호만" type="text" size="4" name="lastPhone" id="lastPhone" style="width:  89px; height:40px;" onkeypress="javascript:checkInputNum();"  onkeydown="inputPhoneChk();"  maxlength="4" required  >	 				
	 				
	 				  <input  type="button" value="중복확인" onclick="openPhoneChk();" class="btn btn-primary btn-lg btn-block" style="margin-right:183px; width : 82px; height: 40px; font-size : 0.8em; text-align:center;">
	 				
	 				  <input type="hidden" name="phoneCheck" value="phoneUncheck">
	 			
	 			 		</div>				
	 			
	 			
	 			
	 			 <div class="form-group input-group">
	 				   <div class="input-group-prepend">
		           <span  class="input-group-text"><i class="fa fa-check" >사용자 분류</i> </span>
	      	       </div>
	 				<input type="radio" name="userField" value="member" required>사용자(일반)
	 				    <input type="radio" name="userField" value="healthCeo"required>사장님(시설)
	 				    <input type="radio" name="userField" value="admin" required>관리자
	 			</div>
	 		
	 		
	 		 <div class="form-group">
	 				   <div class="input-group-prepend">
		           <span  class="input-group-text"><i class="fa fa-birthday-cake" >생년월일</i> </span>
	      	       
	 			 <input  style="width:346px;" type="tel" id="userBirth" name="userBirth" placeholder="ex) 20200723" class="form-control"  maxlength="8" required />
	 			     <span class="eheck_font" id="birth_check"></span>
	 			
	 			</div>
	 			</div>
	 		
	 			
	 				<!-- 사용불가 id 유효성검사 : validate()가 false면 가입 불가/ true이면 action url로 넘어감   class="btn btn-primary btn-block"-->
	 				 <!-- <button  onclick="return  validate();">가입하기</button>  class="btn btn-primary" --> 
	 				 <input style="width: 120px; height:40px;" type="submit"  class="btn btn-primary"  value="가입하기"> 
	 				<!-- <button onclick="return validate();">가입하기</button> -->
	 				<button style="width: 120px; height:40px;" type="button"  class="btn btn-danger" onclick="location.href='/';">취소</button>
	 			
	 			
	 		
	</form>
	</article>
	
	</div>
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
	  
	  
	// 생일 유효성 검사
		var birthJ = false;
		
		// 생년월일	birthJ 유효성 검사
		$('#userBirth').blur(function(){
			var dateStr = $(this).val();		
		    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		    var today = new Date(); // 날짜 변수 선언
		    var yearNow = today.getFullYear(); // 올해 연도 가져옴
			//여기도 에러뜨는데 잘 되는 에러가 뜸 
		    if (dateStr.length <=8) {
				// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			    if (1900 > year || year > yearNow){
			    	
			    	$('#birth_check').text('생년월일을 다시 확인해주세요.');
					$('#birth_check').css('color', 'red');
			    	
			    }else if (month < 1 || month > 12) {
			    		
			    	$('#birth_check').text('생년월일을 다시 확인해주세요.');
					$('#birth_check').css('color', 'red'); 
			    
			    }else if (day < 1 || day > 31) {
			    	
			    	$('#birth_check').text('생년월일을 다시 확인해주세요.');
					$('#birth_check').css('color', 'red'); 
			    	
			    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			    	 
			    	$('#birth_check').text('생년월일을 다시 확인해주세요.');
					$('#birth_check').css('color', 'red'); 
			    	 
			    }else if (month == 2) {
			    	 
			       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			       	
			     	if (day>29 || (day==29 && !isleap)) {
			     		
			     		$('#birth_check').text('생년월일을 다시 확인해주세요.');
						$('#birth_check').css('color', 'red'); 
			    	
					}else{
						$('#birth_check').text('');
						birthJ = true;
					}//end of if (day>29 || (day==29 && !isleap))
			     	
			    }else{
			    	
			    	$('#birth_check').text(''); 
					birthJ = true;
				}//end of if
				
				}else{
					//1.입력된 생년월일이 8자 초과할때 :  auth:false
					$('#birth_check').text('생년월일을 다시 확인해주세요.');
					$('#birth_check').css('color', 'red');  
				}
			});
	


	  
	  
	  
	  
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
		/* function idDup(){
			
		} */
		
		 /* $("#userId").on("blur", function() {
			
		}); */
		
		function chk(obj){
			var userId = $(obj).val(); ///#userId 인풋태그 = this
			//아이디가 5글자 미만인 경우도 검사
			 if(userId.length < 5){
				$(".guide").hide();
				$("#idCheck").val(0);
				$("#idLength").show();
				$("#idLength").text('아이디를 5글자 입력해주세요.');
				return false;
			}else{
				$("#idLength").hide();
				$("#idLength").text('');
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
		}
		
		
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