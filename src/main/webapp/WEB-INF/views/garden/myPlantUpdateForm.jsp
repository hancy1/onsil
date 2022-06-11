<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>식물등록</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
						<!-- 이 부분 나중에 수정..? -->
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="adminPlant.do">식물등록 메인화면</a></li>		
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
							<div class="content">
					        <br><br>
					        <div class="innerOuter">	
					       	 <form id="enrollForm" method="post" action="updateMyPlant.do" enctype="multipart/form-data">
                <table align="center">                    
                    <tr>
                    	<th><label for=plantName>식물 이름</label></th>
                    	<td><input type="text" name="plantName" id="plantName" value="${plant.plantName}" required style="width:400px"></td>
                    </tr>
                    <tr>
                    	<th><label for="nickname">별명 등록</label></th>
                    	<td><input type="text" name="nickname" id="nickname" value="${plant.nickname}" placeholder="" style="width:400px"></td>
                    </tr>
                    <tr>
                    	<th><label for="water">관수량</label></th>
                    	<td><input type="text" name="water" id="water" value="${plant.water}" required  style="width:400px"></td>
                    </tr>
                    <tr>
                    	<th><label for="sun">일조량</label></th>
                    	<td><input type="text" name="sun" id="sun" value="${plant.sun}" required  style="width:400px"></td>
                    </tr>
                    <tr>
                    	<th><label for="enrollDate">등록일</label></th>
                    	<td><input type="date" name="enrollDate" id="enrollDate" value="${plant.enrollDate}"></td>
                    	<input type="hidden" name="plantNo" value="${plant.plantNo}">
                    	<input type="hidden" name="fileName" value="${plant.fileName}">
                    	<input type="hidden" name="serverName" value="${plant.serverName}">
                    </tr>
                    <tr>
                    	<td colspan="2"><input type="file" id="upfile" class="form-control-file border input-file-button" name="upfile">
                    	<c:if test="${plant.serverName != null}"><h6>업로드된 사진 : </h6><img src="resources/garden_upload_files/${plant.serverName}" alt=""></c:if></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-success">수정하기</button>
                    <button type="reset" class="btn btn-success" onclick="history.go(-1);">뒤로가기</button>
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