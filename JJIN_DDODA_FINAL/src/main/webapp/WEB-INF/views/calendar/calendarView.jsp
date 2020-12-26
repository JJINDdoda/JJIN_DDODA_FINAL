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
		    
		    //today : ���� ��¥
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
		    editable: true,	//boolean, �̺�Ʈ�巡��, ������¡ ���� ���� ���θ� ������
		    eventLimit: true, // boolean, �޷¿� ��ũ�⺸�� ���� �̺�Ʈ ���� �� +more�� ǥ����
		    header: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay'
		    },
		    /* ****************
		     *  �ϱ� ���� �޾ƿ� 
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
				        		  title : '<�ϱ�> '+element.opendiaryTitle,
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
		    	//���������� ����������פ��� 
		     /*  alert('clicked ' + info.dateStr);
		      
		    	val dateStr = $('info.dateStr').val(); */
		    	/* location.href= 'dailyDietInfoWrite.doa?dateStr='+info.dateStr; */
		    	var date = info.dateStr; //Ŭ���� ��¥
				var arr = new Array();
				
				for(var i in events) {
					var diarydate = events[i].start; //�ϱ� �� ��¥
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
<title>Ķ���� ��</title>
<body>
	<c:import url="../common/menubar.jsp"></c:import>
	<div style="display:inline-block;">	
		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		
		<div id='calendar' style="margin-left: 100px; margin-top:40px; align:center; background-color: #FBF2EA;  max-width:1000px;  border-radius: 10px;float:left;"></div>
	</div>
	

</body>
<script>
function onchangeDay(yy,mm,dd,ss){ 
	 alert(yy+"��"+mm+"��"+dd+"��("+ss+"����)"); 
}
	
$(function(){

});
</script>

</html>