<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - ERROR</title>
</head>
<body>
	<jsp:include page="menubar.jsp"/>
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>ERROR</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	<br>
	<div align="center">	
	
		<img src="${ pageContext.servletContext.contextPath }/resources/images/error.png" width="300">
		<br><br>
		<h1 style="font-weight:bold">${ msg }</h1>
		<h1 style="font-weight:bold">${ ref_form }</h1>
		<h5 style="color: red;"> ${ requestScope['javax.servlet.error.message'] }</h2>
	
		<!-- 
		  - javax.servlet.error.status_code (오류 상태 코드)
		  - javax.servlet.error.message (오류 메시지)
		  - javax.servlet.error.request_uri (오류가 발생한 요청 URI)
		  - javax.servlet.error.exception (발생한 예외처리 내용)
		  - javax.servlet.error.servlet_name (오류가 발생한 Servlet)
		
		
		 -->
	</div>
	<br>
	
	<jsp:include page="footer.jsp"/>
	
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