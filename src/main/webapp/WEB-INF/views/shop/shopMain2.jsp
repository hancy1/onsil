<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>


<head>
<meta charset="UTF-8">

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<!-- Title -->
<title>온실 - Gardening SHOP</title>

</head>

<body>

	<jsp:include page="../common/menubar.jsp" />

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>Shop</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${ pageContext.servletContext.contextPath }"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">구매하기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- ##### Shop Area Start ##### -->
	<section class="shop-page section-padding-0-100">
		<div class="container">
			<div class="row">
				<!-- Shop Sorting Data -->
				<div class="col-12">
					<div
						class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
						<!-- Shop Page Count -->
						<div class="shop-page-count">
							<p>Showing</p>
						</div>
						<!-- Search by Terms -->
						<div class="search_by_terms">
							 <form action="#" method="post" class="form-inline">
                                <select class="custom-select widget-title">
                                  <option selected>전체보기</option>
                                  <option value="1">나무</option>
                                  <option value="2">식용</option>
                                  <option value="3">꽃</option>
                                  <option value="4">기타(영양제,화분)</option>
                                </select>

                            </form>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<!-- Sidebar Area -->
				<div class="col-12 col-md-4 col-lg-3">
					<div class="shop-sidebar-area">

						<!--가격순보기
                        <div class="shop-widget price mb-50">
                            <h4 class="widget-title">Prices</h4>
                            <div class="widget-desc">
                                <div class="slider-range">
                                    <div data-min="8" data-max="30" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="8" data-value-max="30" data-label-result="Price:">
                                        <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all first-handle" tabindex="0"></span>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                    </div>
                                    <div class="range-price">Price: $8 - $30</div>
                                </div>
                            </div>
                        </div>
                        -->



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

						<!-- Shop Widget -->
						<div class="shop-widget best-seller mb-50">
							<h4 class="widget-title">Best Seller</h4>
							<div class="widget-desc">

								<!-- Single Best Seller Products -->
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

								<!-- Single Best Seller Products -->
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

				<!-- All Products Area -->
				<div class="col-12 col-md-8 col-lg-9">
					<div class="shop-products-area">
						<div class="row">

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/40.png"
											alt=""></a>
										<!-- Product Tag -->
										<div class="product-tag">
											<a href="#">Hot</a>
										</div>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/41.png"
											alt=""></a>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/42.png"
											alt=""></a>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/43.png"
											alt=""></a>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/44.png"
											alt=""></a>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/45.png"
											alt=""></a>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/46.png"
											alt=""></a>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/47.png"
											alt=""></a>
										<!-- Product Tag -->
										<div class="product-tag sale-tag">
											<a href="#">Sale</a>
										</div>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>

							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">
										<a href="shop-details.html"><img src="resources/img/bg-img/48.png"
											alt=""></a>
										<div class="product-meta d-flex">
											<a href="#" class="wishlist-btn"><i
												class="icon_heart_alt"></i></a> <a href="cart.html"
												class="add-to-cart-btn">Add to cart</a> <a href="#"
												class="compare-btn"><i class="arrow_left-right_alt"></i></a>
										</div>
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a href="shop-details.html">
											<p>Cactus Flower</p>
										</a>
										<h6>$10.99</h6>
									</div>
								</div>
							</div>
						</div>

						<!-- Pagination -->
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#"><i
										class="fa fa-angle-right"></i></a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Shop Area End ##### -->


	<jsp:include page="../common/footer.jsp" />


</body>

</html>