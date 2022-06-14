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

</head>

<body>

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area bg-img"
		style="background-image: url(resources/img/bg-img/oilseed-rape.jpg);">
		<!-- Main Footer Area -->
		<div class="main-footer-area">
			<div class="container">
				<div class="row">

					<!-- Single Footer Widget -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget">
							<div class="footer-logo mb-30">
								<a href="#"><img src="resources/img/core-img/온실2.png"
									alt=""></a>
							</div>
							<p>"Every flower is a soul blossoming in nature." - Gérard de Nerval</p>
							<div class="social-info">
								<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
								<a href="https://sordid-echinodon-225.notion.site/053c37d9717a46aa8112b297251ddbb5"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
								<a href="https://github.com/hancy1/onsil"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
							</div>
						</div>
					</div>

					<!-- Single Footer Widget -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget">
							<div class="widget-title">
								<h5>QUICK LINK</h5>
							</div>
							<nav class="widget-nav">
								<ul>
									<li><a href="listProducts.do">Shop</a></li>
									<li><a href="CartList.do">Cart</a></li>
									<li><a href="myPointList.do">Point</a></li>
									<li><a href="reservation.do">Reservation</a></li>
									<li><a href="gardenMain.do">My garden</a></li>
									<li><a href="dailyLog.do">Dailylog</a></li>
									<li><a href="boardList.do">Board</a></li>
									<li><a href="faqList.do">FAQ</a></li>									
									<li><a href="inquiryList.do">Inquiry</a></li>
									<li><a href="myPage.do">My page</a></li>
								</ul>
							</nav>
						</div>
					</div>

					<!-- Single Footer Widget -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget bestSeller">
							<div class="widget-title">
								<h5>BEST SELLER</h5>
							</div>

							<!-- Single Best Seller Products -->
							
							<!-- ajax 구현 -->
							
							
							
						</div>
					</div>

					<!-- Single Footer Widget -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget">
							<div class="widget-title">
								<h5>CONTACT</h5>
							</div>

							<div class="contact-information">
								<p>
									<span>Address:</span> 6, Teheran-ro 14-gil, Gangnam
								</p>
								<p>
									<span>Phone:</span> 1544 9970
								</p>
								<p>
									<span>Email:</span> onsil@gmail.com
								</p>
								<p>
									<span>Open hours:</span> Mon - Sun: 9 AM to 6 PM
								</p>
								<p>
									<span>Happy hours:</span> Sat: 2 PM to 4 PM
								</p>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>

		<!-- Footer Bottom Area -->
		<div class="footer-bottom-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="border-line"></div>
					</div>
					<!-- Copywrite Text -->
					<div class="col-12 col-md-6">
						<div class="copywrite-text">
							<p>
								&copy;
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>document.write(new Date().getFullYear());</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart-o" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
					<!-- Footer Nav -->
					<div class="col-12 col-md-6">
						<div class="footer-nav">
							<nav>
								<ul>
									<li><a href="/spring">Home</a></li>
									<li><a href="#">About</a></li>
									<li><a href="#">Service</a></li>
									<li><a href="https://sordid-echinodon-225.notion.site/053c37d9717a46aa8112b297251ddbb5">Notion</a></li>
									<li><a href="https://github.com/hancy1/onsil">Github</a></li>
									<li><a href="#">Contact</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- ##### Footer Area End ##### -->
	
	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script>
	
		$(function(){
			selectBestSeller();
		})
		
		function selectBestSeller(){
			var div = $('.bestSeller');
			
			var value = "";
			value += "<div class='widget-title'><h5>BEST SELLER</h5></div>";
			
			$.ajax({
				
				url:"selectBestSeller.do",
				type:"post",
				success:function(list){
					console.log(list);
					
					$.each(list, function(i, l){
						console.log(l.detailCha);
						
						value += "<div class='single-best-seller-product d-flex align-items-center'>" + 
								 "<div class='product-thumbnail'>" + 
								 "<a href='detailShop.do?proCode="+ l.proCode +"'><img src='resources/pro_upload_files/"+ l.detailCha +"' alt=''></a></div>" + 
								 "<div class='product-info'>" + 
								 "<a href=detailShop.do?proCode="+ l.proCode + "'>" + l.proName +"</a>" + 
								 "<p>"+ l.price +"</p>" + 
								 "</div></div>";	 
								 
					})
					div.html(value);
				},
				error:function(){
					console.log("베스트셀러 조회용 ajax 통신 실패")
				}
			
			})
			
		}
	</script>


</body>

</html>