<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정원 | 방명록</title>
</head>
<body>	
	<jsp:include page="../common/menubar.jsp" />
	
	<section id="aa-product-category">
		<div class="container" align="center">
			<div class="row my-5">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="aa-product-catg-content">

						<div class="aa-product-catg-body">
							<div class="table-responsive">
								<h5>방명록</h5>
								<br>
								<table class="table table-striped">
									<tr class="danger">
										<th>작성자</th>
										<th>내용</th>
										<th>작성일</th>
										<th></th>
										
									</tr>
									<c:if test="${ !board.isEmpty() }">
         								<c:forEach items="${board}" var="b">
	         								<tr>
	         								<td>${b.writer}</td>	
	         								<td>${b.content}</td>
	         								<td>${b.enrollDate}</td>
											<td><button class="btn btn-outline-success reply"><i class="fa-solid fa-pen"></i></button> <button class="btn btn-outline-success visitGarden"><i class="fa-solid fa-leaf"></i></button></td>
	         								</tr>			
	         							</c:forEach>
         							</c:if>
         							<c:if test="${ board.isEmpty() }">
									<tr><td colspan="4" align="center">작성된 방명록이 없습니다.</td></tr>
									</c:if>
								</table>
		
							<p>
							<button class="btn btn-outline-success btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
							    방명록 작성하기
							</button>
							</p>
							<div class="collapse" id="collapseExample">
							  <div class="card card-body">
							    <div><form action="vBoardEnroll.do"><input type="text" name="content"> <button class="btn btn-outline-success btn-sm" type="submit" >작성하기</button></form></div>
							  </div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</section>
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