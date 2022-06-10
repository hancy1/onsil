<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 | 자주묻는질문 </title>
	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/favicon.ico">   
		
	<!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />	
    
	<style>
		body {
	      min-height: 100vh;
	
	      background: -webkit-gradient(linear, left bottom, right top, from(#F3E669), to(#F3E669));
	      background: -webkit-linear-gradient(bottom left, #F3E669 0%, #F3E669 100%);
	      background: -moz-linear-gradient(bottom left, #F3E669 0%, #F3E669 100%);
	      background: -o-linear-gradient(bottom left, #F3E669 0%, #F3E669 100%);
	      background: linear-gradient(to top right, #F3E669 0%, #F3E669 100%);
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
	    
	    <!-- 아코디언 메뉴 style -->
	    
	    *{
		  box-sizing: border-box; 
		 }
		  
		.que:first-child{
		    border-top: 1px solid black;
		 }
		  
		.que{
		  position: relative;
		  padding: 17px 0;
		  cursor: pointer;
		  font-size: 14px;
		  border-bottom: 1px solid #dddddd;
		  
		 }
		  
		.que::before{
		  display: inline-block;
		  content: 'Q';
		  font-size: 14px;
		  color: #006633;
		  margin-right: 5px;
		 }
		
		.que.on>span{
		  font-weight: bold;
		  color: #006633; 
		 }
		  
		.anw {
		  display: none;
		    overflow: hidden;
		  font-size: 14px;
		  background-color: #f4f4f2;
		  padding: 27px 0;
		 }
		  
		.anw::before {
		  display: inline-block;
		  content: 'A';
		  font-size: 14px;
		  font-weight: bold;
		  color: #666;
		  margin-right: 5px;
		  }
		  
		  table {
			    margin-left:auto; 
			    margin-right:auto;
			}
			
		  table, td, th {
			    border-collapse : collapse;
			    border : 1px solid black;
			    width:100px;
			};
			

			  
	</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/튤립.jpg);">
			<h2>온실 :: 자주 묻는 질문</h2>
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/spring"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">고객센터</a></li>
							<li class="breadcrumb-item active" aria-current="page">자주묻는질문</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ##### Breadcrumb Area End ##### -->
 
 
 	<!-- 탈퇴 본문 -->
 	<div class="container">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-12 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
		 		<h4>자주 묻는 질문</h4>
		 		<br><br>
		 		
		 		<table id="category" style="border: solid; text-align: center; width:800px; height: 60px;">
		 			<tr>
			 			<th>전체</th>
			 			<th>회원</th>
			 			<th>주문결제</th>
			 			<th>배송</th>
			 			<th>취소/환불</th>
			 			<th>포인트</th>
			 			<th>반품/교환</th>
			 			<th>기타</th>
		 			</tr>
		 		</table>
		 		
		 		
		 		<br><br>
		 			 		
		 		<form method="post" id="faqList">
		 		
		 		<div>
		 			
		 			<div id="Accordion_wrap">
		 				<c:forEach items="${ list }" var="f">
					     <div class="que">
					      <span>${ f.question }</span>
					     </div>
					     <div class="anw">
					      <span>${ f.answer }</span>
					     </div>
					     </c:forEach>
					      <!--  <div class="que">
					      <span>This is second question.</span>
					     </div>
					     <div class="anw">
					      <span>This is second answer.</span>
					     </div>
					      <div class="que">
					      <span>This is third question.</span>
					     </div>
					     <div class="anw">
					      <span>This is third answer.</span>
					     </div> -->
					</div>
					
					<br>
					
					<div id="pagingArea">
		                <ul class="pagination">
		                	<c:choose>
		                		<c:when test="${ pi.currentPage ne 1 }">
		                			<li class="page-item"><a class="page-link" href="faqList.do?currentPage=${ pi.currentPage-1 }"><i class="bi bi-arrow-left"></i></a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href=""><i class="bi bi-arrow-left"></i></a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                    	<c:choose>
			                		<c:when test="${ pi.currentPage ne p }">
		                    			<li class="page-item"><a class="page-link" href="faqList.do?currentPage=${ p }">${ p }</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
			                		</c:otherwise>
			                	</c:choose>
		                    </c:forEach>
		                    
		                    
		                    <c:choose>
		                		<c:when test="${ pi.currentPage ne pi.maxPage }">
		                			<li class="page-item"><a class="page-link" href="faqList.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="faqList.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
		                		</c:otherwise>
		                	</c:choose>
		                </ul>
		            </div>

		 		</div>
		 		
		 		
			    </form>   
		    </div>
	 	</div>
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
	
	
  <script>  
  	
	  $(".que").click(function() {
		   $(this).next(".anw").stop().slideToggle(300);
		  $(this).toggleClass('on').siblings().removeClass('on');
		  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
		});
	  
	 
  	$(function(){
  		$("table tr th").click(function(){
  			
  			var category = $(this).text();
  			
  			switch(category) {
  				case "전체" : location.href="faqList.do";
  				return;
  				case "회원" : var code = 1;
  				break;
  				case "주문결제" : var code = 2;
  				break;
  				case "배송" : var code = 3;
  				break;
  				case "취소/환불" : var code = 4;
  				break;
  				case "포인트" : var code = 5;
  				break;
  				case "반품/교환" : var code = 6;
  				break;
  				case "기타" : var code = 7;
  				break;
  			}
  			
  			location.href="faqCategory.do?code=" + code;
  			
  		});
  	});
  
  </script>
  
  
</body>

</html>