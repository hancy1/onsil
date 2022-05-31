<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 식물 등록</title>
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
		  
	.btn.btn-primary{background: #3ac240;
				 border-color: #3ac240;} 
.btn.btn-primary:hover{background: white;
			  		   border-color: #3ac240;
			  	       color: #3ac240;} 
			  	       
.btn.btn-danger{background: white;
			    border-color: #3ac240;
			    color: #3ac240;}
   .btn.btn-danger:hover{background: #3ac240;
					  border-color: #3ac240;}  
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
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>관리자 :: 식물정보 수정</h2>
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
			<div class="row my-5">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="aa-product-catg-content">
						<div class="aa-product-catg-body">
							<div class="table-responsive">
								<h5>식물등록</h5>
								<br>
								</div>	
								
							<div class="content">
					        <br><br>
					        <div class="innerOuter">	
					       	 <form id="enrollForm" method="post" action="updatePlantInfo.do">
					       	 <input type="hidden" name="regNo" value="${info.regNo}"/>			            
					            <table id="contentArea" align="center" class="table">
					                <tr>
					                	<th id="selectCategory">카테고리</th>
					                    <td><input type="radio" name="category" id="category1" value="1">나무</td>
					                    <td><input type="radio" name="category" id="category2" value="2">꽃</td>
					                    <td><input type="radio" name="category" id="category3" value="3">식용재배</td>
					                </tr>
					                <tr>					                	
					                	<th>품종</th>
					                	<td colspan="3">
					                		<input type="text" name="plantName" class="form-control" value="${info.plantName}">
					                	</td>             				                    
					                </tr>				                
					                <tr>
					                    <th>관수량</th>
					                	<td colspan="3">
					                		<input type="text" name="water" class="form-control" value="${info.water}">
					                	</td> 
					                </tr>				                
					                <tr>
					                    <th>일조량</th>
					                	<td colspan="3">
					                		<input type="text" name="sun" class="form-control" value="${info.sun}">
					                	</td> 	                    
					                </tr>
					                <tr>
					                    <th>상태</th>
					                	<td><input type="radio" name="status" id="statusY" value="Y">Y</td>
					                    <td><input type="radio" name="status" id="statusN" value="N">N</td>	                    
					                </tr>			                
					            </table>
					            <br>

								<div align="center">
				                    <button type="submit" class="btn btn-outline-success">수정하기</button>
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
<!-- jQuery-2.2.4 js -->
<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
<script>

	console.log("카테고리 " + "${info.category}")

	$(function(){
		
		if("${info.category}" == "나무"){
			$("#category1").attr("checked", true);
		}else if("${info.category}" == "꽃"){
			$("#category2").attr("checked", true);
		}else if("${info.category}" == "식용재배"){
			$("#category3").attr("checked", true);
		}
		
		if("${info.status}" == "Y"){
			$("#statusY").attr("checked", true);
		}else if("${info.status}" == "N"){
			$("#statusN").attr("checked", true);
		}
		
	})
	

</script>
	
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