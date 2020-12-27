<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


    
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01

 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


    
<html>
<head>

 <script type="text/javascript">
        $(document).ready(function(){
    
            $("#agree1").click(function(){    
                if($("#check_1").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return false;
                }else if($("#check_2").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                    return false;
                }else if($("#check_3").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
                    return false;
                }else if($("#check_4").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다....");
                    return false;
                }else{
                    $("#terms_form").submit();
                }
            });    
        });
        
        
        
        $(document).ready(function(){
            
            $("#agree2").click(function(){    
                if($("#check_1").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return  false;
                }else if($("#check_2").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                    return  false;
                }else if($("#check_3").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
                    return  false;
                }else if($("#check_4").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다....");
                    return  false;
                }else{
                    $("#terms_form").submit();
                }
            });    
        });
        
        
        //------------------------------ 모두 체크하기 및 해지 -----------------------------
        
   $(document).ready(function() {
    
     $("#chk").click(function(){
            //만약 전체 선택 체크박스가 체크된상태일경우
            if($("#chk").prop("checked")) {
                $("input[type=checkbox]").prop("checked",true);
                //input type이 체크박스인것은 모두 체크함
            } else {
                $("input[type=checkbox]").prop("checked",false);
                //input type이 체크박스인것은 모두 체크 해제함
            }
      });
});
         
    </script>


<meta charset="UTF-8">
<title>개인정보 약관 동의</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    
    
    <style>
    *{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;
        }
ul>li{list-style: none
        }
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;
        }
        #joinForm{width: 460px;margin: 0 auto;
        }
ul.join_box{border: 1px solid #ddd;background-color: #fff;
        }
.checkBox,.checkBox>ul{position: relative;
        }
.checkBox>ul>li{float: left;
        }
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;
        }
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;
        }
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;
        }
.footBtwrap{margin-top: 15px;
        }
.footBtwrap>li{float: left;width: 50%;height: 60px;
        }
.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;
        }
 #agree1{
   background-color: #F7BF99; , color:#fff;
 }       

#agree2{background-color: lightblue;   color: #fff; width: 400px;  height: 80px;  margin-right: 390px;     text-align: center;
        }
        #wrap {
            text-align: center;
        }
        .radio {
            text-align: center;
                                          
        }
       
        
                
           
                
        }
        .checkLeft{
        text-align : left;
        }


        #gg{
        width:50%;
        margin:0 auto;
        }



    </style>
</head>
<body>
    
   
    
   <h2 class="member" align="center">개인정보 이용약관</h2>
   <div id="gg">
    <form action="enrollView.doa">
   
            <ul class="join_box">
               <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(필수), 프로모션 안내
                            메일 수신(필수)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chk" id="chk" class="checkLeft">
                        </li>
                    </ul>
                </li>

                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="check_1" class="checkLeft"> 
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
DDO:DA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 DDO:DA  서비스의 이용과 관련하여 DDO:DA서비스를 제공하는 DDO:DA  주식회사(이하 ‘DDO:DA ’)와 이를 이용하는 DDO:DA 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 DDO:DA  서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="check_2" class="checkLeft">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
DDO:DA  서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 DDO:DA  서비스의 이용과 관련하여 DDO:DA  서비스를 제공하는DDO:DA  주식회사(이하 ‘DDO:DA ’)와 이를 이용하는 DDO:DA  서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 DDO:DA  서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="check_3" class="checkLeft">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
DDO:DA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 DDO:DA  서비스의 이용과 관련하여 DDO:DA  서비스를 제공하는 DDO:DA 주식회사(이하 ‘DDO:DA ’)와 이를 이용하는 DDO:DA 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 DDO:DA  서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="check_4" class="checkLeft">
                        </li>
                    </ul>
 
                </li>
            </ul>
        
     
          
            <ul class="footBtwrap clearfix">
            	<li>
            	  <button type="submit" class="btn btn-default btn-sm" id="agree1">다음 단계</button>
            	    </li>
            	    <li>
            	   <button type="button" class="btn btn-default btn-sm" onclick="location.href='home.doa';">취소하기</button>
               </li>
               
            </ul>
        
        </form>
        </div>
	<!-- </form> -->



</body>
</html>