<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 자주묻는질문 관리</title>
	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/icon.png"> 
		
	<!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />	
    
<style>
	#boardList{text-align: center;}
    #boardList>tbody>tr:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
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
			<h2>ADMIN :: 자주묻는질문 관리</h2>
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/spring"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">고객센터</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="adminFaq.do">자주묻는질문 관리</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- 본문 -->
	<div class="content">
        <br><br>
        <div class="innerOuter" style="padding:0% 10%;">
            <h2>자주묻는질문 관리</h2>
            <br>            
            	<a class="btn btn-secondary" style="float:right; font-size: 14px;" href="enrollFormAdminFaq.do">글쓰기</a>            
         	<br><br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>카테고리</th>
                    <th>질문</th>
                    <!-- <th>답변</th> -->
                    <th>작성일</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="f">
	                    <tr>
	                        <td>${ f.faqNo }</td>
	                        <td>${ f.categoryName }</td>
	                        <td>${ f.question }</td>
	                        <!-- <td>${ f.answer }</td> -->
	                        <td>${ f.createDate }</td>
	                        <td>${ f.status }</td>	                        
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
                			<li class="page-item"><a class="page-link" href="adminFaq.do?currentPage=${ pi.currentPage-1 }"><i class="bi bi-arrow-left"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href=""><i class="bi bi-arrow-left"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="adminFaq.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="adminFaq.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="adminFaq.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
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
	
	
    <script>
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			location.href="adminFaqDetail.do?fno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>

</body>
</html>