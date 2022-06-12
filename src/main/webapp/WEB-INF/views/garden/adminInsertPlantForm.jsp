<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 식물정보 등록</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">
<style>

th, td {
  text-align: center;
}

.danger {

	font-weight: bold;
}

.input-form {
  text-align:center;
  width: 680px;

  margin-top: 180px;
  padding: 32px;

  background: #fff;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}	    

#contentArea{width:100%}

#contentArea *{margin:5px}

textarea {width:100%;
		  height:80%;		
		  resize:none;		
 
}		
		

</style>
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
			style="background-image: url(resources/img/bg-img/garden2.jpg);">
			<h2>ADMIN :: 식물정보 등록</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="adminPlant.do">식물정보 관리</a></li>		
							<li class="breadcrumb-item active" aria-current="page">식물정보 등록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<section id="aa-product-category">
		<div class="container" >
			<div class="row my-5">
				<div class="col-lg-9 col-md-9 col-sm-9" style="margin:auto">
					<div class="aa-product-catg-content">
						<div class="aa-product-catg-body">
							<div class="table-responsive" style="text-align:center">
								<h5>식물등록</h5>
								<br>
								</div>	
								
							<div class="content">
					        <br><br>
					        <div class="innerOuter">	
					       	 <form id="enrollForm" method="post" action="insertPlant.do">			            
					            <table id="contentArea" align="center" class="table">
					                <tr>
					                	<th id="selectCategory">카테고리</th>
					                    <td><input type="radio" name="category" value="1" checked="checked">나무</td>
					                    <td><input type="radio" name="category" value="2">꽃</td>
					                    <td><input type="radio" name="category" value="3">식용재배</td>
					                </tr>
					                <tr>					                	
					                	<th>품종</th>
					                	<td colspan="3">
					                		<input type="text" name="plantName" class="form-control" required>
					                	</td>             				                    
					                </tr>				                
					                <tr>
					                    <th>관수량</th>
					                	<td colspan="3">
					                		<input type="text" name="water" class="form-control" required>
					                	</td> 
					                </tr>				                
					                <tr>
					                    <th>일조량</th>
					                	<td colspan="3">
					                		<input type="text" name="sun" class="form-control" required>
					                	</td> 	                    
					                </tr>			                
					            </table>
					            <br>

								<div align="center">
				                    <button type="submit" class="btn btn-outline-success">등록하기</button>
				                </div>
			            	</form>				            
								<br><br>				            
				        </div>
				        <br><br>
				    	</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
		
</section>
	
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