<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - My Review</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
	#myReviewList{
		text-align: left;	
		width:80%;	
		margin-right: 30px;
		margin-bottom: 30px;
		margin-left: 40px;
	}
	
    #myReviewList>tbody>tr:hover{
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
	 

    <jsp:include page="../common/menubar.jsp"/>
    
    
    <!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/mypoint.jpg);">
			<h2>My Review</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>													
							<li class="breadcrumb-item active" aria-current="page">내가 쓴 리뷰</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    
   
    
	<!-- 마이 리뷰 테이블 -->
    <div class="content" align="center">
     	
        
        <div class="innerOuter" style="padding:0px 10% 15% 10%;">
    	<h4> ${ sessionScope.loginUser.userName }님이 작성하신 리뷰입니다.</h4><br>
            <table id="myReviewList" class="table table-hover" align="center">
                <thead>
                  <tr>
                  	<th width=50>No</th>
                  	<th width=80>작성자</th>
                    <th>제품이름</th>
                    <th width=60>별점</th>
                    <th>제목</th>
                    <th>사진</th>
                    <th width=100>조회수</th>
                    <th>작성일자</th>
                    
                    <th>삭제</th>                    
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="r">
	                    <tr>
	                    	<td>${ r.reviewNo }</td>
	                    	<td>${ r.userId }</td>
	                    	<td>${ r.proName }</td>
	                    	<td>${ r.reviewStar }</td>
	                    	<td id="reviewTitle">${ r.reviewTitle }</td>
	                        <c:if test="${ !empty r.originName }">
	                        	<td>&#127796;</td>
	                        </c:if>
	                        <c:if test="${ empty r.originName }">
	                        	<td>&nbsp;</td>
	                        </c:if>
	                    	<td>${ r.reviewCount }</td>	                        
	                        <td>${ r.reviewDate }</td>
	                       	<td>
	                       		<button id="deleteButton" type="button" title="내 리뷰 삭제" class="btn btn-outline-secondary btn-sm">
				                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="18" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
				 				<path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
								</svg>
				              	</button> 
	                       	</td>                    	               	                        

	                    
	                    
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
			
			
			<script>
			
			
				$(function(){
		    		$("#myReviewList>tbody>tr>#reviewTitle").click(function(){
		    			var reviewNo = $(this).parentsUntil().eq(0).children().eq(0).text();
		    			location.href="detailReview.do?reviewNo=" + reviewNo;
		    		});
		    	});
			
				
				$("#myReviewList>tbody>tr>td>#deleteButton").click(function(){ 
					var reviewNo = $(this).parentsUntil().eq(1).children().eq(0).text();
					
					location.href="deleteReview.do?reviewNo="+reviewNo;		
				});	
				
   			</script>
			
			
			
			
			
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="myReviewList.do?currentPage=${ pi.currentPage-1 }">
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
                    			<li class="page-item"><a class="page-link" href="myReviewList.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="myReviewList.do?currentPage=${ pi.currentPage+1 }">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
							</svg></a>
							</li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="myReviewList.do?currentPage=${ pi.currentPage+1 }">
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