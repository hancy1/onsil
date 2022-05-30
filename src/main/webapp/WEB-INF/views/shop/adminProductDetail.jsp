<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 판매제품 디테일</title>


<style>
#contentArea {
	width: 100%
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
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>ADMIN :: 판매제품 디테일</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">판매제품관리</a></li>
							<li class="breadcrumb-item active" aria-current="page">판매제품디테일</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    <div class="container">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-12 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
			    <div class="content">
					<br>
					<br>
					<div class="innerOuter">			
						<table id="contentArea" align="center" class="table">
							<tr>
								<th width="100">상품명</th>
								<td colspan="3">${ p.proName }</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td>${ p.cateCode }</td>
								<th>상품코드</th>
								<td>${ p.proCode }</td>					
							</tr>
							<tr>
								<th>판매가격</th>
								<td>${ p.price }</td>
								<th>현재재고</th>
								<td>${ p.proAmount }</td>					
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
								<c:if test="${ !empty p.detailOri }">
										<a href="${ pageContext.servletContext.contextPath }/resources/pro_upload_files/${p.detailCha}"
											download="${ p.detailOri }">${ p.detailOri }</a>
								</c:if>
								<c:if test="${ empty p.detailOri }">
			                        	첨부파일이 없습니다.
			                    </c:if></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td colspan="4"><p style="height: 150px">${ p.proContent }</p></td>
							</tr>
						</table>
						<br>
			
						
						<div align="center">
							<button class="btn btn-outline-success" onclick="postFormSubmit(1);">제품수정</button>
							<button class="btn btn-outline-danger" onclick="postFormSubmit(2);">판매중지</button>
						</div>
			
						<form id="postForm" action="" method="post">
						
							<input type="hidden" name="proCode" value="${ p.proCode }">
							<input type="hidden" name="fileName" value="${ p.detailCha }">
						</form>
						
						<script>
							function postFormSubmit(num){
								var postForm = $("#postForm");
								
								if(num == 1){
									postForm.attr("action", "updateFormProduct.do");
								}else{
									postForm.attr("action", "deleteProduct.do");
								}
								postForm.submit();
							}
						</script>
						
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