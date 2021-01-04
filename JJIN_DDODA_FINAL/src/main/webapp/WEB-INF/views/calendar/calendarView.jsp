<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<link rel=" shortcut icon" href="image/favicon.ico">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

    <!-- <link rel="stylesheet" href="resources/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resources/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='resources/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='resources/vendor/css/bootstrap-datetimepicker.min.css' /> -->
    <link rel="stylesheet" href="resources/fullcalendar-4.3.1/vendor/css/fullcalendar.min.css" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

   <!--  <link rel="stylesheet" href="resources/css/fullcalendar/main.css"> -->
    <link rel="stylesheet" href="resources/fullcalendar-4.3.1/packages/core/main.css">
    <link rel="stylesheet" href="resources/fullcalendar-4.3.1/packages/daygrid/main.css">
    
   
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 830px;
    margin: 0 auto;
  }
  
  #contextMenu {
    	position: fixed;
    	display: none;
    	z-index: 2;
    	margin-left: 3%;
	}
	
	#contextMenu .dropdown-menu {
    	border: none;
    	height: 200px;
	}
	
	.dropNewEvent {
	    font-size: 13px;
	}
	 
	 
	#myInfo{
		display : none;
		width: 700px;
		height: 150px;
		margin: auto;
	}
	
	#myInfoBtn{
		float: right;
		margin-right: 50px;
	}
	
	.infoBox{
		width: 150px;
	}
	.none {
		display :none;
	}
</style>
</head>
<body>
   <!-- header -->
   <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   <br><br><br><br>
   
   
   <div>
		<div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li class="menuBar original"><a id="insert" tabindex="-1" style="height: 45px; padding-top: 15px;" href="#">일기작성</a></li>
                 <li class="menuBar none"><a id="detail" tabindex="-1" style="height: 45px; padding-top: 15px;" onclick="showdetail();">일기보기</a></li>
                
                <li class="menuBar"><a tabindex="-1" style="height: 45px; padding-top: 15px;" onclick="calorieInput()">칼로리입력</a></li>
                <li class="menuBar"><a tabindex="-1" style="height: 45px; padding-top: 15px;" onclick="changeMyInfo()">기본정보변경</a></li>
                <li class="divider"></li>
                <li class="menuBar"><a tabindex="-1" onclick="contextClose()" style="height: 45px;" data-role="close">Close</a></li>
            </ul>
        </div>
        
		<div id='calendar'></div>
		
		<div id="myInfo">
			<c:if test="${empty memberInfo }">
				<form action="changeMyInfo.doa" method="post" id="formId">
					<fieldset>
						<legend>기본정보 입력</legend>
						키 : <input type="text" class="infoBox" id="myHeight" name="myHeight" required> cm &nbsp;&nbsp;
						몸무게 : <input type="text" class="infoBox" id="myWeight" name="myWeight" required> kg &nbsp;&nbsp;
						BMI : <input type="text" class="infoBox" id="myBMI" name="myBMI" readonly>
						<br><br>
						<input type="hidden" id="changeDate" name="changeDate" value="">
						
						<input type="submit" id="myInfoBtn" value="입력하기">
						
						
					</fieldset>
				</form>
			</c:if>
		</div>
	</div>
	
	
   <br><br><br>
   <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   <!-- end footer -->

    <!-- <script src="resources/vendor/js/jquery.min.js"></script>
    <script src="resources/vendor/js/bootstrap.min.js"></script>
    <script src="resources/vendor/js/moment.min.js"></script>
    <script src="resources/vendor/js/fullcalendar.min.js"></script> 
    <script src="resources/vendor/js/ko.js"></script>
    <script src="resources/vendor/js/select2.min.js"></script>
    <script src="resources/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="resources/js/fullcalendar/main.js"></script>  
    <script src="resources/js/fullcalendar/addEvent.js"></script>
    <script src="resources/js/fullcalendar/editEvent.js"></script>
    <script src="resources/js/fullcalendar/etcSetting.js"></script>  --> 
    <script src="resources/fullcalendar-4.3.1/packages/bootstrap/main.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/bootstrap/main.min.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/core/main.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/core/main.min.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/daygrid/main.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/daygrid/main.min.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/google-calendar/main.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/google-calendar/main.min.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/interaction/main.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/interaction/main.min.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/timegrid/main.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/timegird/main.min.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/rrule/main.min.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/rrule/main.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/list/main.js"></script>
    <script src="resources/fullcalendar-4.3.1/packages/list/main.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    
    <script>

   //today : 오늘 날짜
    var now = new Date();
    var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
    var today = year + '-' + mon + '-' + day;
    
    console.log(today);
    var opendiaryNo;
    
    document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var userId = $('#userId').val();
    var jevents = [${events}];

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      //defaultDate: '2020-12-12',   달력 로드될 때,기본으로 표기하는 값 미지정 시 현재 날짜 
      //navLinks : true,   달력상의 날짜를 클릭할 수 있는지 여부, 클릭 시 일/주달력으로 넘어감 boolean 
      /* editable: true,  */  //boolean, 이벤트드래그, 리사이징 등의 편집 여부를 설정함
      eventLimit: true, // boolean, 달력에 셀크기보다 많은 이벤트 존재 시 +more로 표기함
     /*  selectable: true,
      droppable: true, */
      
     
       /* ****************
        *  일기 일정 받아옴 
        * ************** */
       events: function (info, successCallback, failureCallback) {
         $.ajax({
           type: "get",
           url: "diaryList.doa",
           data: {"userId" : userId},
           dataType : "json",
           success: function (data) {
        	 jevents = [${events}];
             if(data !=null) {
                $.each(data, function(index, element) {
                	
                	var startdate = moment(element.opendiaryDate).format('YYYY-MM-DD');
                	
                   jevents.push({
                      _id : element.opendiaryNo,
                      title : '<일기> '+ element.opendiaryTitle,
                      start : startdate,
                      description : element.opendiaryContents,
                      end : element.opendiaryDate,
                      backgroundColor: "#7bb8b3",
                      borderColor : "#7bb8b3",
                      imageurl : "/resources/diaryUploadFiles/"+userId+"/"+element.mainImagePath
                   });
               });
                
             }
            successCallback(jevents);
           }
         });
       },
       
      dateClick: function(info) {
	        clickDate = info.dateStr;
	        $('#changeDate').val(clickDate);
	        /* console.log(clickDate); */
	        document.getElementById("contextMenu").style.display = 'block';
	        $.ajax({
	        	url : "selectMyInfoDate.doa", //날짜에 대한 기본정보를 가져옴
	        	data : {"clickDate" : clickDate},
	        	type : "get",
	        	success : function(result){
	        		
	        		if(result.length  != 0){
	        			$('#myHeight').val(result.height);
		        		$('#myWeight').val(result.weight);
		        		$('#myBMI').val(result.bmi);
		        		$('#myInfoBtn').val('수정하기');
		        		$("#formId").attr("action", "updateChangeMyInfo.doa");
	        		}
	        		else{
	        			$('#myHeight').val(result.height);
		        		$('#myWeight').val(result.weight);
		        		$('#myBMI').val(result.bmi);
		        		$('#myInfoBtn').val('입력하기');
		        		$("#formId").attr("action", "changeMyInfo.doa");
	        		}
	        	}
	        });
	       
	        $('.none').css("display","none");
        	$('.original').css("display","block");
	         for(var i = 0 ; i < jevents.length; i++){
	        	if( jevents[i]._id != null && jevents[i].start == clickDate) {
		        	$('.none').css("display","block");
		        	$('.original').css("display","none");
		        	opendiaryNo = jevents[i]._id;
		         } 
	        }
	        
	    },
	  
     locale : 'ko'
    });
  //날짜 클릭시 카테고리 선택메뉴
    var $contextMenu = $("#contextMenu");
     
     /* console.log(opendiaryNo); */
    $contextMenu.on("click", "a", function (e) {
      e.preventDefault();

         if ($(this).data().role !== 'close' ) {
            insertEvent($(this).html());
         } 
           $contextMenu.removeClass("contextOpened");
           $contextMenu.hide();
    });

    $('body').on('click', function () {
      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });
  
    calendar.render();
    
  }); 

  function showdetail() {
		location.href="myDiaryDetail.doa?opendiaryNo="+opendiaryNo;
	} 
  
  function insertEvent(htmls) {
     if(htmls =='일기작성'){
        location.href="diaryView.doa?date="+clickDate;
     } 
  }
 
  
//기본정보입력 div띄워주기
	function changeMyInfo(){
		document.getElementById("myInfo").style.display = 'block';
	}
	
	//몸무게를 입력했을 때 bmi변경
	$('#myWeight').keyup(function(){
		var myHeight = $('#myHeight').val();
		var myWeight = $('#myWeight').val();
		console.log(myHeight);
		console.log(myWeight);
		var bmiHeight = myHeight/100;
		var myBMI = myWeight/(bmiHeight*bmiHeight);
		$('#myBMI').val(myBMI);
	});
	
	//키를 입력했을 때 bmi 변경
	$('#myHeight').keyup(function(){
		var myHeight = $('#myHeight').val();
		var myWeight = $('#myWeight').val();
		console.log(myHeight);
		console.log(myWeight);
		var bmiHeight = myHeight/100;
		var myBMI = myWeight/(bmiHeight*bmiHeight);
		$('#myBMI').val(myBMI);
	});
	
	//close를 눌렀을 때 사이드바 사라짐
	function contextClose(){
		document.getElementById("contextMenu").style.display = 'none';
	}
	
	//칼로리 입력 페이지로 이동
	function calorieInput(){
		location.href = "calorieInput.doa?clickDate="+clickDate;
	}
</script>
    
    
    
</body>
</html>