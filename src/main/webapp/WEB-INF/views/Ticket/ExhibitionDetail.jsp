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
<title>온실 - 전시회</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>전시회</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${ pageContext.servletContext.contextPath }"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">전시회</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- ##### Shop Area Start ##### -->
	<section class="exhibition-page section-padding-0-100">
		<div class="container">
			<div class="row">
				
			<div class="row">
				<!-- Sidebar Area -->
				<div class="col-12 col-md-4 col-lg-3">
					<div class="exhibition-sidebar-area">

					



						<!-- Shop Widget -->
						<div class="shop-widget sort-by mb-50">
							<h4 class="widget-title">Sort by</h4>
							<div class="widget-desc">
								<!-- Single Checkbox -->
								<div
									class="custom-control custom-checkbox d-flex align-items-center mb-2">
									<input type="checkbox" class="custom-control-input"
										id="customCheck7"> <label class="custom-control-label"
										for="customCheck7">New arrivals</label>
								</div>
								<!-- Single Checkbox -->
								<div
									class="custom-control custom-checkbox d-flex align-items-center mb-2">
									<input type="checkbox" class="custom-control-input"
										id="customCheck8"> <label class="custom-control-label"
										for="customCheck8">Alphabetically, A-Z</label>
								</div>
								<!-- Single Checkbox -->
								<div
									class="custom-control custom-checkbox d-flex align-items-center mb-2">
									<input type="checkbox" class="custom-control-input"
										id="customCheck9"> <label class="custom-control-label"
										for="customCheck9">Alphabetically, Z-A</label>
								</div>
								<!-- Single Checkbox -->
								<div
									class="custom-control custom-checkbox d-flex align-items-center mb-2">
									<input type="checkbox" class="custom-control-input"
										id="customCheck10"> <label
										class="custom-control-label" for="customCheck10">Price:
										low to high</label>
								</div>
								<!-- Single Checkbox -->
								<div
									class="custom-control custom-checkbox d-flex align-items-center">
									<input type="checkbox" class="custom-control-input"
										id="customCheck11"> <label
										class="custom-control-label" for="customCheck11">Price:
										high to low</label>
								</div>
							</div>
						</div>

						<!-- exhibition Widget -->
						<div class="shop-widget best-seller mb-50">
							<h4 class="widget-title">Best Seller</h4>
							<div class="widget-desc">

								<!-- Single Best Seller exhibition -->
								<div
									class="single-best-seller-product d-flex align-items-center">
									<div class="product-thumbnail">
										<a href="shop-details.html"><img src="resources/img/bg-img/4.jpg"
											alt=""></a>
									</div>
									<div class="product-info">
										<a href="shop-details.html">Cactus Flower</a>
										<p>$10.99</p>
										<div class="ratings">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
								</div>

								<!-- Single Best Seller exhibition -->
								<div
									class="single-best-seller-product d-flex align-items-center">
									<div class="product-thumbnail">
										<a href="shop-details.html"><img src="resources/img/bg-img/5.jpg"
											alt=""></a>
									</div>
									<div class="product-info">
										<a href="shop-details.html">Tulip Flower</a>
										<p>$11.99</p>
										<div class="ratings">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
								</div>

								<!-- Single Best Seller Products -->
								<div
									class="single-best-seller-product d-flex align-items-center">
									<div class="product-thumbnail">
										<a href="shop-details.html"><img src="resources/img/bg-img/34.jpg"
											alt=""></a>
									</div>
									<div class="product-info">
										<a href="shop-details.html">Recuerdos Plant</a>
										<p>$9.99</p>
										<div class="ratings">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				 <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                	<a class="product-img" href="resources/T_upload_files/${t.changeName}" title="Exhibition Image">
											<img class="d-block w-100" src="${ pageContext.servletContext.contextPath }/resources/T_upload_files/${t.changeName}" alt="1">
										</a>
                </div>
	<table class="listArea">
						<tr>
							<th>전시회이름</th>
							<td><div class="detailForm">${ t.ticketTitle } </div></td>
						</tr>
						<tr>
							<th>장소</th>
							<td><div class="detailForm">${ t.ticketLocation} </div></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><div class="detailForm">${ t.price} </div></td>
						</tr>
						<tr>
							<th>문의전화번호</th>
							<td><div class="detailForm">${ t.ticketPhone}  </div></td>
						</tr>
						
						
						
					</table>
	
		
			<hr>
			
			<div class="row">
				<div class="selected_option" style="text-align: right;">
				</div>
				<div style="text-align: center;">
				
                   <button type="button" onclick="location.href='reservation.do' " class="btn btn-primary">예약하기</button>
				</div>
			</div>
			<hr>	
		</div>
	</div>
</section>

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