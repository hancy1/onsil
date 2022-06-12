<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>온실 - Garden</title>
    
    <link href='resources/fullcalendar-5.0.1/lib/main.css' rel='stylesheet' />
	<script src='resources/fullcalendar-5.0.1/lib/main.js'></script>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/icon.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/garden1.jpg);">
			<h2>${ hostUser }님의 정원</h2><!-- 나중에 이름 수정 -->
		</div>

		<div class="container">
			<div class="row">
				<div class="col-10">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">정원 메인화면</li>		
						</ol>
					</nav>	
				</div>
				<c:if test="${hostUser ne loginUser.userId}">
				<div class="col-2">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='gardenMain.do?hostUser=${loginUser.userId}'">내 정원 바로가기</button></li>
						</ol>
					</nav>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    <!-- ##### Portfolio Area Start ##### -->
    <section class="alazea-portfolio-area portfolio-page section-padding-0-100">

        <div class="container">
            <!-- <div class="row">
                <div class="col-12">
                    <div class="alazea-portfolio-filter">
                        <div class="portfolio-filter">
                            <button class="btn active" data-filter="*">모두보기</button>
                            <button class="btn" data-filter=".design">캘린더</button>
                            <button class="btn" data-filter=".garden">방명록</button>
                            <button class="btn" data-filter=".home-design">데일리로그</button>                       
                        </div>
                    </div>
                </div>
            </div> -->
            
		<div class="row">
			<div class="col-9 my-3">
				<div id="calendar">
				</div>
			</div>
			<div class="col-3 my-3">
				<br>
				<div class="col">
				<c:if test="${loginUser.userId eq hostUser}">
				<hr>
				<div id="insert">
				<form id="enrollForm" method="post" action="insertPlantGrow.do">
                <table align="center">                    
                    <tr>
                    	<td colspan="2">
                    		<select id="info" name="plantNo" onchange="selectInfo();">
                    		<option value="0">식물을 선택하세요</option>
                    		<c:forEach items="${plant}" var="plant">
                    			<option value="${plant.plantNo}">[${plant.plantName}]${plant.nickname}</option>
                    		</c:forEach>
                    		</select>	
                    	</td>
                    </tr>
                    <tr>
                    	<th><label for="water">물주기</label></th>
                    	<td><input type=checkbox name="water" id="water"></td>
                    </tr>
                    <tr>
                    	<th><label for="supplement">영양제</label></th>
                    	<td><input type=checkbox name="supplement" id="supplement"></td>
                    </tr>
                    <tr>
                    	<th><label for="repotting">분갈이</label></th>
                    	<td><input type=checkbox name="repotting" id="repotting"></td>
                    </tr>
                    <tr>
                    	<td colspan="2"><textarea name="etc" cols="30" placeholder=" 비고사항"></textarea></td>
                    </tr>
                    <tr>
                    	
                    	<td>관리일 : <input type="date" name="enrollDate" id="enrollDate"></td>
                    	<input type="hidden" name="userNo" value="${loginUser.userNo}">
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-success btn-sm submitBtn" disabled>등록</button>
                    <button type="reset" class="btn btn-success btn-sm">취소</button>
                </div>
            </form>	
				</div>
				</c:if>
				<hr>
				<h6 align="center">관리내역</h6>
				<div id="plant">
				</div>
				</div>
			</div>
		</div>
<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script>	

	function selectInfo(){
		var select = document.getElementById('info')		
		var plantNo = select.options[select.selectedIndex].value;
		console.log(plantNo)

		if(plantNo > 0){
			$(".submitBtn").removeAttr("disabled");
		}
		
		if(plantNo <= 0){
			$(".submitBtn").attr("disabled", true);
		}
	}
	
	$(function(){
		
		if(${hostUser eq loginUser.userId}){
			//등록일을 오늘 날짜로
			document.getElementById('enrollDate').value = new Date().toISOString().substring(0, 10);
		}
		
		var today = new Date();
		
		var calendarEl = document.getElementById('calendar');
		// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth'
	      },
	      initialDate: today, // 초기 로딩 날짜.
	      //navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
	      select: function(arg) {
	    	  console.log(arg);

	        calendar.unselect()
	      },
	      eventMouseEnter: function(arg) {
	    	  
	    	  var plantName = arg.event.title;
	    	  var date = dateFormat(arg.event.start);
	    	  var list = arg.event.extendedProps.sourceId;
	    	  var div = document.getElementById('plant');
	    	  var plantNo = list[4];
	    	  
	    	  var value = "";
	    	 
	    	  value += "<h6>" + plantName + "</h6>" + 
	    	  		   "<h6>" + date + "</h6><br><h6>"  
   	  		   if(list[0] == 'Y'){
   	  			   value += "물주기 <i class='fa-solid fa-droplet'></i>";
   	  		   }else{
   	  			   value += "<br>";
   	  		   }
	    	   if(list[1] == 'Y'){
  	  			   value += "<br>영양제 <i class='fa-solid fa-prescription-bottle-medical'></i><br>";
  	  		   }else{
  	  			   value += "<br>";
  	  		   }
	    	   if(list[2] == 'Y'){
  	  			   value += "분갈이 <i class='fa-solid fa-seedling'></i><br>";
  	  		   }else{
  	  			   value += "";
  	  		   }

	    	   value += "</h6><br><h6>비고 : " ;
	    	   
	    	   if(list[3] != null){
	    		   value += list[3];
	    	   }else{
	    		   value += "없음";
	    	   }
	    	   value += "</h6><br><a type='button' href='myPlantDetail.do?plantNo=" + plantNo +"' style='color:green'>[자세히보기]</a>";
	    	  		   
	    	  
	    	  div.innerHTML = value;
	      },
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      events: 
	    	  $.ajax({
				  url: "selectCalendar.do",
				  method: "GET",
				  dataType: "json",
				  data : {hostUser:"${hostUser}"},
				  success : function(response){
					  console.log(response);
					  
					console.log(response[0]['enrollDate'])
					  for(i = 0; i < response.length; i++){
						  calendar.addEvent({
							  title: response[i]['nickname'],
							  sourceId: [response[i]['water'], response[i]['supplement'], response[i]['repotting'], response[i]['etc'], response[i]['plantNo']],
							  start: response[i]['enrollDate']
						  })
					  }
				  }
				})  
	  	});
	    calendar.render();
	});

	//날짜 포맷
	function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        //let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        //second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
}
      </script>
            
         	<!-- 방명록 -->
         	<c:if test="${ !empty board }">
         	<hr>
         	<h6 style="color:gray" align="center">정원의 메인화면에서는 최근 3개의 방명록만 확인이 가능합니다. <br>
         	더 많은 방명록은 <a href="visitorBoard.do" style="color:green">방명록 메뉴</a>에서 확인가능합니다.</h6>
         	</c:if>
         	<div class="row">
         		<div class="col-12">
         			<table class="table">
									<c:if test="${ !empty board }">
         								<c:forEach items="${board}" var="b">
	         								<tr style="background-color: lightgray" >
	         								<th><i class="fa-solid fa-comments"></i></th>
	         								<th><a href="gardenMain.do?hostUser=${b.writer}" style="color:green">${b.writer}</a></th>	
	         								<th>${b.content}</th>
	         								<th>${b.enrollDate}</th>
	         								</tr>
	         								<c:if test="${ !comment.isEmpty() }">
	         								<c:forEach items="${comment}" var="c">
	         								<c:if test="${ c.boardNo == b.boardNo}">
	         								<tr>
	         								<td>댓글</td>	
	         								<td><a href="gardenMain.do?hostUser=${c.userNo}" style="color:green">${c.userNo}</a></td>
	         								<td>${c.content}</td>						
	         								<td>${c.enrollDate}</td>
	         								</tr>
	         								</c:if>
	         								</c:forEach>	
	         								</c:if>		
	         							</c:forEach>	 
         							</c:if>
         							<c:if test="${ board.isEmpty() }">
									<tr><td colspan="4" align="center">작성된 방명록이 없습니다.</td></tr>
									</c:if>
								</table>
         		</div>
         	</div>   
			<hr>
            <div class="row alazea-portfolio">
            	<c:if test="${ !empty log }">
            	<c:forEach items="${log}" var="log">
                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-3 col-lg-3 single_portfolio_item design home-design">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/garden_upload_files/${log.serverName});"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="logDetail.do?logNo=${log.logNo}" class="d-flex align-items-center justify-content-center" title="DailyLog">
                            <div class="port-hover-text">
                                <h3><c:choose>
								<c:when test="${fn:length(log.content)>8}">
									<c:out value="${fn:substring(log.content,0,7)}"/>...
								</c:when>
								<c:otherwise>
									<c:out value="${log.content}"/>
								</c:otherwise>
							</c:choose></h3>
                                <h5>${fn:substring(log.enrollDate,0,16)}</h5>
                            </div>
                        </a>
                    </div>
                </div>
                </c:forEach>
                </c:if>
            </div>
            <c:if test="${ empty log }">
                <h6 style="color:gray" align="center">작성된 데일리로그가 없습니다.</h6>
            </c:if>
        </div>
    </section>
    <!-- ##### Portfolio Area End ##### -->
    <jsp:include page="../common/footer.jsp" />
    
    
    <!-- i태그 이미지 cdn -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
    <!-- ##### All Javascript Files ##### -->
	
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