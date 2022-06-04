<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
			<p>요청하신 페이지를 찾을 수 없습니다.🤷‍♀️</p>    
		</c:if>

		
		<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
			<p>서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p>
		</c:if>
		

		
        <a href="${ pageContext.servletContext.contextPath }">HOME</a>
		
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