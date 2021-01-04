<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../resources/css/openchat.css"> 
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <%-- <div>
        <input type="text" id="sender" value="${loginUser.userId }" name="userId" style="display: none;">
        <input type="text" id="messageinput" name="messageinput">
        <input type="text" id="mateNo" value="${myMate.mateNo }">
    </div>
    <div>
        <button type="button" onclick="openSocket();" id="chatOpen">Open</button>
        <button type="button" onclick="send();" id="chatSB">Send</button>
        <button type="button" onclick="closeSocket();">Close</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div> --%>
    
    <input type="text" id="sender" value="${loginUser.userId }" name="userId" style="display: none;">
    <input type="text" id="mateNo" value="${myMate.mateNo }" style="display: none;">
    <div class="chatarea">
    	<div class="chatnotice">${myMate.mateNo } 번 채팅방 입장하기<button type="button" onclick="openSocket();" id="chatOpen">입장</button></div>
    	<div id="messages" class="chatMessageArea"></div>
    	
    	<span class="inputarea">
    		<input type="text" class="message" id="messageinput" name="messageinput">
    		<span class="sendarea">
    			<input type="button" class="sendBtn" onclick="send();" id="chatSB" value="전송">
    		</span>
    	</span>
    </div>
    
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("입장하셨습니다.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://localhost:2624/echo.doa");
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("채팅이 종료되었습니다.");
            }
        }
        
        function send(){
            var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text="";
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
        	messages.innerHTML+="<br/>"+text;
        }
        
        $(function() {
        	$("#chatSB").on("click", function() {
        		var messageinput = $("#messageinput").val();
        		var userId = $("#sender").val();
        		var mateNo = $("#mateNo").val();
        		
        		$.ajax({
        			url : "addChat.doa",
        			type : "post",
        			data : {
        				"messageinput" : messageinput
        				, "userId" : userId
        				, "mateNo" : mateNo
        			},
        			success : function(data) {
        				if(data == "success") {
        					$("$messageinput").val("");
        				} else {
        					alert("저장 실패..");
        				}
        			}
        		});
        	});
        });
        
        $(function() {
        	$("#chatOpen").on("click", function() {
        		var mateNo = ${myMate.mateNo };
        		$.ajax({
        			url : "chatList.doa",
        			type : "get",
        			data : {"mateNo" : mateNo },
        			dataType : "json",
        			success : function(data) {
        				$div = $("#messages");
        				$div.html("");
        				
        				if(data.length > 0) {
        					for(var i in data) {
        						writeResponse(data[i].userId + " : " + decodeURIComponent(data[i].messageinput));
        					}
        				} else {
        					writeResponse("저장된 내용이 없습니다.");
        				}
        			}
        		});
        	});
        });
  </script>
</body>
</html>