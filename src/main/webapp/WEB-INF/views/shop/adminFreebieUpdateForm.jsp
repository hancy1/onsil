<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<title>ADMIN :: 사은품 수정</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<style>
 	#enrollForm>table{
 	width:100%;
 	}
    #enrollForm>table *{
     margin:10px;
     }
     
</style>

	<jsp:include page="../common/menubar.jsp"/>
        
    <!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>ADMIN :: 사은품 수정</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="adminFreebieList.do">사은품관리</a></li>
							<li class="breadcrumb-item active" aria-current="page">사은품 수정</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
   <div class="container">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-6 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
			    <div class="content">
		        <br><br>
		       		           
		            <form id="updateForm" method="post" action="updateFreebie.do" enctype="multipart/form-data">
		            	
		                <table align="center">
		                    <tr>
		                        <th><label for="freeNo">No</label></th>
		                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>       
		                       	<td><input type="text" id="freeNo" class="form-control" name="freeNo" value="${ f.freeNo }" readonly></td>
		                    </tr>

		                    <tr>
		                        <th><label for="freeName">사은품명</label></th> 
		                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>      
		                       	<td><input type="text" id="freeName" class="form-control" name="freeName" value="${ f.freeName }" required></td>
		                    </tr>
		                    <tr>
		                        <th><label for="freePoint">포인트</label></th> 
		                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>      
		                       	<td><input type="text" id="freePoint" class="form-control" name="freePoint" value="${ f.freePoint }" required></td>
		                    </tr>
		                    
		                    <tr>
		                        <th><label for="freeAmount">현재수량</label></th>
		                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>       
		                       	<td><input type="text" id="freeAmount" class="form-control" name="freeAmount" value="${ f.freeAmount }" required></td>
		                    </tr>
		                    
		                    
		                    <tr>
		                        <th><label for="upfile">이미지</label></th>
		                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		                        <td>
		                            <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
		                            <c:if test="${ !empty f.originName }"> 현재 업로드된 파일 : ${ f.originName } <br>
			                            <input type="hidden" name="changeName" value="${ f.changeName }">
			                            <input type="hidden" name="originName" value="${ f.originName }">
		                            </c:if>
		                        </td>
		                    </tr>
		                </table>

		                
		                
		                <br>
		
		                <div align="center">
		                    <button type="submit" class="btn btn-outline-success">수정하기</button>
		                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:history.go(-1);">이전으로</button>
		                </div>
		            </form>
		        </div>
		        <br><br>
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




</head>
<body>

</body>
</html>