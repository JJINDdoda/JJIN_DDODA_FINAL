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
		<form action="insertMember.doa" method="post">
		<table width="650" cellspacing="5">
		        <tr>
	 				<td>이름</td>
	 				<td><input type="text" name="userName"></td>
	 			</tr>
	 			<tr>
	 				<td>아이디</td>
	 				<td><input type="text" name="userId" id="userId">
		 				<span class="guide ok">사용 가능한 아이디 입니다.</span>
		 				<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
		 				<input type="hidden" id="idDuplicateCheck" value="0">
	 				</td>
	 			</tr>
	 			
	 			<tr>
	 				<td>비밀번호</td>
	 				<td><input type="password" name="passWord"></td>
	 			</tr>
	 			<tr>
	 				<td>성별</td>
	 				<td><input type="radio" name="gender" value="M">남
	 				<input type="radio" name="gender" value="F">여</td>
	 			</tr>
	 			<tr>
	 				<td>이메일</td>
	 				<td><input type="email" name="email"></td>
	 			</tr>
	 			<tr>
	 				<td>전화번호</td>
	 				<td><input type="text" name="phone"></td>
	 			</tr>
	 			<tr>
	 				<td>가입분류</td>
	 				<td><input type="radio" name="userField" value="member">사용자(일반)
	 				    <input type="radio" name="userField" value="healthCeo">사장님(시설)
	 				    <input type="radio" name="userField" value="admin">관리자
	 				    </td>
	 			</tr>
	 		
	 			<tr>
	 				<td colspan="2" align="center">
	 				<!-- 사용불가 id 유효성검사 : validate()가 false면 가입 불가/ true이면 action url로 넘어감 -->
	 				<input type="submit" value="가입하기">
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
	<!--  <script>
		// 사용할 수 있는 아이디인가 체크해서 가입하기 버튼이 동작하도록 함.
		function validate() {
			//return false; //가입하기 버튼을 아무리 눌러도 절대 넘어가지 않지
			//input type=hidden id="idDuplicateCheck" 태그를 사용함
			//이 태그의  value값이 0 이면 가입 x, 1이면 가입 o  가입이 그냥 뚫려..
			if($("#idDuplicateCheck").val() == 0){
				alert("아이디를 다시 입력해주세요.");
				$("#userId").focuse();
				return false;
			}else{
				return true;
			}
		}
	
		//아이디 중복검사 (ajax)
		$("#userId").on("blur", function() {
			var userId = $(this).val(); ///#userId 인풋태그 = this
			//아이디가 6글자 미만인 경우도 검사
			if(userId.length < 6){
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);
				alert("아이디는 6글자 이상이어야 합니다.");
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
						$("#idDuplicateCheck").val(1);
					}else if(result =="false") {
						$(".guide.error").show();
						$(".guide.ok").hide();
						$("#idDuplicateCheck").val(0);
					}
				},
				error : function(error) {
					
				}
			});
		});
	</script>  -->
	
</body>
</html>