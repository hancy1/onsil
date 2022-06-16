<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Title -->
<title>온실</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<script type="text/JavaScript">

	if("${loginUser}"){
	
  function getCookie(name) {
    var Found = false
    var start, end
    var i = 0

    // cookie 문자열 전체를 검색
    while(i <= document.cookie.length) {
      start = i
      end = start + name.length
      // name과 동일한 문자가 있다면
      if(document.cookie.substring(start, end) == name) {
        Found = true
        break
      }
      i++
    }

    // name 문자열을 cookie에서 찾았다면
    if(Found == true) {
      start = end + 1
      end = document.cookie.indexOf(";", start)
      // 마지막 부분이라는 것을 의미(마지막에는 ";"가 없다)
      if(end < start)
      end = document.cookie.length
      // name에 해당하는 value값을 추출하여 리턴한다.
      return document.cookie.substring(start, end)
    }
    // 찾지 못했다면
    return ""
  }

  function openMsgBox() {
    var eventCookie=getCookie("plantGrow_cook");  // 쿠키이름_cook 은 임의로 꼭 변경하세요.
    if (eventCookie != "no")
    window.open('growAlert.do','_blank','width=600,height=300,top=300,left=600');
    //팝업창의 주소, 같은 도메인에 있어야 한다.
  }
  openMsgBox();
	}
</script> 

</head>

<body>
	<jsp:include page="common/menubar.jsp" />



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
								<h2>Nature is a good guide. Wise, fair and good.
								</h2>
								<p>Listen to the sounds of nature and blend in with nature.
									Don't neglect a bag of grass and a branch of a tree.</p>
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
								<h2>Return to nature!</h2>
								<p>You fools who are dissatisfied with Mother Nature, know that all your misfortunes come from yourself.</p>
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
	

	<!-- ##### Service Area Start ##### -->
	<section class="our-services-area bg-gray section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Section Heading -->
					<div class="section-heading text-center">
						<h2>OUR SERVICES</h2>
						<p>We provide the perfect service for you.</p>
					</div>
				</div>
			</div>

			<div class="row justify-content-between">
				<div class="col-12 col-lg-5">
					<div class="alazea-service-area mb-100">

						<!-- Single Service Area -->
						<div
							class="single-service-area d-flex align-items-center wow fadeInUp"
							data-wow-delay="100ms">
							<!-- Icon -->
							<div class="service-icon mr-30">
								<img src="resources/img/core-img/s1.png" alt="">
							</div>
							<!-- Content -->
							<div class="service-content">
								<h5>Plants Care</h5>
								<p>In Aenean purus, pretium sito amet sapien denim moste
									consectet sedoni urna placerat sodales.service its.</p>
							</div>
						</div>

						<!-- Single Service Area -->
						<div
							class="single-service-area d-flex align-items-center wow fadeInUp"
							data-wow-delay="300ms">
							<!-- Icon -->
							<div class="service-icon mr-30">
								<img src="resources/img/core-img/s2.png" alt="">
							</div>
							<!-- Content -->
							<div class="service-content">
								<h5>Pressure Washing</h5>
								<p>In Aenean purus, pretium sito amet sapien denim moste
									consectet sedoni urna placerat sodales.service its.</p>
							</div>
						</div>

						<!-- Single Service Area -->
						<div
							class="single-service-area d-flex align-items-center wow fadeInUp"
							data-wow-delay="500ms">
							<!-- Icon -->
							<div class="service-icon mr-30">
								<img src="resources/img/core-img/s3.png" alt="">
							</div>
							<!-- Content -->
							<div class="service-content">
								<h5>Tree Service &amp; Trimming</h5>
								<p>In Aenean purus, pretium sito amet sapien denim moste
									consectet sedoni urna placerat sodales.service its.</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col-12 col-lg-6">
					<div class="alazea-video-area bg-overlay mb-100">
						<img src="resources/img/bg-img/23.jpg" alt=""> <a
							href="http://www.youtube.com/watch?v=7HKoqNJtMTQ"
							class="video-icon"> <i class="fa fa-play" aria-hidden="true"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Service Area End ##### -->

	<!-- ##### About Area Start ##### -->
	<section class="about-us-area section-padding-100-0">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-lg-5">
					<!-- Section Heading -->
					<div class="section-heading">
						<h2>ABOUT US</h2>
						<p>We are leading in the plants service fields.</p>
					</div>
					<p>Quisque orci quam, vulputate non commodo finibus, molestie
						ac ante. Duis in sceleri quesem. Nulla sit amet varius nunc.
						Maecenas dui, tempeu ullam corper in.</p>

					<!-- Progress Bar Content Area -->
					<div class="alazea-progress-bar mb-50">
						<!-- Single Progress Bar -->
						<div class="single_progress_bar">
							<p>Office plants</p>
							<div id="bar1" class="barfiller">
								<div class="tipWrap">
									<span class="tip"></span>
								</div>
								<span class="fill" data-percentage="80"></span>
							</div>
						</div>

						<!-- Single Progress Bar -->
						<div class="single_progress_bar">
							<p>Field manager</p>
							<div id="bar2" class="barfiller">
								<div class="tipWrap">
									<span class="tip"></span>
								</div>
								<span class="fill" data-percentage="70"></span>
							</div>
						</div>

						<!-- Single Progress Bar -->
						<div class="single_progress_bar">
							<p>Landscape design</p>
							<div id="bar3" class="barfiller">
								<div class="tipWrap">
									<span class="tip"></span>
								</div>
								<span class="fill" data-percentage="85"></span>
							</div>
						</div>

						<!-- Single Progress Bar -->
						<div class="single_progress_bar">
							<p>Garden Care</p>
							<div id="bar4" class="barfiller">
								<div class="tipWrap">
									<span class="tip"></span>
								</div>
								<span class="fill" data-percentage="65"></span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-lg-6">
					<div class="alazea-benefits-area">
						<div class="row">
							<!-- Single Benefits Area -->
							<div class="col-12 col-sm-6">
								<div class="single-benefits-area">
									<img src="resources/img/core-img/b1.png" alt="">
									<h5>Quality Products</h5>
									<p>Intiam eu sagittis est, at commodo lacini libero.
										Praesent dignissim sed odio vel aliquam manta lagorn.</p>
								</div>
							</div>

							<!-- Single Benefits Area -->
							<div class="col-12 col-sm-6">
								<div class="single-benefits-area">
									<img src="resources/img/core-img/b2.png" alt="">
									<h5>Perfect Service</h5>
									<p>Intiam eu sagittis est, at commodo lacini libero.
										Praesent dignissim sed odio vel aliquam manta lagorn.</p>
								</div>
							</div>

							<!-- Single Benefits Area -->
							<div class="col-12 col-sm-6">
								<div class="single-benefits-area">
									<img src="resources/img/core-img/b3.png" alt="">
									<h5>100% Natural</h5>
									<p>Intiam eu sagittis est, at commodo lacini libero.
										Praesent dignissim sed odio vel aliquam manta lagorn.</p>
								</div>
							</div>

							<!-- Single Benefits Area -->
							<div class="col-12 col-sm-6">
								<div class="single-benefits-area">
									<img src="resources/img/core-img/b4.png" alt="">
									<h5>Environmentally friendly</h5>
									<p>Intiam eu sagittis est, at commodo lacini libero.
										Praesent dignissim sed odio vel aliquam manta lagorn.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="border-line"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### About Area End ##### -->

	<jsp:include page="common/footer.jsp" />

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