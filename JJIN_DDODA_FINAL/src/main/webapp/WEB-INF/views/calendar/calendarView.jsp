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

		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
		    selectable: true,
		    header: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay'
		    },
		    dateClick: function(info) {
		    	
		     /*  alert('clicked ' + info.dateStr);
		      
		    	val dateStr = $('info.dateStr').val(); */
		    	location.href= 'dailyDietInfoWrite.doa?dateStr='+info.dateStr;
		    }
		/*     select: function(info) {
		      alert('selected ' + info.startStr + ' to ' + info.endStr);
		    } */
		  });

		  calendar.render();
		});
</script>

</head>
<title>Ä¶¸°´õ ºä</title>
<body>
	<c:import url="../common/menubar.jsp"></c:import>
	<div style="display:inline-block;">	
		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		
		<div id='calendar' style="margin-left: 100px; margin-top:40px; align:center; background-color: #FBF2EA;  max-width:1000px;  border-radius: 10px;float:left;"></div>
	</div>
	

</body>
<script>
function onchangeDay(yy,mm,dd,ss){ 
	 alert(yy+"³â"+mm+"¿ù"+dd+"ÀÏ("+ss+"¿äÀÏ)"); 
}
	
$(function(){

});
</script>

</html>