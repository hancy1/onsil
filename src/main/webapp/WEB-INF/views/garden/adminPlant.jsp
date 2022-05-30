<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 식물 등록</title>
<style>

th, td {
  text-align: center;
}

.danger {

	font-weight: bold;
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
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>관리자 :: 식물등록</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
						<!-- 이 부분 나중에 수정..? -->
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">식물등록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	<section id="aa-product-category">
		<div class="container" align="center">
			<div class="row my-5">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="aa-product-catg-content">
						<div class="aa-product-catg-body">
							<div class="table-responsive">
								<h5>식물등록</h5>
								<br>
								<table class="table table-striped" text-align="center">
									<tr class="danger">
										<td>등록번호</td>
										<td>카테고리</td>
										<td>품종</td>
										<td>관수량</td>
										<td>일조량</td>
										<td>상태</td>
										<td></td>		
									</tr>
									<c:if test="${ !info.isEmpty() }">
										<c:forEach items="${info}" var="i">
											<tr>
											<td>${i.regNo}</td>
											<td>${i.category}</td>
											<td>${i.plantName}</td>
											<td>${i.water}</td>
											<td>${i.sun}</td>
											<td>${i.status}</td>				
											<td><button class="btn btn-outline-success deletePlant" onclick='deletePlant("${i.regNo}");' ><i class="fa-solid fa-trash-can"></i></button></td>
											</tr>
										</c:forEach>
         							</c:if>
         							<c:if test="${ list.isEmpty() }">
									<tr><td colspan="7" align="center">추가된 식물이 없습니다.</td></tr>
									</c:if>
								</table>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
		
</section>
<script>

	

</script>
		<!-- 페이징바 만들기 -->
		
	
	
	
	
	<!-- i태그 이미지 cdn -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<jsp:include page="../common/footer.jsp" />
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	
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