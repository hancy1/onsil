<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>ADMIN :: 주문 관리</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png"> 
		
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    
<style>

	#adminOrderList{
	text-align: left;
	width: 80%;
	
	}
    #adminOrderList>tbody>tr:hover{
    cursor:pointer;
    }

    #pagingArea{
    width:fit-content;margin:auto;
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
    
    
    #cateArea{
    
    float: right;
    padding-right: 200px;
    
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

    .btn-grad:hover {
      background-position: right center;
      color: #fff;
      text-decoration: none;
    }
    


</style>

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			
			<h2>ADMIN :: 주문 관리</h2>
			
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">주문 관리</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- 본문 -->
	<div class="content" align="center">
        <br><br>
        <div class="innerOuter" style="padding:0px 10% 15% 10%;">           
         	<div id=cateArea>
	         	<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='adminOrderList.do'">전체</button>
	         	<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='adminOrderListRequest.do'">취소요청</button>
	         	<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='adminOrderListCancel.do'">취소주문</button>	         	
         	</div>
         	
         	<br><br>
         	
            <table id="adminOrderList" class="table table-hover" align="center">
               
                <thead>
                  <tr>
                    <th>주문NO</th>
                    <th>제품코드</th>
                    <th>제품명</th>
                    <th>사은품명</th>
                    <th>주문자</th>
                    <th>결제</th>
                    <th>수량</th>
                    <th>수취인명</th>                    
                    <th>연락처</th>
                    <th>주문날짜</th>
                    <!--<th>세부내역</th>  -->
                    <th>주문상태</th>
                                        
                  </tr>
                </thead>
                
                
                <tbody>
                	<c:forEach items="${ list }" var="o">
	                    <tr>
	                        <td>${ o.orderNo }</td>
	                        <td>${ o.proCode }</td>
	                        <td>${ o.proName }</td>
	                        <td>${ o.freeName }</td>
	                        <td>${ o.userId }</td>
	                        <td>${ o.payCode }</td>	                        
	                        <td>${ o.amount }</td>	                        
	                        <td>${ o.orderName }</td>	                        
	                        <td>${ o.orderPhone }</td>
	                        <td>${ o.orderDate }</td>
	                        <!--<td><button class="btn btn-outline-success btn-sm" onclick="detailOrder()">자세히보기</button></td>  -->
	                        <!-- 주문 상태별로 다른 버튼 표시 -->
	                        <td>
								<c:choose>
									<c:when test="${o.orderStatus eq 'R'}">
									<button id="cancelBtn" type="button" class="btn btn-outline-danger btn-sm" onclick="cancelOk(${ o.orderNo })" >취소승인</button>								
									</c:when>
									
									<c:when test="${o.orderStatus eq 'N'}">
									<button type="button" class="btn btn-outline-secondary btn-sm" disabled>취소완료</button>	
									</c:when>
									
									
								    <c:when test="${o.orderStatus eq 'C'}">
								    <button type="button" class="btn btn-outline-success btn-sm" disabled>정산완료</button>	
									</c:when>
									
									<c:otherwise>
									<button type="button" class="btn btn-outline-primary btn-sm" disabled>주문</button>										
									</c:otherwise>
									
								</c:choose>
							</td>
	                    </tr>
	                    
                    </c:forEach>
                </tbody>
            </table>
            
           <!--  
           <div id="addressArea" aria-hidden="true">
           		배송주소 : ${ o.address } ${ o.addressDetail }	                    	
           </div>-->
            
            <!-- 스크립트(자세히보기) -->
            <script>
            	
	            function detailOrder() {
	            	  var addressArea = document.getElementById("addressArea");
	            	  if (addressArea.style.display === "none") {
	            		  addressArea.style.display = "block";
	            	  } else {
	            		  addressArea.style.display = "none";
	            	  }
	            	};
            
	            	
	            function cancelOk(orderNo){	            	
	            	
	                if (!confirm("해당 건을 취소 하시겠습니까? ")) {
	                	
	                	alert("취소를 보류합니다.");
	                	
	                } else {
	                	
	                	alert("해당건이 취소되었습니다. 회원에게 전달됩니다.");	                	
	                	location.href="cancelOrder.do?orderNo=" + orderNo;
	                	
	                
	                }
	            	
	            }
	            
	   
            </script>
            
			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        ...
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Understood</button>
			      </div>
			    </div>
			  </div>
			</div>
 

 
            <br>

			<!-- 페이징 -->
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="adminOrderList.do?currentPage=${ pi.currentPage-1 }">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
							</svg></a>
							</li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
							</svg></a>
							</li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="adminOrderList.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="adminOrderList.do?currentPage=${ pi.currentPage+1 }">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
							</svg></a>
							</li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="adminOrderList.do?currentPage=${ pi.currentPage+1 }">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
							</svg></a>
							</li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
    <jsp:include page="../common/footer.jsp" />
  
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