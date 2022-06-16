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

<!-- jQuery library--> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<!-- Title -->
<title>온실 - 전시회</title>
<style>
.product-title {
    text-align:center;
    display:table;
    border:1px solid #cecece;
    width:280px;
    height:250px;
}

.product-img-div {
    display:table-cell;
    vertical-align:middle;
}

.exhibition-img {
   width:180px;
   height:180px;
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

				<!-- exhibition Area -->
				<div class="col-12 col-md-4 col-lg-3">
					<div class="shop-exhibition-area">
						<div class="row">
							
							
						     <c:forEach items="${ list }" var="t">
                     <!-- Single exhibition Area -->
                   <div class="col-12 col-sm-6 col-lg-4">
                        <div class="single-exhibition-area mb-50">
                           <!-- exhibition Image -->
                           <div class="exhibition-img">   
                              <img class="card-img-top" onClick="detailPage('${ t.ticketNo }');" src="${ pageContext.servletContext.contextPath }/resources/T_upload_files/${t.changeName}" >
                                                            
                           </div>
                           <!-- Info -->
                           <div class="card-body">
                              <a class="btn btn-primary" onClick="detailPage('${ t.ticketNo }');">
                                 <h6>${ t.ticketTitle }</h6>
                              </a>
            </div>
          </div>

 
                              
							
								
									        <!-- 예약하기 추가 form -->
											<form action="" id="postForm" method="post" class="reservation_form">
												<input id="ticketNo" type="hidden" name="ticketNo" value="${t.ticketNo}">								
												<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
												<input type="hidden" name="amount" value="1">
											</form>	
										
										
									</div>
								</div>
							</div>
							      
	

							</c:forEach>
							  <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="listTicket.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="listTicket.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="listTicket.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="listTicket.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
							
							
						<!-- 예약 추가, 디테일 폼 -->	
						<script>
								
							function postFormSubmit(num){
								var postForm = $("#postForm");	
					
								if(num == 1){									
									postForm.attr("action", "reservation.do");
								}				
								postForm.submit();
							};
					
							
							
							function detailPage(ticketNo){
								
								console.log(ticketNo);
								location.href="detailExhibition.do?ticketNo=" + ticketNo;
								
							};
							
							
							
						</script>
							
	
					</div>
				</div>
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