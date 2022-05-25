<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정원 | 이웃관리</title>
</head>
<body>	
	<jsp:include page="../common/menubar.jsp" />
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>MY GARDEN</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="gardenMain.do">정원 메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page">이웃관리</li>
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
								<h5>이웃관리</h5>
								<br>
								<table class="table table-striped">
									<tr class="danger">
										<th>유저아이디</th>
										<th>정원 바로가기</th>
										<th>이웃삭제</th>			
									</tr>
									<c:if test="${ !list.isEmpty() }">
										<h1>테스트</h1>
									
         							</c:if>
         							<c:if test="${ list.isEmpty() }">
									<tr><td colspan="3" align="center">추가된 이웃이 없습니다.</td></tr>
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

	function visitGarden(nUserNo){
		console.log(nUserNo)
	}
	
	function deleteNeighbor(nUserNo){
		console.log(nUserNo)
	}

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