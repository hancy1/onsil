<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/fullcalendar-5.0.1/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar-5.0.1/lib/main.js'></script>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session" />
	</c:if>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>${ hostUser }님의 정원</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<!-- 이 부분 나중에 수정..? -->
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="gardenMain.do">정원 메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page">내식물관리</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<div class="container">
		<div class="row">
		<div class="col-9 my-3">
			<div id="calendar">
			</div>
		</div>
		<div class="col-3 my-3">
			<div id="calendarList">
			</div>
		</div>
		</div>
	</div>
	<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

      document.addEventListener('DOMContentLoaded', function() {
    	    var calendarEl = document.getElementById('calendarList');

    	    var calendar = new FullCalendar.Calendar(calendarEl, {

    	      headerToolbar: {
    	        left: 'prev,next today',
    	        center: 'title',
    	        right: 'listDay,listWeek'
    	      },

    	      // customize the button names,
    	      // otherwise they'd all just say "list"
    	      views: {
    	        listDay: { buttonText: 'list day' },
    	        listWeek: { buttonText: 'list week' }
    	      },

    	      initialView: 'listWeek',
    	      initialDate: '2020-06-12',
    	      navLinks: true, // can click day/week names to navigate views
    	      editable: true,
    	      dayMaxEvents: true, // allow "more" link when too many events
    	      events: [
    	        {
    	          title: 'All Day Event',
    	          start: '2020-06-01'
    	        },
    	        {
    	          title: 'Long Event',
    	          start: '2020-06-07',
    	          end: '2020-06-10'
    	        },
    	        {
    	          groupId: 999,
    	          title: 'Repeating Event',
    	          start: '2020-06-09T16:00:00'
    	        },
    	        {
    	          groupId: 999,
    	          title: 'Repeating Event',
    	          start: '2020-06-16T16:00:00'
    	        },
    	        {
    	          title: 'Conference',
    	          start: '2020-06-11',
    	          end: '2020-06-13'
    	        },
    	        {
    	          title: 'Meeting',
    	          start: '2020-06-12T10:30:00',
    	          end: '2020-06-12T12:30:00'
    	        },
    	        {
    	          title: 'Lunch',
    	          start: '2020-06-12T12:00:00'
    	        },
    	        {
    	          title: 'Meeting',
    	          start: '2020-06-12T14:30:00'
    	        },
    	        {
    	          title: 'Happy Hour',
    	          start: '2020-06-12T17:30:00'
    	        },
    	        {
    	          title: 'Dinner',
    	          start: '2020-06-12T20:00:00'
    	        },
    	        {
    	          title: 'Birthday Party',
    	          start: '2020-06-13T07:00:00'
    	        },
    	        {
    	          title: 'Click for Google',
    	          url: 'http://google.com/',
    	          start: '2020-06-28'
    	        }
    	      ]
    	    });

    	    calendar.render();
    	  });
</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
<jsp:include page="../common/footer.jsp" />
<!-- i태그 이미지 cdn -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="resources/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="resources/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="resources/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="resources/js/active.js"></script>
</body>
</html>