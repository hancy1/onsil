<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<!-- Title -->
<title>온실 - Gardening SHOP 상세페이지</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />


	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>SHOP DETAILS</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="listProducts.do">구매하기</a></li>
							<li class="breadcrumb-item active" aria-current="page">제품상세</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	
	<!-- ##### Single Product Details Area Start ##### -->
	<section class="single_product_details_area mb-50">
		<div class="produts-details--content mb-50">			
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-12 col-md-6 col-lg-5">					
						<div class="single_product_thumb">
							<div id="product_details_slider" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<a class="product-img" href="resources/pro_upload_files/${shop.detailCha}" title="Product Image">
											<img class="d-block w-100" src="${ pageContext.servletContext.contextPath }/resources/pro_upload_files/${shop.detailCha}" alt="1">
										</a>
									</div>
									
								</div>
								<ol class="carousel-indicators">
									<li class="active" data-target="#product_details_slider"
										data-slide-to="0"
										style="background-image: url(resources/pro_upload_files/${shop.detailCha});"></li>
									
								</ol>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="single_product_desc">
							<h4 class="title">${ shop.proName }</h4>
							<h4 class="price"><fmt:formatNumber type="number" value="${ shop.price }"/></h4>
							<div class="short_overview">
								<p> 현재 남은 수량은 ${ shop.proAmount }개 입니다. </p>
							</div>

							<div class="cart--area d-flex flex-wrap align-items-center">
								<!-- Add to Cart Form -->
								<form class="cart clearfix d-flex align-items-center"
									method="post">
									<div class="quantity">
										<span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;">
										<i class="fa fa-minus" aria-hidden="true"></i>
										</span>
										<input type="number" class="qty-text" id="qty" step="1" min="1" max="12" name="quantity" value="1">
										
										<span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;">
										<i class="fa fa-plus" aria-hidden="true"></i>
										</span>
										
									</div>
									<button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15">Add to cart</button>
									<button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15">바로구매</button>
								</form>
								
							</div>

							<div class="products--meta">
							
								<p>
									<span>Category:</span> <span>${ shop.cateName }</span>
								</p>
								<p>
									<span>productCode:</span> <span>${ shop.proCode } </span>
								</p>
								
							</div>

						</div>
					</div>
				</div>
			</div>		
		</div>
			
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							
							<li class="nav-item">
							<a href="#description" class="nav-link active" data-toggle="tab" role="tab">Information</a>
							</li>
							<!--  
							<li class="nav-item"><a href="#addi-info" class="nav-link"
								data-toggle="tab" role="tab">Additional Information</a></li>-->
								
							<li class="nav-item"><a href="#reviews" class="nav-link" data-toggle="tab" role="tab">
							Reviews <span class="text-muted">(${ rCount })</span></a>
							</li>
							
						</ul>
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active"
								id="description">
								<div class="description_area">
									<p>${ shop.proContent }</p>
								</div>
							</div>
							
							<!--  
							<div role="tabpanel" class="tab-pane fade" id="addi-info">
								<div class="additional_info_area">
									<p>
										What should I do if I receive a damaged parcel? <br> <span>Lorem
											ipsum dolor sit amet, consectetur adipisicing elit.
											Reprehenderit impedit similique qui, itaque delectus labore.</span>
									</p>
									<p>
										I have received my order but the wrong item was delivered to
										me. <br> <span>Lorem ipsum dolor sit amet,
											consectetur adipisicing elit. Facilis quam voluptatum beatae
											harum tempore, ab?</span>
									</p>
									<p>
										Product Receipt and Acceptance Confirmation Process <br>
										<span>Lorem ipsum dolor sit amet, consectetur
											adipisicing elit. Dolorum ducimus, temporibus soluta impedit
											minus rerum?</span>
									</p>
									<p>
										How do I cancel my order? <br> <span>Lorem ipsum
											dolor sit amet, consectetur adipisicing elit. Nostrum eius
											eum, minima!</span>
									</p>
								</div>
							</div>
							-->
							
							
							<div role="tabpanel" class="tab-pane fade" id="reviews">
								<c:forEach items="${ list }" var="r">
								<div class="reviews_area">
									<ul>  
										<li>
											<div class="single_user_review mb-15">
												<div class="review-rating">													
													<c:forEach var="star" begin="1" end="${ r.reviewStar }">
														<c:out value="⭐" />
													</c:forEach>
													<span>${ r.reviewTitle }</span>
												</div>
												<div class="review-details">
													<p>
													 <i class="bi bi-eye"></i><a href="#">${ r.reviewCount }</a> <span>${ r.reviewDate }</span>
													</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</c:forEach>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<!-- ##### Single Product Details Area End ##### -->
	


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