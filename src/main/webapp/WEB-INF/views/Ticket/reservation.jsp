<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title -->
<title>온실 - 예약</title>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.basketdiv {
	width: 100%;
	border-top: 1px solid #e0e0e0;
	float: left;
	font-size: 0.9375em;
	margin-bottom: 20px;
}

.basketdiv .row.head {
	border-bottom: 2px solid #888;
	box-sizing: border-box;
	background-color: #f4f4f4;
	font-weight: 500;
}

.basketdiv .data {
	border-bottom: 1px dashed #888;
	box-sizing: border-box;
	cursor: pointer;
	float: left;
	width: 100%;
}

.basketdiv .data .empty {
	text-align: center;
	padding: 12px 0;
}

.basketdiv .row.head .subdiv {
	background-color: #f4f4f4;
}

.basketdiv .row>.subdiv {
	display: block;
	float: left;
}

.basketdiv .row>.subdiv:nth-child(1) {
	width: 50%;
}

.basketdiv .row>.subdiv:nth-child(2) {
	width: 40%;
}

.basketdiv .row>.subdiv:nth-child(3) {
	width: 10%;
}

.basketdiv2 .row>.subdiv:nth-child(1) {
	width: 60%;
}

.basketdiv2 .row>.subdiv:nth-child(2) {
	width: 40%;
}

.basketdiv .row>div>div {
	display: block;
	float: left;
	text-align: center;
	margin: 0;
	padding: 12px 0;
}

.basketdiv .row.data>div>div {
	height: 60px;
	line-height: 60px;
}

.basketdiv .data .num .updown {
	color: #0075ff;
	font-size: 2em;
	letter-spacing: -5px;
}

.basketdiv .check {
	width: 10%;
}

.basketdiv .check input[type=checkbox] {
	transform: scale(1.5);
}

.basketdiv .img {
	width: 20%;
}

.basketdiv .pname {
	width: 70%;
}

.basketdiv2 .pname {
	width: 80%;
}

.basketdiv .basketprice {
	width: 33%;
}

.basketdiv .num {
	width: 33%;
	min-width: 105px;
}

.basketdiv .sum {
	width: 34%;
	max-width: 80px;
	color: #0000aa;
}

.basketdiv .point {
	width: 50%;
}

.basketdiv2 .basketprice {
	width: 25%;
}

.basketdiv2 .num {
	width: 25%;
}

.basketdiv2 .sum {
	width: 25%;
	color: #0000aa;
}

.basketdiv2 .point {
	width: 25%;
}

.basketdiv .basketcmd {
	width: 100%;
}

.basketdiv .data .pname {
	text-align: left !important;
	line-height: 1.2 !important;
}

.basketdiv .data .price, .basketdiv .data .sum, .basketdiv .data .point
	{
	text-align: right;
}

.baseform>tbody>tr>td:first-child {
	width: 100px;
}

.buttongroup {
	padding: 11px 0;
	margin: 50px 0;
}

.narrowbuttongroup {
	margin: 15px 0;
}

.buttongroup.center {
	text-align: center;
}

.buttongroup input[type=text], .buttongroup input[type=password] {
	height: 30px;
}

.buttongroup button, .buttongroup a {
	margin-right: 5px;
}

.buttongroup button:last-child, .buttongroup a:last-child {
	margin-right: 0;
}

.abutton, .abutton:link, .abutton:visited, .abutton:active, input[type=button]
	{
	background-color: #383838;
	border: 1px solid #888888;
	color: #ffffff;
	cursor: pointer;
	letter-spacing: -1px;
	padding: 3px 5px;
	margin: 2px 3px;
	width: auto;
	word-break: keep-all;
	border-radius: 5px;
	text-decoration: none;
	font-size: 0.9375em;
}

.abutton-alt {
	background-color: #d3e2c6;
}

.red {
	color: #b00;
}

.blue {
	color: #0075ff;
}

.basketrowcmd, .sumcount, .summoney {
	text-align: right;
	margin-bottom: 10px;
}

.sumcount, .summoney {
	font-size: 1.25em;
	font-weight: bold;
}

.buttongroup {
	text-align: center;
}

.buttongroup a {
	text-decoration: none;
}

.cmd a, .cmd span {
	padding: 12px 30px;
	box-sizing: border-box;
	margin-top: 10px;
	font-size: 1.2em;
	color: #000;
	background-color: #f4f4f4;
	border: 1px solid #e0e0e0;
	text-align: center;
}

.cmd.small a, .cmd.small span {
	padding: 6px 20px;
	font-size: 0.8125em;
}

#number {
  width:50px;
  hight:500px
  text-align: center;
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
			<h2>예약</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">예약</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	<div class="checkout_area mb-100">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-lg-7">
					<div class="checkout_details_area clearfix">
						<h5>예약하기</h5>
						
						
							<div class="row">

								<div class="col-12">
									<div class="d-flex align-items-center">
										<!-- Single Checkbox -->
										<div
											class="custom-control custom-checkbox d-flex align-items-center mr-30">
											<div class="form-check">
												<input style="width: 20px; height: 20px;" onclick="memberInfo();" type="checkbox" name="reservation" id="reservation1" > 
													<labe class="form-check-label" for="reservation1">
													회원 정보와 동일 </label>
											</div>
											<div class="form-check">
											  <input style="width:20px; height:20px;" type="checkbox" name="reservation" id="reservation2" >
											  <label class="form-check-label" >
											   직접입력
											  </label>
											</div>
											<form action="" id="postForm" method="post" class="reservation_form">
				                            <input id="ticketNo" type="hidden" name="ticketNo"value="${bno}">
				                            
				                            <input type="hidden" name="userNo"value="${ sessionScope.loginUser.userNo }"> 
				                            
			                                </form>
										<script>
					                           function addFormSubmit(num){
											
												var postForm = $("#postForm");

												if (num == 1) {
													postForm.attr("action","insertRV.do");
												} else {
													postForm.attr("action","deleteRV.do");
												}
												postForm.submit();
											}
					                           
					                           
					                           $(document).ready(function() {
					                        	   
					                        	   
					                        	   
					                        	   $('input[type="checkbox"][name="reservation"]').click(function(){
					                        	   
					                        	    if($(this).prop('checked')){
					                        	   
					                        	       $('input[type="checkbox"][name="reservation"]').prop('checked',false);
					                        	   
					                        	       $(this).prop('checked',true);
					                        	   
					                        	      }
					                        	    
					                        	     });
					                        	    
					                        	   });     
					                           
					                           
										</script>

									</div>
									</div>
								</div>
								<br> <br>
								
								<div class="col-12 mb-4">
									<label for="name">에약자 *</label> 
									<input type="text" class="form-control" id="name" name="name" value="" required>
								</div>

								<div class="col-12 mb-4">
									<label for="phone">핸드폰번호 *</label>
									 <input type="text" class="form-control" id="phone" name="phone" placeholder="" value="" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" required>
								</div>


								
								<div class="col-12 mb-4">
									<label for="email">이메일</label> <input type="email"
										class="form-control" id="email" name="email"
										placeholder="you@example.com" required>
									<div id="emailValid"></div>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
									
								</div>
								 <div class="col-12 mb-3">
                           <div class="form-group">
                           <label for="TCategory">수령방법</label>
                           <select name="TCategoryNo" class="form-control"  required>
                             
                               <option></option>
                               <option value="1">현장</option>
                               <option value="2">모바일</option>
                              
                               </select>
                                 </div>
                            </div>

								

								
							</div>
						
					</div>
				</div>
				<script>
					//멤버정보 불러오기		
					$('#reservation1').click(function() {
						if ($('#reservation1').is(':checked')) {
							
							$('#name').val("${ m.userName }");
							$('#phone').val("${ m.phone }");
							$('#email').val("${ m.email }");
							
						}
					});

					$('#reservation2').click(function() {
						if ($('#reservation1').is(':checked')) {
							
							$('#name').val("");
							$('#phone').val("");
							$('#email').val("");
							
						}
					});

					

                  
					
			
				</script>
				<div class="col-12 col-lg-4">
					<div class="checkout-content">
						<h5 class="title--">예약서</h5>
						<div class="reservation">
							<div class="reservation-data">
								<h5>전시회명: ${ r.ticketTitle }</h5>
								<div
									class="single-products d-flex justify-content-between align-items-center">
								    <p>어른:<input  type="number" min="1" max="10" id='number'></p>
								    <p>청소년:<input type="number" min="1" max="10" id='number'></p>
								    <p>어린이:<input type="number" min="1" max="10" id='number'></p>
                                    
                                    <p><fmt:formatNumber type="number" value="${p.price}"/></p>
                                </div>
							</div>

						</div>
						<div
							class="reservation check">
							<h5>총금액</h5>
							<h5>
								<c:set var="Total" value="${(result*20000)+(result1*15000)+(result2*8000)}" />
								<fmt:formatNumber type="number" value="${(result*20000)+(result1*15000)+(result2*8000)}" />
								원
							</h5>
						</div>
						<div class="checkout-btn mt-30">
						<button type="button" name="addReservation" onclick="addFormSubmit(1);"  class="btn alazea-btn ml-15">예약하기</button>
                          
                        
						</div>
					</div>
				</div>
			</div>
	
		</div>
	</div>

	
	<!-- ##### Cart Area End ##### -->


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