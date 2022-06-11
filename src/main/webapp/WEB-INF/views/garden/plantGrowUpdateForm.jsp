<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>온실 - 정원</title>

    <!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/icon.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>${ hostUser }님의 정원</h2><!-- 나중에 이름 수정 -->
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<!-- <li class="breadcrumb-item "><a href="#">정원 메인화면</a></li> -->
							<li class="breadcrumb-item active" aria-current="page">정원 메인화면</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    <!-- ##### Portfolio Area Start ##### -->
    <section class="alazea-portfolio-area portfolio-page section-padding-0-100">

        <div class="container">
            
	
			<div>
				<br>
				<h6 align="center">관리내역 수정</h6>
				<div>
				<hr>
				<div align="center">
				<form id="enrollForm" method="post" action="updatePlantGrow.do">
                <table align="center">                    
                    <tr>
                    	<td align="center">
                    		<h5>[${plant.plantName}]${plant.nickname}</h5>
                    	</td>
                    </tr>
                    <tr>
                    	<th><label for="water">물주기</label></th>
                    	<td><input type=checkbox name="water" id="water"></td>
                    </tr>
                    <tr>
                    	<th><label for="supplement">영양제</label></th>
                    	<td><input type=checkbox name="supplement" id="supplement"></td>
                    </tr>
                    <tr>
                    	<th><label for="repotting">분갈이</label></th>
                    	<td><input type=checkbox name="repotting" id="repotting"></td>
                    </tr>
                    <tr>
                    	<td colspan="2"><textarea name="etc" cols="30" placeholder="비고사항">${plant.etc}</textarea></td>
                    </tr>
                    <tr>
                    	
                    	<td>관리일 : <input type="date" name="enrollDate" id="enrollDate" value="${plant.enrollDate}"></td>
                    	<input type="hidden" name="listNo" value="${plant.listNo}">
                    	<input type="hidden" name="plantNo" value="${plant.plantNo}">
                    </tr>
                </table>
                <br>
				<hr>
                <div align="center">
                    <button type="submit" class="btn btn-success btn-sm">수정</button>
                    <button type="reset" class="btn btn-success btn-sm">취소</button>
                </div>
            </form>	
				</div>
			
				</div>
			</div>
		</div>
</section>
<!-- jQuery-2.2.4 js -->
<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
<script>

	$(function(){
		
		if("${plant.water}" == 'Y'){
			$("#water").attr("checked", true);
		}
		
		if("${plant.supplement}" == 'Y'){
			$("#supplement").attr("checked", true);
		}
		
		if("${plant.repotting}" == 'Y'){
			$("#repotting").attr("checked", true);
		}
		
	})

</script>

    <jsp:include page="../common/footer.jsp" />
    
    
    <!-- i태그 이미지 cdn -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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