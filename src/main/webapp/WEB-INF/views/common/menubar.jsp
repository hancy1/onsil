<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	<!-- Preloader 
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>-->

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
								
								<!-- 로그인 전 -->
               					 <c:if test="${ empty sessionScope.loginUser }">
									<!-- Login : login 페이지로 이동 -->
									<div class="login">
									
									
										<a href="loginForm.do"><i class="fa fa-user" aria-hidden="true"></i> <span>Login</span></a>
									</div>
									<!-- 회원가입 -->
									<div class="join">
										<a href="enrollForm.do"><i class="fa fa-user" aria-hidden="true"></i> <span>Join</span></a>
									</div>
								 </c:if>
								
								<!-- 로그인 후  -->
								 <c:if test="${ !empty sessionScope.loginUser }">
								 	<div class="login">								
										<a href="myPage.do"><i class="fa fa-user" aria-hidden="true"></i> <span>${ sessionScope.loginUser.userName }님</span></a>
									</div>
									<div class="reservation">								
										<a href="reservation.do"><i class="fa fa-user" aria-hidden="true"></i> <span>예약확인</span></a>
									</div>
									<div class="join">
										<a href="logout.do"><i class="fa fa-user" aria-hidden="true"></i> <span>Logout</span></a>
									</div>
					                				                 
									<!-- Cart -->
									<div class="cart">
										<a href="#"><i class="fa fa-shopping-cart"
											aria-hidden="true"></i> <span>Cart <span
												class="cart-quantity">(1)</span></span></a>
									</div>
								</c:if> 
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
											<li><a href="myReviewList.do">내 리뷰 보기</a></li>
											<li><a href="myOrderList.do">내 주문 내역</a></li>											
										</ul>
									</li>			
									<li><a href="#">예약</a>
									<ul class="dropdown">
											<li><a href="fair.do">박람회</a></li>
											<li><a href="exhibition.do">전시회</a></li>
											<li><a href="reviewBoard.do">후기게시판</a></li>
										</ul>
									</li>
									
									<li><a href="gardenMain.do">정원관리</a>
										<ul class="dropdown">
											<li><a href="visitorBoard.do">방명록</a></li>
											<li><a href="#">데일리로그</a>
											<li><a href="#">내 식물 관리</a></li>
											<li><a href="neighborList.do">이웃관리</a></li>											
										</ul>
									</li>
									<li><a href="boardList.do">자유게시판</a></li>
									<li><a href="bQuestionList.do">질문게시판</a></li>
									<li><a href="#">고객센터</a>
										<ul class="dropdown">
											<li><a href="faqList.do">자주묻는질문</a></li>
											<li><a href="noticeList.do">공지사항</a></li>
											<li><a href="inquiryList.do">문의사항</a></li>
											<li><a href="chat.do">1:1 채팅</a></li>
										</ul>
									</li>
									
									<!-- 관리자메뉴. 관리자로 로그인했을 때만 보이게 설정 -->
									<c:if test="${ sessionScope.loginUser.userId eq 'admin'}">
									<li><a href="#">관리자메뉴</a>
										<ul class="dropdown">
											<li><a href="adminFaq.do">FAQ관리</a></li>
											<li><a href="adminNotice.do">공지관리</a></li>
											<li><a href="adminInquiry.do">문의관리</a></li>											
											<li><a href="adminMember.do">회원관리</a></li>
											<li><a href="adminProducts.do">판매제품관리</a></li>
											<li><a href="adminFreebieList.do">사은품관리</a></li>											
											<li><a href="inventoryList.do">재고관리</a></li>
											<li><a href="adminOrderList.do">주문관리</a></li>
											<li><a href="salesList.do">매출관리</a></li>
											<li><a href="adminReviewList.do">리뷰관리</a></li>
											<li><a href="#">신고된 게시글</a></li>
											<li><a href="listTicket.do">티켓등록</a></li>
											<li><a href="#">후기관리</a></li>
											<li><a href="adminPlant.do">식물등록</a></li>
										</ul>
									</li> 
									</c:if> 
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
	



</body>

</html>