<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href='/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar/main.js'></script>
<link href='/resources/fullcalendar/daygrid.css' rel='stylesheet' />
<script src='/resources/fullcalendar/daygrid.js'></script>
<link href='/resources/fullcalendar/timegrid.css' rel='stylesheet' />
<script src='/resources/fullcalendar/timegrid.js'></script>
<script src='/resources/fullcalendar/interaction.js'></script>
<script>
/* 	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			defaultDate : new Date(),
			eventClick:function(event) {
                if(event.url) {
                    alert(event.title + "\n" + event.url, "wicked", "width=700,height=600");
                    window.open(event.url);
                    return false;
                }
            },
			header : {
				left : 'prev,next today',
				center : 'title',
				right : ''
			},
		});
		calendar.render();
	}); */
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
		    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
		    selectable: true,
		    editable: true,	//boolean, 이벤트드래그, 리사이징 등의 편집 여부를 설정함
		    eventLimit: true, // boolean, 달력에 셀크기보다 많은 이벤트 존재 시 +more로 표기함
		    header: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay'
		    },
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
		    dateClick: function(info) {
		    	//국영이한테 물어보기이이잉ㅇㅇ 
		     /*  alert('clicked ' + info.dateStr);
		      
		    	val dateStr = $('info.dateStr').val(); */
		    	/* location.href= 'dailyDietInfoWrite.doa?dateStr='+info.dateStr; */
		    	var date = info.dateStr; //클릭한 날짜
				var arr = new Array();
				
				for(var i in events) {
					var diarydate = events[i].start; //일기 쓴 날짜
					if( diarydate == date) {
						alert(diarydate + ", "+date);
						if(date < today) {
							/* location.href='myDiaryDetail.doa?opendiaryNo='+events[i]._id; */
							alert(events[i].imageurl);
						} 
					} 
					arr[i]=events[i].start;
					/* if(events[i].start != today && date == today){
						/* location.href="diaryView.doa?date="+today; */
						/* alert(events[i].start);
						return false; 
					} */
				}
				if($.inArray(date, arr) != -1) {
					for(var k=0;k<events.length;k++){
						if(events[k].start == date){
							alert(events[i].imageurl);
							location.href="myDiaryDetail.doa?opendiaryNo="+events[k]._id;
						}
					}			
					return false;
				} else {
					if(today == date) {
						alert(events[i].imageurl);
						location.href="diaryView.doa?date="+date;
					}
					return false;
				}
			    },
		/*     select: function(info) {
		      alert('selected ' + info.startStr + ' to ' + info.endStr);
		    } */
			    locale : 'ko'
		    
		  });

		  calendar.render();
		});
</script>

</head>
<title>캘린더 뷰</title>
<body>
	<c:import url="../common/menubar.jsp"></c:import>
	<div style="display:inline-block;">	
		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		
		<div id='calendar' style="margin-left: 100px; margin-top:40px; align:center; background-color: #FBF2EA;  max-width:1000px;  border-radius: 10px;float:left;"></div>
	</div>
	

</body>
<script>
function onchangeDay(yy,mm,dd,ss){ 
	 alert(yy+"년"+mm+"월"+dd+"일("+ss+"요일)"); 
}
	
$(function(){

});
</script>

</html>