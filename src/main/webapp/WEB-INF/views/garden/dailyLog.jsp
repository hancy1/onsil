<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정원 | 데일리로그</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session" />
	</c:if>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>${ hostUser }님의 정원</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<!-- 이 부분 나중에 수정..? -->
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="gardenMain.do">정원 메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page">데일리로그</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- ##### Portfolio Area Start ##### -->
	<section
		class="alazea-portfolio-area portfolio-page section-padding-0-100">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Section Heading -->
					<div class="section-heading text-center">
						<h2>DAILY LOG</h2>
						<c:if test="${ loginUser.userId eq hostUser }">
						<button class="btn btn-outline-success" type="button" onclick="location.href='insertLogForm.do'">글쓰기</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<!-- <div class="row">
                <div class="col-12">
                    <div class="alazea-portfolio-filter">
                        <div class="portfolio-filter">
                            <button class="btn active" data-filter="*">All</button>
                            <button class="btn" data-filter=".design">Coffee Design</button>
                            <button class="btn" data-filter=".garden">Garden</button>
                            <button class="btn" data-filter=".home-design">Home Design</button>
                            <button class="btn" data-filter=".office-design">Office Design</button>
                        </div>
                    </div>
                </div>
            </div> -->
			<div class="row">
				<c:if test="${!dailyLog.isEmpty()}">
				<c:forEach items="${dailyLog}" var="log">
				<div class="col">
					<div class="card" style="width: 18rem;">
					<c:if test="${log.serverName != null}">
						<img src="resources/garden_upload_files/${log.serverName}" class="card-img-top"
							alt="...">
					</c:if>
					<c:if test="${log.serverName == null}">
						<img src="resources/garden_upload_files/mos.jpg" class="card-img-top"
							alt="...">
					</c:if>
						<div class="card-body">
							<h5 class="card-title">타이틀</h5>
							<p>
							<c:choose>
								<c:when test="${fn:length(log.content)>14}">
									<c:out value="${fn:substring(log.content,0,13)}"/>...
								</c:when>
								<c:otherwise>
									<c:out value="${log.content}"/>
								</c:otherwise>
							</c:choose>
							</p>
							<a href="logDetail.do?logNo=${log.logNo}" class="btn btn-outline-success">자세히 보기</a>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:if>
				<c:if test="${ dailyLog.isEmpty() }">
				<h3 align="center">작성된 데일리로그가 없습니다. 새 글을 작성해 일상을 공유해보세요. </h3>
				</c:if>

			</div>
			
			

		</div>
		<!-- container -->
	</section>

	<jsp:include page="../common/footer.jsp" />

	<!-- i태그 이미지 cdn -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />

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