<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 재고 등록</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
 	#enrollForm>table{
 	width:50%;
 	}
    #enrollForm>table *{
     margin:10px;
     }
     

     .select {
	    /*padding: 15px 10px;*/
	}
	.select input[type=radio]{
	    display: none;
	}
	
	.select input[type=radio]+label{
	    display: inline-block;
	    cursor: pointer;
	    height: 32px;
	    width: 80px;
	    border: 1px solid #009000;
	    border-radius: 5px;
	    line-height: 30px;
	    text-align: center;	   
	    font-size:15px;
	}
	.select input[type=radio]+label{
	    background-color: #fff;
	    color: #009000;
	}
	.select input[type=radio]:checked+label{
	    background-color: #009000;
	    color: #fff;
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
			<h2>ADMIN :: 재고 등록</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>							
							<li class="breadcrumb-item"><a href="inventoryList.do">재고 관리</a></li>							
							<li class="breadcrumb-item active" aria-current="page">재고 등록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    

	<div class="container" align="center">
		 	<div class="input-form-backgroud row">
		 		<div class="input-form col-md-12 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
		
				    <div class="content">
				        <br><br>
				        <div class="innerOuter">           
							
							
							<form id="enrollForm" action="insertInventory.do" method="post" class="validation-form" novalidate>
				            
				                <table align="center">				              		
				              		<tr>
				                        <th><label for="stockStatus">구분</label></th>
				                        <td>  
										    <div class="select">
											     <input type="radio" id="select" name="stockStatus" value="입고"><label for="select">입고</label>
											     <input type="radio" id="select2" name="stockStatus" value="출고"><label for="select2">출고</label>
											</div>				                        
				                        </td>
				                    </tr>				                
				                
				                
				                    <tr>
				                        <th><label for="proCode">제품코드</label></th>
				                        <td>
				                        
				                        	<select id="proCodeSelect" name="proCode" class="form-select" required>
				                        	
				                        		<option value="">선택하세요.</option>
				                        		
					                        	<c:forEach items="${ list }" var="p">		                   							
		                   						<option value="${ p.proCode }">${ p.proCode }</option>	
							                    </c:forEach>
							                    
				                        	</select>
				                        
				                        </td>
				                    </tr>
	
				                    <tr>
				                        <th><label for="proName">제품명</label></th>
				                        <td id="nameArea"><input type="text" id="proName" class="form-control"  value="" name="proName" placeholder="제품명" ></td>
				                    </tr>
				                    				                    
				                    <tr>
				                        <th><label for="amountNow">현재수량</label></th>
				                        <td><input type="number" id="amountNow" class="form-control" name="amountNow" placeholder="현재수량입니다."></td>
				                    </tr>
				                    
				                    <tr>
				                        <th><label for="amount">등록수량</label></th>
				                        <td><input type="number" id="amount" class="form-control" name="amount" required></td>
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
	
	<script>
	
			//제품명,현재수량 불러옴
			
			$('#proCodeSelect').change(function() {
				
				var proCode = $('#proCodeSelect').val();
				
				
				$.ajax({
					
					url:"selectProductInfo.do",
					data:{proCode:proCode},
					type:"get",
					success:function(pInfo){
						
						$('#proName').val(pInfo.proName);
						$('#amountNow').val(pInfo.proAmount);
						
						$('#proName').prop('readonly', true);
						$('#amountNow').prop('readonly', true);
						
					
					},
					error:function(){
						console.log("제품정보 불러오기 ajax 실패")
					}
				});	
			
			});
			
	</script>
		

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