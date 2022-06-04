<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - Review Detail</title>


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
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>Review Detail</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="myReviewList.do">내가 쓴 리뷰</a></li>	
							<li class="breadcrumb-item active" aria-current="page">사은품 디테일</li>
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
								<th>No</th>
								<td colspan="3">${r.reviewNo }</td>
												
							</tr>
							
							
							<tr>	
								<th width="100">작성자</th>
								<td width="200">${ r.userId }님</td>
								<th>제품명</th>
								<td>${ r.proName }</td>	
							</tr>
							
							
							<tr>	
								<th width="100">조회수</th>
								<td width="200">${ r.reviewCount }</td>
								<th>등록일</th>
								<td>${ r.reviewDate }</td>	
							</tr>
							
							
							<tr>
								<th width="100">별점</th>
								<td colspan="3">${ r.reviewStar }</td>
												
							</tr>
							<tr>
								<th width="100">제목</th>
								<td colspan="3">${ r.reviewTitle }</td>
												
							</tr>
							<tr>
								<th>리뷰 <br>이미지</th>
								<td colspan="3">
								<c:if test="${ !empty r.originName }">							
											
										<img src="${ pageContext.servletContext.contextPath }/resources/pro_upload_files/${r.changeName}" width="300">	
								</c:if>
								<c:if test="${ empty r.originName }">
			                        	이미지가 없습니다.
			                    </c:if></td>
							</tr>
							
							<tr>
								<th width="100">내용</th>
								<td colspan="3">${ r.reviewContent }</td>
												
							</tr>
							<tr>
								<th>이미지 <br>파일</th>
								<td colspan="3">
								<c:if test="${ !empty r.originName }">
										<a href="${ pageContext.servletContext.contextPath }/resources/pro_upload_files/${r.changeName}"
											download="${ r.originName }">${ r.originName }</a>
																						
								</c:if>
								<c:if test="${ empty r.originName }">
			                        	이미지가 없습니다.
			                    </c:if></td>
							</tr>							
					
						</table>
						<br>
						
						
						
						<!--  
						<div align="center">
							<button class="btn btn-outline-success" onclick="postFormSubmit(1);">수정</button>
							<button class="btn btn-outline-danger" onclick="postFormSubmit(2);">삭제</button>
						</div>
			
						<form id="postForm" action="" method="post">
						
							<input type="hidden" name="reviewNo" value="${ r.reviewNo }">
							<input type="hidden" name="fileName" value="${ r.changeName }">
						</form>
						
						<script>
							function postFormSubmit(num){
								var postForm = $("#postForm");
								
								//"updateFormReview.do?reviewNo="+reviewNo;
								
								
								if(num == 1){
									postForm.attr("action", "updateFormReview.do");
								}else{
									postForm.attr("action", "deleteReview.do");
								}
								postForm.submit();
							}
						</script>-->
						
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