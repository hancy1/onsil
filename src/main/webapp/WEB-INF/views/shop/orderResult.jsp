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


<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Title -->
<title>온실 - 결제완료 </title>

<style type="text/css">

	#content{	
	
	background-color: #E9ECEF;	
	border-radius: 30px 10px;
	
	}

</style>

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />


	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>ORDER RESULT</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="listProducts.do">구매하기</a></li>
							<li class="breadcrumb-item active" aria-current="page">주문하기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	

	<div class="container">	  
	  <div class="row" id="content">
	  
	    <div class="col"></div>
	    <div class="col">
	    	<br>
	      	<span style = " font-size:1.5em; color: green;">주문/결제가 완료 되었습니다.</span><br><br>	        	
        	${ sessionScope.loginUser.userName }님에게 ${ point }point가 적립되었습니다. <br>
        	이용해주셔서 감사합니다.<br><br>	        	
        	<a href="myOrderList.do">내 주문 확인하러 가기🚶‍♀️</a><br><br>
	    </div>
	    <div class="col"></div>
	    
	  </div>
	</div>
	<br><br><br><br>
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