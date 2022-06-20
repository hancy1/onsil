<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - Order Detail</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">



<style>
#contentArea {
	width: 75%
}

#contentArea * {
	margin: 5px
}
</style>


</head>
<body>


	<jsp:include page="../common/menubar.jsp"/>
    
    
    <!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>Order Detail</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="myOrderList.do">내 주문 내역</a></li>	
							<li class="breadcrumb-item active" aria-current="page">주문 내역 디테일</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    <div class="container" align="center">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-12 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
			    <div class="content">
					<br>
					<br>
					<div class="innerOuter">			
						<table id="contentArea" class="table">
							
							<tr>
								<th>주문No</th>
								<td colspan="3">${o.orderNo }</td>												
							</tr>
							
							<tr>	
								<th>주문자</th>
								<td>${ o.userId }님</td>
								<th>제품명/사은품</th>
								<td>${ o.proName }/${ o.freeName }</td>	
							</tr>
														
							<tr>	
								<th>수량</th>
								<td>${ o.amount }</td>
								<th>구매일</th>
								<td>${ o.orderDate }</td>	
							</tr>
														
							<tr>
								<th width="100">수령인</th>
								<td colspan="3">${ o.orderName }</td>
							</tr>
							
							<tr>
								<th width="100">연락처</th>
								<td colspan="3">${ o.orderPhone }</td>
							</tr>
							
							<tr>
								<th width="100">배송주소</th>
								<td>${ o.address }</td>
								<td>${ o.addressDetail }</td>
								<td></td>				
							</tr>							
						</table>
						<br>
						
						<div align="center">							
							<button type="button" class="btn btn-outline-secondary" onclick="javascript:history.go(-1);">이전으로</button>
						</div>			
					</div>
					<br>
					<br>
				</div>
			</div>
		</div>
	</div>
    
    <jsp:include page="../common/footer.jsp"/>
    
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