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
<title>온실 - Gardening SHOP</title>

<style type="text/css">

	#pagingArea{
	
	align:center;
	
	}


	input {
	  width: 200px;
	  height: 32px;
	  font-size: 15px;
	  border: 0;
	  border-radius: 15px;
	  outline: none;	  
	  background-color: rgb(233, 233, 233);
	  padding-left: 10px;
	}


	#shopSearchBtn{
	
	 border-radius: 13px;
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
			style="background-image: url(resources/img/bg-img/shopMain2.jpg);">
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
							 <!-- <form action="#" method="post" class="form-inline"> -->
                                <select id="selectbox" name="selectbox" onchange="chageCateSelect()" class="custom-select widget-title">
                                  <option value="">Showing 카테고리</option>
                                  <option value="1">전체보기</option>
                                  <option value="2">나무</option>
                                  <option value="3">식용</option>
                                  <option value="4">꽃</option>
                                  <option value="5">기타(영양제,화분)</option>
                                </select>
                            <!-- </form> --> 
                            <script>
								function chageCateSelect(){
								    var selectCate = document.getElementById("selectbox");
								     
								    // select element에서 선택된 option의 value가 저장된다.
								    var selectValue = selectCate.options[selectCate.selectedIndex].value;
								 
								    // select element에서 선택된 option의 text가 저장된다.
								    var selectText = selectCate.options[selectCate.selectedIndex].text;
								    								    
								    var cate = $("#selectbox").val();
								    
								    console.log(selectValue);								    
								    console.log(cate);
								   
								    
								    switch(cate){
								    
								    case '1':
								    	location.href="listProducts.do"
								    	break;	
								    case '2':
								    	location.href="treeListProducts.do"
								    	break;
								    case '3':
								    	location.href="edibleListProducts.do"
								    	break;
								    case '4':
								    	location.href="flowerListProducts.do"
								    	break;
								    case '5':
								    	location.href="ectListProducts.do"
								    	break;
								    }
								    
								}
							</script>

						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<!-- Sidebar Area -->
				<div class="col-12 col-md-4 col-lg-3">
					<div class="shop-sidebar-area">

						<!-- Shop Widget -->
						<div class="shop-widget sort-by mb-50">
							<!-- 검색기능 -->
						  	<h4 class="widget-title">Shop Search</h4>
							<div class="widget-desc">
								 <div class="d-flex align-items-center">
								 	<form action="productSearch.do" method="post">
									<input type="search" name="searchKeyword" id="shopSearch" placeholder="Search..." value="${searchKeyword}">
		                         	<button class="btn btn-secondary btn-sm" id="shopSearchBtn" type="submit"><i class="icon_search"></i></button>
								 	</form>
								 </div>							 
							</div>
							<br>
						    <!-- 정렬기능 -->
						  	<h4 class="widget-title">Sort by</h4>
							<div class="widget-desc">
								 <div class="d-flex align-items-center">
									 <select id="selectsort" name="selectbox" onchange="chageSort()" class="custom-select widget-title">
	                                  <option value="">Sort select </option>	                                  
	                                  <option value="1">Price: low to high</option>
	                                  <option value="2">Price: high to low</option>
	                                  <option value="3">Alphabetically, A-Z</option>
	                                  <option value="4">Alphabetically, Z-A</option>
	                                </select>
	                                <script type="text/javascript">
	                                
	                                	function chageSort() {
	                                		
	                                		var sort = $("#selectsort").val();
	                                		console.log("나오냐?" + sort);
	                                		location.href="listSort.do?sort="+ sort;
											
										};
	                                
	                                </script>
								 </div>							 
							</div>
						</div>
					</div>
				</div>

				<!-- All Products Area -->
				<div class="col-12 col-md-8 col-lg-9">
					<div class="shop-products-area">
						<div class="row">
							
							<c:forEach items="${ list }" var="p">
							<!-- Single Product Area -->
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="single-product-area mb-50">
									<!-- Product Image -->
									<div class="product-img">	
										<img style="max-width: 100%; height: 260px;" onclick="detailPage('${ p.proCode }');" src="${ pageContext.servletContext.contextPath }/resources/pro_upload_files/${p.detailCha}" >
																				
									</div>
									<!-- Product Info -->
									<div class="product-info mt-15 text-center">
										<a onclick="detailPage('${ p.proCode }');">
											<h6>${ p.proName }</h6>
										</a>
										
									        <!-- 장바구니 추가 form -->
											<form action="" id="postForm" method="post" class="cartAdd_form">
												<input id="proCode" type="hidden" name="proCode" value="${p.proCode}">								
												<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
												<input type="hidden" name="amount" value="1">
											</form>	
										<h6><fmt:formatNumber type="number" value="${ p.price }"/>원</h6>
										
									</div>
								</div>
							</div>
							
	

							</c:forEach>
							
							
						<!-- 장바구니에 추가, 디테일 폼 -->	
						<script>
								
							function postFormSubmit(num){
								var postForm = $("#postForm");	
					
								if(num == 1){									
									postForm.attr("action", "insertCart.do");
								}				
								postForm.submit();
							};
					
							
							
							function detailPage(proCode){
								
								console.log(proCode);
								location.href="detailShop.do?proCode=" + proCode;
								
							};
							
							
							
						</script>						
					</div>
				</div>
			</div>
			
									
			<!-- Pagination -->
			<nav aria-label="Page navigation">
				<div id="pagingArea" class="row">
	                <ul class="pagination">
	                	<c:choose>
	                		<c:when test="${ pi.currentPage ne 1 }">
	                			<li class="page-item"><a class="page-link" href="listProducts.do?currentPage=${ pi.currentPage-1 }">
	                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
	  							<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
								</svg></a>
								</li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">
	                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
	  							<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
								</svg></a>
								</li>
	                		</c:otherwise>
	                	</c:choose>
	                	
	                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	                    	<c:choose>
		                		<c:when test="${ pi.currentPage ne p }">
	                    			<li class="page-item"><a class="page-link" href="listProducts.do?currentPage=${ p }">${ p }</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
		                		</c:otherwise>
		                	</c:choose>
	                    </c:forEach>
	                    
	                    
	                    <c:choose>
	                		<c:when test="${ pi.currentPage ne pi.maxPage }">
	                			<li class="page-item"><a class="page-link" href="listProducts.do?currentPage=${ pi.currentPage+1 }">
	                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
	  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
								</svg></a>
								</li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="listProducts.do?currentPage=${ pi.currentPage+1 }">
	                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
	  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
								</svg></a>
								</li>
	                		</c:otherwise>
	                	</c:choose>
	                </ul>
	            </div>
			</nav>
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