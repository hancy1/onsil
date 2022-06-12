<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - Garden 데일리로그</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/garden1.jpg);">
		</div>

		<div class="container">
			<div class="row">
				<div class="col-10">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="gardenMain.do">정원 메인</a></li>
							<li class="breadcrumb-item "><a href="dailyLog.do">데일리로그 메인</a></li>
							<li class="breadcrumb-item active" aria-current="page">데일리로그 수정</li>
						</ol>
					</nav>
				</div>
				<c:if test="${hostUser ne loginUser.userId}">
				<div class="col-2">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='gardenMain.do?hostUser=${loginUser.userId}'">내 정원 바로가기</button></li>
						</ol>
					</nav>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	<section id="aa-product-category">
		<div class="container" align="center">							
							<div class="content">
					        <br><br>
					        <div class="innerOuter">	
					       	 <form id="enrollForm" method="post" action="updateDailyLog.do" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="upfile"><i class="fa-solid fa-image"></i></label></th>
                        <td><input type="file" id="upfile" class="form-control-file border input-file-button" name="upfile"></td>
                        <c:if test="${ log.fileName != null }">
	                            현재 업로드된 파일 : ${ log.fileName } <br>
	                            <input type="hidden" name="serverName" value="${ log.serverName }">
	                            <input type="hidden" name="fileName" value="${ log.fileName }">
                         </c:if>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="content" id="content" rows="10" style="resize:none;">${log.content}</textarea></th>
                    	<input type="hidden" name="logNo" value="${log.logNo}"/>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-success">수정하기</button>
                    <button type="reset" class="btn btn-success">취소하기</button>
                </div>
            </form>				            
								<br><br>				            
				        </div>
				        <br><br>
				    	</div>							
						</div>

		
</section>
<!-- jQuery-2.2.4 js -->
<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	
	<!-- i태그 이미지 cdn -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<jsp:include page="../common/footer.jsp" />
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	
	<!-- ##### All Javascript Files ##### -->

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