<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 | 공지사항 </title>
	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/favicon.ico">   
		
	<!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />	
    
	<style>
		body {
	      min-height: 100vh;
	
	      background: -webkit-gradient(linear, left bottom, right top, from(#79b07b), to(#5a8c5c));
	      background: -webkit-linear-gradient(bottom left, #79b07b 0%, #5a8c5c 100%);
	      background: -moz-linear-gradient(bottom left, #79b07b 0%, #5a8c5c 100%);
	      background: -o-linear-gradient(bottom left, #79b07b 0%, #5a8c5c 100%);
	      background: linear-gradient(to top right, #79b07b 0%, #5a8c5c 100%);
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
	    
	    #NoticeList{text-align: center;}
	    #NoticeList>tbody>tr:hover{cursor:pointer;}
	
	    #pagingArea{width:fit-content;margin:auto;}
	    /* #pagingArea a{color:black} */
	    
	    #category {
			    margin-left:auto; 
			    margin-right:auto;
			}
			
		.category {
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
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>온실 :: 공지사항</h2>
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/spring"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">고객센터</a></li>
							<li class="breadcrumb-item active" aria-current="page">공지사항</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ##### Breadcrumb Area End ##### -->
	
	
	<!-- 게시판 본문 -->
	<div class="container">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-12 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
		 		<h4>공지사항</h4>
		 		<br><br>	 		
		 		
		 		<table id="category" style="border: solid; text-align: center; width:800px; height: 60px;">
		 			<tr>
			 			<th class="category">전체</th>
			 			<th class="category">회원</th>
			 			<th class="category">주문결제</th>
			 			<th class="category">배송</th>
			 			<th class="category">취소/환불</th>
			 			<th class="category">포인트</th>
			 			<th class="category">반품/교환</th>
			 			<th class="category">기타</th>
		 			</tr>
		 		</table>
		 		
		 		
		 		<br><br>
		 		
		 		<div>	
		 		
			 		<table id="NoticeList" class="table table-hover" align="center">
	                <thead>
	                  <tr>
	                    <th>글번호</th>
	                    <th>카테고리</th>
	                    <th>제목</th>
	                    <th>작성자</th>	                    
	                    <th>게시날짜</th>	                    
	                  </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${ list }" var="n">
		                    <tr>
		                        <td>${ n.noticeNo }</td>
		                        <td>${ n.category }</td>
		                        <td>${ n.title }</td>
		                        <td>${ n.writer }</td>		                        
		                        <td>${ n.createDate }</td>		                        
		                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	            
	            <br>
	            
	            <!-- 페이징처리 -->
	            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="noticeList.do?currentPage=${ pi.currentPage-1 }"><i class="bi bi-arrow-left"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href=""><i class="bi bi-arrow-left"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="noticeList.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="noticeList.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="noticeList.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
		 		
 				</div>
 				
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
    	$(function(){
    		$("#NoticeList tbody tr").click(function(){
    			location.href="detailNotice.do?nno=" + $(this).children().eq(0).text();
    		});
    	});
    	
    	$(function(){
      		$("#category tr th").click(function(){
      			
      			var category = $(this).text();
      			
      			switch(category) {
      				case "전체" : location.href="noticeList.do";
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
      			
      			location.href="noticeCategory.do?code=" + code;
      			
      		});
      	});
    </script>

</body>
</html>