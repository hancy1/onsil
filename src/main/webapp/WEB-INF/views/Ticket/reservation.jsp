<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Title -->
    <title> 온실 - 예약</title>
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/icon.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">

</head>

<body>

  	<jsp:include page="../common/menubar.jsp" />

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>Cart</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">예약</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Cart Area Start ##### -->
    <div class="cart-area section-padding-0-100 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="reservation">
                    
                    	
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                	
                                    <th>제품</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                    <th>TOTAL</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${ list }" var="cart">
                            	
                                <tr>                                	
                                    <td class="cart_product_img">
                                        <a href="#">
                                        <img src="${ pageContext.servletContext.contextPath }/resources/pro_upload_files/${cart.detailCha}" alt="Product" >                                        
                                        </a>
                                        <h5>${ cart.proName }</h5>                                       
                                    </td>
                                    <td class="qty">
                                        <div class="quantity">
                                            
                                            <input type="number" class="qty-text" id="qty" name="amount" value="${cart.amount}">
                                            
                                        </div>
                                    </td>
                                    <td class="price">
                                    
                                    <span><fmt:formatNumber type="number" value="${ cart.price }"/>원</span></td>
                                    <td class="total_price"><span><c:set var="sTotal" value="${cart.amount*cart.price }"/><fmt:formatNumber type="number" value="${sTotal}"/>원</span></td>
                                    <td><button type="button"  onclick="postFormSubmit(1);" id = "delete_btn" class="btn btn-light btn-sm" ><i class="icon_close"></i></button></td>

                                </tr>

                                <!-- 삭제 form -->
								<form action="" id="postForm" method="post" class="delete_form">
									<input type="hidden" name="cartNo" value="${cart.cartNo}">
									<!--  <input type="hidden" name="userNo" value="${cart.userNo}">-->
								</form>	
				                               
                               </c:forEach> 
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
				
			<script>
			
	
			function postFormSubmit(num){
				var postForm = $("#postForm");	

				if(num == 1){
					postForm.attr("action", "deleteCart.do");
				}				
				postForm.submit();
			}

			</script>


            <div class="row">

               

                <!-- Cart Totals -->
                <div class="col-12 col-lg-6">
                    <div class="cart-totals-area mt-70">
                        <h5 class="title--">Total</h5>
                   
                        
                        <div class="total d-flex justify-content-between">
                            <h5>Total</h5>
                            <h5>(금액)</h5>
                        </div>
                        <div class="checkout-btn">
                            <a href="#" class="btn alazea-btn w-100">구매하기</a>
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