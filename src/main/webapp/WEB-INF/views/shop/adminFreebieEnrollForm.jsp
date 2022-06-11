<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 사은품 등록</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
 	#enrollForm>table{
 	width:100%;
 	}
    #enrollForm>table *{
     margin:10px;
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
			<h2>ADMIN :: 사은품 등록</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>							
							<li class="breadcrumb-item"><a href="adminFreebieList.do">사은품 관리</a></li>							
							<li class="breadcrumb-item active" aria-current="page">새사은품등록</li>
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
				        <br><br>
				        <div class="innerOuter">           
							
							<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
				            <form id="enrollForm" method="post" action="insertFreebie.do" enctype="multipart/form-data">
				                <table align="center">
				                    <tr>
				                        <th><label for="freeName">사은품이름</label></th>
				                        <td><input type="text" id="freeName" class="form-control" name="freeName" required></td>
				                    </tr>
	
				                    <tr>
				                        <th><label for="freeAmount">최초수량</label></th>
				                        <td><input type="text" id="freeAmount" class="form-control"  name="freeAmount" required></td>
				                    </tr>
				                    <tr>
				                        <th><label for="freePoint">소모포인트</label></th>
				                        <td><input type="text" id="freePoint" class="form-control" name="freePoint" required></td>
				                    </tr>
				                    <tr>
				                        <th><label for="upfile">사은품이미지</label></th>
				                        <td><input type="file" id="upfile" class="form-control-file border" name="uploadFile" required></td>
				                    </tr>
				          
				                </table>
				                <br>
				
											
								
					
								
				                <div align="center">
				                    <button type="submit" class="btn btn-outline-success">등록하기</button>
				                   
				                </div>
				            </form>			            
				            
				        </div>
				        <br><br>				   
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