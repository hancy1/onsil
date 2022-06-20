<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- jQuery library--> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- jQuery library--> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<!-- Title -->
<title>온실 - 전시회</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<!-- Title -->
<title>온실 - 박람회</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>박람회</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${ pageContext.servletContext.contextPath }"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">박람회</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
		  
		   <div class="container">
            <div class="row">
                <div class="col-lg-3">
<a class="product-img" href="resources/T_upload_files/${t.changeName}" title="Exhibition Image">
                                 <img class="d-block w-100" src="${ pageContext.servletContext.contextPath }/resources/T_upload_files/${t.changeName}" alt="1">
                              </a>
                </div>
	      <div class="col-md-6">
				<h3>${ t.ticketTitle }</h3>
				<input id="ticketNo" type="hidden" name="ticketNo"value="${t.ticketNo}"> 
				<p> <b>구분 : </b><span class="badge badge-danger">
				${ t.division }</span>
				<p> <b>주소</b> : ${ t.ticketLocation }
				<p> <b>전화번호</b> : ${ t.ticketPhone }
				
			    <p> <b>소개</b> :${ t.ticketNotice }
               <p> <a href="reservation.do?ticketNo=${ t.ticketNo }" class="btn btn-info"> 예약 &raquo;</a>					
               <a href= "exhibition.do" class="btn btn-secondary">티켓목록 &raquo;</a>
				<button type="button" onclick="location.href='ticketAddress.do' " class="btn btn-primary">위치확인</button>
					 
			</div>
	
			<form action="" id="postForm" method="post" class="reservation_form">
				<input id="ticketNo" type="hidden" name="ticketNo"value="${t.ticketNo}"> 
				<input type="hidden" name="userNo"value="${ sessionScope.loginUser.userNo }"> 
				<input type="hidden" name="amount" value="1">
			</form>
		
			
		
			<hr>
			
		
			<hr>	
		</div>
	</div>


<!-- ##### Shop Area End ##### -->
	
	

	<jsp:include page="../common/footer.jsp" />
	
	
	
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