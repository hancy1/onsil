<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>온실 :: 자유게시판</title>

    <!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/icon.png"> 

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/style.css">
    
    <!-- jQuery library 제이쿼리 라이브러리 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>온실 :: 신고된 게시글</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">신고된 게시글</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
            	<div class="col-12 col-md-8">
                    <div class="row"> 
                	
                	<!-- 게시판 목록 -->                
					<table id="boardList" class="table table-hover">
			        	<thead>
			          		<tr>
								<th width="90">글번호</th>
								<th width="200">신고사유</th>
								<th width="300">글제목</th>
								<th width="100">작성자</th>
								<th width="130">작성일</th>
								<th width="50">삭제하기</th>
					        </tr>
					    </thead>
						<tbody>
		                	<c:forEach items="${ list }" var="b">
			                    <tr>
			                        <td>${ b.BNo }</td>
			                        <td>${ b.BCategoryName }</td>
			                        <td>${ b.BTitle }</td>
			                        <td><a href="gardenMain.do?hostUser=${ loginUser.userNo }">${ b.userName }</a></td>
			                        <td>${ b.BDate }</td>
			                        <td><a href="#">-</a></td>
			                    </tr>
		                    </c:forEach>
				        </tbody>
					</table>
				<br><br>								
                </div>
                	<!-- 페이징 처리 -->		
                    <div class="row">
                        <div class="col-12">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
				                	<c:choose>
				                		<c:when test="${ pi.currentPage ne 1 }">
				                			<li class="page-item"><a class="page-link" href="boardList.do?currentPage=${ pi.currentPage-1 }">←</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">←</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="boardList.do?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="boardList.do?currentPage=${ pi.currentPage+1 }">→</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="boardList.do?currentPage=${ pi.currentPage+1 }">→</a></li>
				                		</c:otherwise>
				                	</c:choose>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>                                                      
            </div>
        </div>
    </section>    
    <!-- ##### Blog Area End ##### -->

    <jsp:include page="../common/footer.jsp" />

	<!-- 테이블 클릭시 게시글 상세보기로 이동 -->
    <script>
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			location.href="detailBoard.do?bno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>
    
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