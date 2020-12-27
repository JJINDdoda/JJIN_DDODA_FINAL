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

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var userId = $('#userId').val();
    
    //today : 오늘 날짜
    var now = new Date();
    var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
    var today = year + '-' + mon + '-' + day;

    console.log(today);
    
    var events = [];

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
	    eventRender : function(info) {
		    for(var i in events){
		    	console.log(events[i].imageurl);
		    	$(info.el).popover({
		    		title : $('<div />', {
		    			text : events[i].start + events[i].title
		    		}).append('<p><img src="'+events[i].imageurl+'"> </p>'),
		    		placement : 'top',
		    		trigger : 'hover',
		    		content : events[i].description,
		    		container : 'body',
		    		html : true
		    	}).popover('show');
		    }
		    },
	    select : function(info, jsEvent, view){
	    	var date = info.startStr; //클릭한 날짜 = date
			var arr = new Array();
	    	console.log(date+", "+today);
			for(var i in events) {
				var diarydate = events[i].start; //일기 이미 작성된 날짜 = diarydate 
				/* var opendiaryNp = events[i]._id; */
				if( diarydate == date) {		//클릭한 날짜에 작성된 일기가 있을 경우 
					/* alert(diarydate + ", "+date); */ //클릭한 날짜 = 이미 작성한 날짜 && 클릭한 날짜 < 현재 -> 수정하기
														//클릭한 날짜 > 현재 -> 클릭x
														//클릭한 날짜 = 이미 작성한 날짜 && 클릭한 날짜 = 현재 -> 수정하기
														//클릭한 날짜 != 이미 작성한 날짜 && 클릭한 날짜 = 현재 -> 새로 작성하기
						/* alert(date); */
					if(date < today && date == diarydate) {
						/* location.href='myDiaryDetail.doa?opendiaryNo='+events[i]._id; */
						/* alert(events[i].imageurl); */
						/* alert("이전입니다 ㅏ");  */
						$(".fc-body").unbind('click');
						$(".fc-body").on('click', 'td', function (e) {
						      $("#contextMenu_detail")
						        .addClass("contextOpenedd")
						        .css({
						          display: "block",
						          left: e.pageX,
						          top: e.pageY
						        });
						      return false;
						    });
						
					} else if(date == today && events[i].start == today) {
						alert("오늘입니다");
						console.log(events[i].imageurl);
					}
					//날짜 클릭시 카테고리 선택메뉴
				    var $contextMenu_detail = $("#contextMenu_detail");
				    $contextMenu_detail.on("click", "a", function (e) {
				      e.preventDefault();

				      
				    if ($(this).data().role !== 'close' ) {
				    	location.href="myDiaryDetail.doa?opendiaryNo="+events[i]._id;
				    } 

				      $contextMenu_detail.removeClass("contextOpened");
				      $contextMenu_detail.hide();
				    });

				    $('body').on('click', function () {
				      $contextMenu_detail.removeClass("contextOpened");
				      $contextMenu_detail.hide();
				    });
				} else if(diarydate != date && date == today) {	//클릭한 날짜가 오늘이고 작성한 일기가 없을 경우
					/* alert("어어어없어"); */
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
					  //날짜 클릭시 카테고리 선택메뉴
					    var $contextMenu = $("#contextMenu");
					    $contextMenu.on("click", "a", function (e) {
					      e.preventDefault();

					      if ($(this).data().role = '일기쓰기') {
					    	  location.href="diaryView.doa?date="+date;
					      }

					      $contextMenu.removeClass("contextOpened");
					      $contextMenu.hide();
					    });

					    $('body').on('click', function () {
					      $contextMenu.removeClass("contextOpened");
					      $contextMenu.hide();
					    });  
				}
				arr[i]=events[i].start;
				/* if(events[i].start != today && date == today){
					/* location.href="diaryView.doa?date="+today; */
					/* alert(events[i].start);
					return false; 
				} */
			}
			
	    	
	    },
	  locale : 'ko'
    });

    calendar.render();
  });

 
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

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br><br><br><br>
	<!-- end header -->

	<!-- content -->	
	<div class="content" style="margin-left:2%;margin-right:2%;height:900px;">

   	<div class="container" style="float:left;width:200px;">
	<input type="hidden" id="userId" name="userId" value="${loginUser.userId }">
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix" style="width:200px;margin-right:0px;position:absolute;z-index:2;display:none;">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일기쓰기</a></li>
                <li><a tabindex="-1" href="#">식단쓰기</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>
        <!-- 일자 클릭시 수정 메뉴오픈 -->
        <div id="contextMenu_detail" class="dropdown clearfix" style="width:200px;margin-right:0px;position:absolute;z-index:2;display:none;">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#" class="detailMydiary">일기보기</a></li>
                <li><a tabindex="-1" href="#">식단보기</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>
	</div>
	
	<div style="width:80%;float:left;">
        <div id="calendar"></div>
    </div>
    </div>
    <!-- /.container -->
    <!-- end content -->
	
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