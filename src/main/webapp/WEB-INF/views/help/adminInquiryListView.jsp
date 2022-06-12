<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 | 문의사항 관리</title>
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
        
	.btn.btn-danger{background: white;
				    border-color: #3ac240;
				    color: #3ac240;}
    .btn.btn-danger:hover{background: #3ac240;
						  border-color: #3ac240;}
						  
  	.btn.view{background: white;
			    border-color: #3ac240;
			    color: #3ac240;}
    .btn.view:hover{background: #3ac240;
				  	border-color: #3ac240;
				  	color:white;}
				  	
</style>

</head>
<body>

<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/데이지.jpg);">
			<h2>온실 :: 문의사항 관리</h2>
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/spring"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">고객센터</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="adminInquiry.do">문의사항 관리</a></li>
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
            <h2>문의사항 관리</h2>
            <br>            
            	         
         	
         	<div style="float: right;">
         	<a href="adminInquiry.do">전체</a> &nbsp;&nbsp;
         	<a href="adminInquiry2.do">답변전</a> &nbsp;&nbsp;
         	<a href="adminInquiry3.do">답변완료</a> &nbsp;&nbsp;
         	</div>
         	<br><br>
         	
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>조회수</th>
                    <th>작성자</th>
                    <th>게시날짜</th>
                    <th>댓글수</th>
                    <th>상태</th>                    
                    <th>답변상태</th>
                    <th>미리보기</th>
                    <th>답변하기</th>                    
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="i">
	                    <tr>
	                        <td>${ i.inquiryNo }</td>
	                        <td>${ i.category }</td>
	                        <td>${ i.title }</td>
	                        <td>${ i.count }</td>
	                        <td>${ i.writer }</td>
	                        <td>${ i.createDate }</td>	                        
	                        <td>${ i.replyCount }</td>	                        
	                        <td>${ i.status }</td>	                        
	                        <td>${ i.answer_status }</td>	                        
	                        <td class="button"><button class="btn view">미리보기</button></td>	                        
	                        <td class="button"><button class="btn btn-danger">답변하기</button></td>	                        
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
                			<li class="page-item"><a class="page-link" href="adminInquiry.do?currentPage=${ pi.currentPage-1 }"><i class="bi bi-arrow-left"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href=""><i class="bi bi-arrow-left"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="adminInquiry.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="adminInquiry.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="adminInquiry.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
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
 	// 관리자 - 문의사항 디테일뷰
	$(function(){
		$("#boardList tbody tr td:not(.button)").click(function(){
			location.href="adminInquiryDetail.do?ino=" + $(this).parentsUntil().children().eq(0).text();
		});
	});
 	
 	$("#boardList>tbody>tr>td>.btn.view").click(function(){
 		window.open("http://localhost:8099/spring/adminInquiryPreview.do?ino="+$(this).parentsUntil().parentsUntil().children().eq(0).text(), "", "_blank");
 	});
 	
 	$("#boardList>tbody>tr>td>.btn.btn-danger").click(function(){
 		window.open("http://localhost:8099/spring/adminInquiryAnswer.do?ino="+$(this).parentsUntil().parentsUntil().children().eq(0).text(), "", "_blank");
 	});
    </script>

</body>
</html>