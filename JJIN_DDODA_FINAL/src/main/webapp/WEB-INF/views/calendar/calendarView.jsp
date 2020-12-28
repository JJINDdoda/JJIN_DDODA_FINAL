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
    
	<script>

	//today : 오늘 날짜
    var now = new Date();
    var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
    var today = year + '-' + mon + '-' + day;
    
    console.log(today);
	
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var userId = $('#userId').val();
    var opendiaryNo;
    var events = [${events}];

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      //defaultDate: '2020-12-12',   달력 로드될 때,기본으로 표기하는 값 미지정 시 현재 날짜 
      //navLinks : true,	달력상의 날짜를 클릭할 수 있는지 여부, 클릭 시 일/주달력으로 넘어감 boolean 
      editable: true,	//boolean, 이벤트드래그, 리사이징 등의 편집 여부를 설정함
      eventLimit: true, // boolean, 달력에 셀크기보다 많은 이벤트 존재 시 +more로 표기함
      selectable: true,
      droppable: true,
      
     
	    /* ****************
	     *  일기 일정 받아옴 
	     * ************** */
	    events: function (info, successCallback, failureCallback) {
	      $.ajax({
	        type: "get",
	        url: "diaryList.doa",
	        data: {
	          "userId" : userId
	        },
	        dataType : "json",
	        success: function (data) {
	          if(data !=null) {
		          $.each(data, function(index, element) {
		        	  events.push({
		        		  _id : element.opendiaryNo,
		        		  title : '<일기> '+element.opendiaryTitle,
		        		  start : element.opendiaryDate,
		        		  description : element.opendiaryContents,
		        		  end : element.opendiaryDate,
		        		  backgroundColor: "#7bb8b3",
		        		  borderColor : "#7bb8b3",
		        		  imageurl : "/resources/diaryUploadFiles/"+userId+"/"+element.mainImagePath
		        	  });
		         });
	          }
	         successCallback(events);
	        }
	      });
	    },
	    
	    eventClick : function(info) {
		    for(var i = 0 ; i<events.length ; i++){
		    	if(events[i].title == info.event.title) {
		    		if(events[i].mainImagePath != ""){
				    	$(info.el).popover({
				    		title : events[i].start + events[i].title,
				    		placement : 'top',
				    		trigger : 'hover',
				    		content : $('<div />')
				    			.append('<p><img src="'+events[i].imageurl+'" alt="사진이 없습니다."> </p>')
				    			.append('<div> '+events[i].description+'</div>'),
				    		container : 'body',
				    		html : true
				    	}).popover('show');
		    		} 
		    	console.log(events[i].imageurl);
		    	}
		    }
		},
		select : function(info, jsEvent, view){
	    	var date = info.startStr; //클릭한 날짜 = date
	    	if(date == today){
	    		for(var i in events){
	    			console.log(events[i].start);
	    			if(events[i].start !== today) {
	    				$(".fc-body").unbind('click');
						$(".fc-body").on('click', 'td', function (e) {
						      $("#contextMenu")
						        .addClass("contextOpened")
						        .css({
						          display: "block",
						          left: e.pageX,
						          top: e.pageY
						        });
						      return false;
						    });
	    				return false;
	    			}
	    		}
    		} else if(date != today) {
	    	for(var i in events){
	    		if(events[i].start == date){ // 받아온 값의 날짜 == 클릭한 날짜
	    			$(".fc-body").unbind('click');
					$(".fc-body").on('click', 'td', function (e) {
					      $("#contextMenu_detail")
					        .addClass("contextOpened")
					        .css({
					          display: "block",
					          left: e.pageX,
					          top: e.pageY
					        });
					      return false;
					    });
					opendiaryNo = events[i]._id;
					console.log(opendiaryNo);
	    		} 
	    	}
    		}
		},
		dateClick: function(info) {
		      //alert('clicked ' + info.dateStr);
		        clickDate = info.dateStr;
		        $('#changeDate').val(clickDate);
		        console.log(clickDate);
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
  //날짜 클릭시 카테고리 선택메뉴
    var $contextMenu_detail = $("#contextMenu_detail");
  	
  	/* console.log(opendiaryNo); */
    $contextMenu_detail.on("click", "a", function (e) {
      e.preventDefault();

  	    if ($(this).data().role !== 'close' ) {
  	    	updateEvent(opendiaryNo, $(this).html());
  	    } 
  	      $contextMenu_detail.removeClass("contextOpened");
  	      $contextMenu_detail.hide();
    });

    $('body').on('click', function () {
      $contextMenu_detail.removeClass("contextOpened");
      $contextMenu_detail.hide();
    });
    calendar.render();
  });

  function insertEvent(htmls) {
	  if(htmls =='일기작성'){
		  location.href="diaryView.doa?date="+today;
	  } 
  }
  function updateEvent(opendiaryNo,html) {
	  if(html == '일기작성'){
		  location.href="myDiaryDetail.doa?opendiaryNo="+opendiaryNo;
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
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  
  #contextMenu {
    	position: fixed;
    	display: none;
    	z-index: 2;
    	margin-left: 150px;
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
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->

	<!-- content -->	
	<%-- <div class="content" style="margin-left:2%;margin-right:2%;height:900px;">

   	<div class="container" style="float:left;width:200px;">
	<input type="hidden" id="userId" name="userId" value="${loginUser.userId }"> --%>
        <!-- 일자 클릭시 메뉴오픈 -->
        <!-- <div id="contextMenu" class="dropdown clearfix" style="width:200px;margin-right:0px;position:absolute;z-index:2;display:none;">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일기쓰기</a></li>
                <li><a tabindex="-1" href="#">식단쓰기</a></li>
                <li class="menuBar"><a tabindex="-1" onclick="calorieInput()">칼로리입력</a></li>
                <li class="menuBar"><a tabindex="-1" onclick="changeMyInfo()">기본정보변경</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div> -->
        <!-- 일자 클릭시 수정 메뉴오픈 -->
        <!-- <div id="contextMenu_detail" class="dropdown clearfix" style="width:200px;margin-right:0px;position:absolute;z-index:2;display:none;">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#" class="detailMydiary">일기보기</a></li>
                <li><a tabindex="-1" href="#">식단보기</a></li>
                <li class="menuBar"><a tabindex="-1" class="detailMydiary" onclick="calorieInput()">칼로리입력</a></li>
                <li class="menuBar"><a tabindex="-1" class="detailMydiary" onclick="changeMyInfo()">기본정보변경</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div> -->
	<%-- </div>
	
	<div style="width:100%;float:left;text-align:center;margin:0 auto">
        <div id="calendar" style="margin:0 auto;"></div>
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
    </div> --%>
    <!-- /.container -->
    <!-- end content -->
    
    <div>
    	<input type="hidden" id="userId" name="userId" value="${loginUser.userId }">
		<div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li class="menuBar"><a tabindex="-1" style="height: 45px; padding-top: 15px;" href="#">일기작성</a></li>
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
	
	<!-- footer -->
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
    
    
    
    
</body>
</html>