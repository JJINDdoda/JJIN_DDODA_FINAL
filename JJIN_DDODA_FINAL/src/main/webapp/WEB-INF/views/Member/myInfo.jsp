<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/basicStyle.css">
<style>
	.centerText table {
		margin : auto;
	}
		 .main-name-h2 {
	font-family: 'Wemakeprice-Regular';
	color: #424242;
	font-size : 1.7em;
}
.menub {
	margin-left:6%;
	width:150px;
	height : 570px;
	background-color:white;
	text-align:left;
	float:left;
	border : 1px solid #edd5c5;
	border-top : 1px solid #f7bf99;
}

.menub>ul li {
	padding-left : 15px;
}
.menub>ul li:first-child {
	border-left : 1px solid #f7bf99;
	background-color:#f7bf99;
	height:40px;
	margin-top:0;
}
.menub>ul>li a {
	font-family: 'NanumSquareR';
	color:#797979;
	position:relative;
}
.menub>ul>li:hover a, .menub>ul>li:hover .imgwrapper {
	color : #f7bf99;
	-webkit-transition: all 0.5s ease;
  	transition: all 0.5s ease;
}
.name {
	width:100px;
	float:left;
}
.more {
	width:100px;
}
.menub>ul>li .imgwrapper {
	width:120px;
	text-align:right;
	color : #707070;
}
.menub>ul li .imgwrapper img {
	width:10px;
}
.main {
	width : 68%;
	margin-left : 5%;
}
.table {
	font-family: 'NanumSquareR';
	font-size : 0.6em;
}
.table tr {
	width : 100%;
	border-top : 1px solid white;
}
.table tr td {
	padding-top : 10px;
	padding-bottom : 10px;
	text-align :center;
	font-size : 1.5em;
}
input[type="text"] {
	width: 100%;
}
textarea {
	width : 100%;
}
	.content {
		height : 700px;
	}

@media ( max-width : 991px) {
		.menub {
			width:85%;
			height : 50px;
		}
		.menub>ul {
			height :100%;
		}
		.menub>ul li:first-child {
			width : 0px;
			height : 100%;
		}
		.menub>ul li:nth-child(2){
			width : 20%;
			padding-left : 30px;
		}
		.menub li {
			width: 25%;
			padding-left : 20px;
		}
		.menub>ul>li .imgwrapper {
			display:none;
		}
		.main {
			width : 90%;
		}
		.content {
			height : 700px;
		}
	}
	.menuSelect { 
		width: 200px; /* 원하는 너비설정 */ 
		padding: .4em .4em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */ 
		background: url(/resources/assets/down_arrow.png) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
		background-size : 10px 10px;
		border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
	.searchSelect { 
		width: 100px; /* 원하는 너비설정 */ 
		padding: .1em .1em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */ 
		background: url(/resources/assets/down_arrow.png) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
		background-size : 10px 10px;
		border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
	.select-wrapper {
		width : 20%;
		text-align:right;
		float:left;
	}
	.table-wrap {
		margin-top : 20px;
		float:left;
		width : 100%;
		height : 450px;
	}
	.searchText {
		width: 20%;
	}
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
				<li></li>
				<li><div class="name"><a href="myInfo.doa">회원정보 수정</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="opendiaryContentsList.doa?userId=${loginUser.userId }">내가 쓴글</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="myMateAttendList.doa?userId=${loginUser.userId }">마이 메이트</a></div><div class="imgwrapper"> > </div></li>
				<li><div class="name"><a href="deleteMember.doa">회원탈퇴</a></div><div class="imgwrapper"> > </div></li>
			</ul>
	</div>
	<div class="main">
	<h3 align="center">${loginUser.userName }님의 정보 보기</h3>
	<div class="centerText">
		<!-- 단순히 정보만 보는 것이 아니라 수정이 필요한 경우 수정이 가능하도록 form태스 작성 -->
		<form action="updateMember.doa" method="post" name="memberInfo">
			<table width="650" cellspacing="5">
			    <tr>
	 				<td>이름</td>
	 				<td><input type="text" name="userName" value="${ loginUser.userName }" readonly></td>
	 			</tr>
				<tr>
	 				<td>아이디</td>
	 				<td><input type="text" name="userId" id="userId" value="${ loginUser.userId }" readonly></td>
	 			</tr>
	 			
	 			<tr>
	 			    <td>비밀번호</td>
	 			    <td><input type="password" name="userPassword" onkeyup="pwCheck();"  value="${loginUser.passWord }" required></td>
	 			    <td><span id="pwdCheck" style="font-size: 1.3em; float:left;"></span> </td>
	 			</tr>
	 			
	 			<tr>
	 				<td>비밀번호 확인</td>
	 				<td><input type="password" name="userPasswordChk" onkeyup="pwCheck();" placeholder="비밀번호 재확인"  value="${loginUser.passWord }" required></td>
	 				
	 			</tr>
	 			
	 			<tr>
	 				<td>성별</td>
	 				<c:if test="${loginUser.gender eq 'M' }">
	 				<td><input type="radio" name="gender" value="M" checked >남
	 				<input type="radio" name="gender" value="F">여</td>
	 				</c:if>
	 				<c:if test="${loginUser.gender eq 'F' }">
	 				<td><input type="radio" name="gender" value="M">남
	 				<input type="radio" name="gender" value="F" checked >여</td>
	 				</c:if>
	 			</tr>
	 			<tr>
	 				<td>이메일</td>
	 				<td><input type="text" name="emailId" value="${loginUser.email}" placeholder="@없이 아이디만" required>
	 				<select name="emailTag" onkeydown="inputEmailChk();">
	 				     <option value="@gmail.com">@gmail.com</option>
	 				     <option value="@iei.or.kr">@iei.or.kr</option>
	 				     <option value="@naver.com">@naver.com</option>			  
	 				     <option value="@daum.net">@daum.net</option>
	 				   </select> 
	 				
	 				</td>
	 				<td>
	 				  <input type="button" value="중복확인" onclick="openEmailChk();" class="btn btn-primary btn-xs"  style="width : 70px; height: 40px; font-size : 0.8em; text-align:center;">
	 				  <input type="hidden" name="emailCheck" value="emailUncheck">
	 				</td>
	 			</tr>
	 			
	 			<br>
	 			<tr>
	 			   <td>현재 전화번호</td>
	 			   <td><input type="text" name="phone" value="${loginUser.phone }" readonly></td>
	 			</tr>
	 			<tr>
	 			
	 				<td>변경할  전화번호</td>
	 				<%-- <td><input type="text" name="phone" value="${loginUser.phone }" readonly></td><br><br> --%>
	 				<td>
	 				<select name="firstPhone" style="width: 70px;">
	 				    <option value="010">010</option>
	 				  
	 				    
	 				</select>
	 				- <input type="text" size="4" name="secondPhone" id="secondPhone" style="width: 70px;" onkeypress="javascript:checkInputNum();"  onkeydown="inputPhoneChk();"  maxlength="4" required  >
	 				- <input type="text" size="4" name="lastPhone" id="lastPhone" style="width: 70px;" onkeypress="javascript:checkInputNum();"  onkeydown="inputPhoneChk();"  maxlength="4" required  >
	 				
	 				<%--  value="${loginUser.phone }" --%>
	 			<%-- 	<input type="text" name="phone" value="${loginUser.phone }" required> --%>
	 				
	 				
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
	 			 <td><input type="tel" id="userBirth" name="userBirth"  value="${loginUser.userBirth }" readonly/></td>
	 			
	 			</tr>
	 			
	 			
	 			<tr>
	 				<td colspan="2" align="center">
	 				<input type="submit" value="수정하기">
	 				<!-- <button type="button">탈퇴하기</button> -->
	 				<%-- <a href="memberDelete.do?userId=${ loginUser.userId }">탈퇴하기</a> --%>
	 			
	 			
	 			<%-- 	<c:url var="mDelete" value="memberDelete.doa">
	 					<c:param name="userId" value="${loginUser.userId }" />
	 				</c:url>
	 				<a href="${mDelete }" >탈퇴하기</a> --%>
	 				</td>
	 			</tr>
			</table>		
		</form>
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
		
		 </script>
</body>
</html>