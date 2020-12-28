
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크 페이지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="//code.jquery.com/jquery.min.js"></script>
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<!-- Font -->
        <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	#wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             /* visibility:hidden; */
             display: none;
             
        }
		#title, #driverEmailId, #driverEmailTag,  #chk , #cancelBtn, #useBtn, #msg{
		font-family: 'Do Hyeon', sans-serif;
		}
		#driverEmailId, #driverEmailTag, #chk , #cancelBtn, #useBtn, #msg{
			font-size : 1.1em;
		}
		
	
</style>
<script>
	var httpRequest = null; //getXMLHttpRequest()함수로 생성한 객체를 저장하기위해 선언한 변수.
	
	function getXMLHttpRequest(){
		if(window.ActiveXObject){
			try{
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
				
			}catch(e){
				try{
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					
				}catch(e1){
					httpRequest = null;}
			}
	
		}else if(window.XMLHttpRequest){
			httpRequest = new XMLHttpRequest();
		}
		return httpRequest;
			
	}
	//????
	function pValue(){
        document.getElementById("emailId").value =  opener.document.memberInfo.emailId.value;
        document.getElementById("emailTag").value = opener.document.memberInfo.emailTag.value;
    }
    
    // 아이디 중복체크
    function emailCheck(){
        var emailId = document.getElementById("emailId").value;
		var emailTag =  document.getElementById("emailTag").value;
        if(!emailId){
            alert("이메일 아이디를 입력하지 않았습니다.");
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("email").style.border = '3px solid red';
            return false;
        
        }
        else if((emailId < "0" || emailId > "9") && (emailId < "A" || emailId > "Z") && (emailId < "a" || emailId > "z")){ 
            alert("한글 및 특수문자는 이메일 아이디로 사용하실 수 없습니다.");
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("email").style.border = '3px solid red';
            return false;
        }
        else{
        	//console.log(emailId);
        	  $.ajax({
              	url : "dupEmail.doa",
              	data : {"emailId" : emailId, "emailTag" : emailTag},   
              	type : "get",
              	success : function(resultText){
              		if(resultText != 0){
                          alert("사용할수없는 이메일입니다.");
		        	}
              		else if(resultText == 0){ 
			        	alert('사용할 수 있는 메일입니다.');
			        	/* document.getElementById("useBtn").style.display = "block"; */
			        	/* $("#target_element").hide(); */
			        	document.getElementById("useBtn").style.display='block';
			        }
         		}
    		});
        }
    }
    
        	  
        	  /* var email = emailId+emailTag;
	        	console.log(email);
	            var param="email="+email;
	            httpRequest = getXMLHttpRequest();
	            httpRequest.onreadystatechange = callback;
	            httpRequest.open("POST", "/customer/emailCheck", true);   //주소 고쳐어ㅓㅓ어 
	            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
	            httpRequest.send(param); */
	            
	            
    function callback(){
        if(httpRequest.readyState == 4){
            // 결과값을 가져온다.
            var resultText = httpRequest.responseText;
            if(resultText == 0){
                alert("사용할수없는 아이디입니다.");
                document.getElementById("cancelBtn").style.visibility='visible';
                document.getElementById("useBtn").style.visibility='hidden';
                document.getElementById("msg").innerHTML ="";
                document.getElementById("emailId").style.border = '3px solid red';
            } 
            else if(resultText == 1){ 
            	$("input[name='emailInput']").attr('readonly',true);
                document.getElementById("cancelBtn").style.visibility='hidden';
                document.getElementById("useBtn").style.visibility='visible';
                document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
                document.getElementById("emailId").style.border = '3px solid green';
            }
        }
    }
    
    // 사용하기 클릭 시 부모창으로 값 전달 
    function sendCheckValue(){
        // 중복체크 결과인 idCheck 값을 전달한다.
        opener.document.memberInfo.emailCheck.value ="emailCheck";
		   
        // 회원가입 화면의 ID입력란에 값을 전달
        opener.document.memberInfo.emailId.value = document.getElementById("emailId").value;
        opener.document.memberInfo.emailTag.value = document.getElementById("emailTag").value;
        opener.document.memberInfo.emailId.readOnly = true;
        if (opener != null) {
            opener.chkForm = null;
            self.close();
        }    
    }    



</script>
<style>
	
</style>
</head>
<body onload="pValue();">
<div id="wrap">
    <br>
    <b><font id="title" style="font-size: 1.6em;" color="gray">이메일 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm"  action="dupEmail.doa" method="get">
        	<div class="col-xs-2">
        	</div>
        	<div class="col-xs-3">
        		<input type="text" name="emailInput" class="form-control" id="emailId" value="${email }" style="margin-left: 15px;">
        		</div>
        	<div class="col-xs-4">
        		<input type="text" name="emailInput" class="form-control" id="emailTag" value="${emailTag}" style="margin-left:-10px;">
        	</div>
        	<div class="col-xs-3">
        		<input type="button" value="중복확인" class="btn btn-default" style="margin-left: -60px;" onclick="emailCheck()">
        	</div>
        	
        </form>
		<br>
        <div id="msg"></div>
        <br>
        <div class="col-xs-12" style="width:50%;text-align:right;">
        	<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
        	 </div>
        <div class="col-xs-12" style="width:50%;text-align:right;">
        	<input id="useBtn" type="button"  value="사용하기" onclick="sendCheckValue()">
            </div>
       
        
        	<!-- <input type="hidden" value="0" name = "displayValue" id = "displayValue"> -->
    
        
    </div>
</div>    
</body>
</html>

