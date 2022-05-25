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
						            <li><a href="visitorBoard.do">방명록</a>		
									<li><a href="#">데일리로그</a>
									<li><a href="#">내 식물 관리</a></li>
									<li><a href="#">이웃관리</a></li>		
								</ul>
							</div>
							<!-- Navbar End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->	
</body>

</html>