<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Title -->
<title>온실</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

</head>

<body>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">

		<!-- ***** Top Header Area ***** -->
		<div class="top-header-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div
							class="top-header-content d-flex align-items-center justify-content-between">
							<!-- Top Header Content -->
							<div class="top-header-meta">
								<a href="#" data-toggle="tooltip" data-placement="bottom"
									title="onsil@gmail.com"><i
									class="fa fa-envelope-o" aria-hidden="true"></i> <span>Email:
										onsil@gmail.com</span></a> <a href="#" data-toggle="tooltip"
									data-placement="bottom" title="+82 234 122 122"><i
									class="fa fa-phone" aria-hidden="true"></i> <span>Call
										Kor: +82 234 122 122</span></a>
							</div>

							<!-- Top Header Content -->
							<div class="top-header-meta d-flex">
								<!-- Language Dropdown -->
								<!-- <div class="language-dropdown">
									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle mr-30"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Language</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton">
											<a class="dropdown-item" href="#">USA</a> <a
												class="dropdown-item" href="#">UK</a> <a
												class="dropdown-item" href="#">Bangla</a> <a
												class="dropdown-item" href="#">Hindi</a> <a
												class="dropdown-item" href="#">Spanish</a> <a
												class="dropdown-item" href="#">Latin</a>
										</div>
									</div>
								</div> -->
								<!-- Login -->
								<div class="login">
									<a href="login.do"><i class="fa fa-user" aria-hidden="true"></i> <span>Login</span></a>
								</div>
								<!-- 회원가입 -->
								<div class="join">
									<a href="enrollForm.do"><i class="fa fa-user" aria-hidden="true"></i> <span>Join</span></a>
								</div>
								<!-- Cart -->
								<div class="cart">
									<a href="#"><i class="fa fa-shopping-cart"
										aria-hidden="true"></i> <span>Cart <span
											class="cart-quantity">(1)</span></span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ***** Navbar Area ***** -->
		<div class="alazea-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="alazeaNav">

						<!-- Nav Brand -->
						<a href="index.jsp" class="nav-brand">
						<!-- 로고 나중에 바꾸기! -->
						<img src="resources/img/core-img/logo.png" alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Navbar Start -->
							<div class="classynav">
								<ul>									
						            <li><a href="#">상품</a>
										<ul class="dropdown">
											<li><a href="listProducts.do">구매하기</a></li>
											<li><a href="#">내 리뷰 보기</a></li>
											<li><a href="#">내 주문 내역</a></li>											
										</ul>
									</li>			
									<li><a href="#">예약</a></li>
									<li><a href="gardenMain.do">정원관리</a></li>
									<li><a href="#">자유게시판</a></li>
									<li><a href="#">질문게시판</a></li>
									<li><a href="#">고객센터</a>
										<ul class="dropdown">
											<li><a href="#">자주묻는질문</a></li>
											<li><a href="#">공지사항</a></li>
											<li><a href="#">문의사항</a></li>
											<li><a href="#">1:1 채팅</a></li>
										</ul>
									</li>
									
									<!-- 관리자메뉴. 관리자로 로그인했을 때만 보이게 설정 -->
									<li><a href="#">관리자메뉴</a>
										<ul class="dropdown">
											<li><a href="#">문의답변관리</a></li>
											<li><a href="#">공지관리</a></li>
											<li><a href="#">회원관리</a></li>
											<li><a href="#">판매제품관리</a></li>
											<li><a href="#">제품등록</a></li>
											<li><a href="#">제품수정</a></li>
											<li><a href="#">재고관리</a></li>
											<li><a href="#">매출관리</a></li>
											<li><a href="#">리뷰관리</a></li>
											<li><a href="#">신고된 게시글</a></li>
											<li><a href="#">티켓등록</a></li>
											<li><a href="#">후기관리</a></li>
											<li><a href="#">식물등록</a></li>
										</ul>
									</li> 
											<!-- 
											토글 예시를 위해 남겨뒀음											
											<li><a href="blog.html">Blog</a>
												<ul class="dropdown">
													<li><a href="blog.html">Blog</a></li>
													<li><a href="single-post.html">Blog Details</a></li>
												</ul></li> -->	
										
								</ul>

								<!-- Search Icon -->
								<div id="searchIcon">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div>

							</div>
							<!-- Navbar End -->
						</div>
					</nav>

					<!-- Search Form -->
					<div class="search-form">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type keywords &amp; press enter...">
							<button type="submit" class="d-none"></button>
						</form>
						<!-- Close Icon -->
						<div class="closeIcon">
							<i class="fa fa-times" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->
	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area">
		<div class="hero-post-slides owl-carousel">

			<!-- Single Hero Post -->
			<div class="single-hero-post bg-overlay">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(resources/img/bg-img/1.jpg);"></div>
				<div class="container h-100">
					<div class="row h-100 align-items-center">
						<div class="col-12">
							<!-- Post Content -->
							<div class="hero-slides-content text-center">
								<h2>Plants exist in the weather and light rays that
									surround them</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Curabitur pellentesque ante nec ipsum iaculis, ac iaculis ipsum
									porttitor. Vivamus cursus nisl lectus, id mattis nisl lobortis
									eu. Duis diam augue, dapibus ut dolor at, mattis maximus dolor.</p>
								<div class="welcome-btn-group">
									<a href="#" class="btn alazea-btn mr-30">GET STARTED</a> <a
										href="#" class="btn alazea-btn active">CONTACT US</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post bg-overlay">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(resources/img/bg-img/2.jpg);"></div>
				<div class="container h-100">
					<div class="row h-100 align-items-center">
						<div class="col-12">
							<!-- Post Content -->
							<div class="hero-slides-content text-center">
								<h2>Plants exist in the weather and light rays that
									surround them</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Curabitur pellentesque ante nec ipsum iaculis, ac iaculis ipsum
									porttitor. Vivamus cursus nisl lectus, id mattis nisl lobortis
									eu. Duis diam augue, dapibus ut dolor at, mattis maximus dolor.</p>
								<div class="welcome-btn-group">
									<a href="#" class="btn alazea-btn mr-30">GET STARTED</a> <a
										href="#" class="btn alazea-btn active">CONTACT US</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- ##### Hero Area End ##### -->




</body>

</html>