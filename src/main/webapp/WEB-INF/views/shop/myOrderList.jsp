<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - My Order</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">  


<style>
	#myOrderList{
	
	text-align: left;
	background-color: #E9ECEF;
	width : 50%;
	
	
	}
	
    #myOrderList>tbody>tr>#orderDetail:hover{
    cursor:pointer;
    }

   
    #searchForm{
        width:80%;
        margin:auto;
    }
    
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{
    width:20%;
    }    
    .text{
    width:53%;
    }
    .searchBtn{
    Width:20%;
    }
    

   .btn-grad {
      background-image: linear-gradient(to right, #16A085 0%, #F4D03F  51%, #16A085  100%);
      margin: 10px;
      padding: 15px 45px;
      text-align: center;
      text-transform: uppercase;
      transition: 0.5s;
      background-size: 200% auto;
      color: white;            
      box-shadow: 0 0 20px #eee;
      border-radius: 10px;
      display: block;
      Width:150px;
      height:30px;
    }

     #myOrderList>tbody>tr>#orderDetail:hover {
      background-position: right center;
      color: #fff;
      text-decoration: none;
    }
    
    
	#content{
	
	margin-left: 400px;
	
	}
    
    #contentT{
    
    margin-left: 150px;
    
    }
    
    
    
    #cateArea{
    
    float: right;
    
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
			style="background-image: url(resources/img/bg-img/mypoint.jpg);">
			<h2>My Order</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>													
							<li class="breadcrumb-item active" aria-current="page">내 주문 보기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    
   
    
	<!-- 마이 오더 테이블 -->
    <div class="content" >
        <div class="innerOuter" id="content" style="padding:5% 10%;">
        
        <div id=cateArea>
	         	<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='myOrderList.do'">주문내역</button>
	         	<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='myOrderCancelList.do'">취소내역</button>	             	
       </div>
        
    	<h4 id="contentT" >내 주문 내역</h4><br><br>
            <table id="myOrderList" align="center" class="table table-hover" > 
                
                <c:forEach items="${ list }" var="o">
                <tbody>               	

	                    <tr>
	                   		<td colspan="4">${ o.proName }</td>	                   		
	                    </tr>
	                    
	                    <tr>	                   		
	                   		<td colspan="3">수량 : ${ o.amount }</td>
	                   		<td>${ o.orderDate }</td> 
	                    </tr>
	                    
	                    <tr>	                    
	                    	<td colspan="4" id="orderDetail" >	                    	
	                    	<button class="btn btn-outline-secondary btn-sm" onclick="detailOrder(${ o.orderNo });">주문상세보기>></button>	                    	
	                    	</td>
	                    </tr>
	                      
	                    <tr>
	                    	<td colspan="4">
	                    	<c:choose>
	                    	
							<c:when test="${o.orderStatus eq 'C'}">
							
								<c:if test="${o.orderRInsert eq 'N'}" >
								<button class="btn btn btn-warning btn-sm" onclick="reviewForm(${ o.orderNo });">리뷰작성</button>
								</c:if>
								
								<button class="btn btn btn-warning btn-sm"  disabled>확정완료</button>	
								
							    <c:if test="${o.orderRInsert eq 'Y'}" >
								<button class="btn btn btn-warning btn-sm" onclick="location.href='myReviewList.do'">리뷰확인</button>
								</c:if>
								
																							
							</c:when>
							
								
							<c:when test="${o.orderStatus eq 'Y'}">
								<button class="btn btn btn-warning btn-sm" onclick="confirmationSubmit(${ o.orderNo });">구매확정</button>
								<button class="btn btn-secondary btn-sm" onclick="cancelSubmit(${ o.orderNo });">취소요청</button>								
							</c:when>
							
							<c:otherwise>								
								<button class="btn btn-danger btn-sm" disabled>취소요청중...</button>									
						    </c:otherwise>
									
							</c:choose>
	                    	
	                    	
	                    	
	                    	</td>
	                    </tr>   
	                    <tr style="background:#fff;">
	                    <td colspan="4"> </td> 
	                    </tr>                 
                </tbody>                
                </c:forEach>
            </table>
            <br>
			

		    <script>
		    
				function detailOrder(orderNo){	
					location.href="detailOrder.do?orderNo=" + orderNo;	             
	            };
	            
	            function confirmationSubmit(orderNo){
	            	alert("감사합니다. 주문이 확정되었습니다. \n리뷰를 작성하시면 100point적립! 🎁");
	            	location.href="OrderOk.do?orderNo=" + orderNo;
	            };
	            
	            function cancelSubmit(orderNo){
	            	alert("판매자에게 주문 취소를 요청하였습니다. 1~2일 소요됩니다. ");
	            	location.href="OrderCancelRequest.do?orderNo=" + orderNo;
	            };
	            
	            function reviewForm(orderNo){
	            	location.href="reviewEnrollForm.do?orderNo=" + orderNo;
	            }
	            
		    </script>

			
			
            
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
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