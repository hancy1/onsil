<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 | 문의사항 </title>
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
			<h2>온실 :: 문의사항</h2>
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/spring"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">고객센터</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="/spring/inquiryList.do">문의사항</a></li>
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
		 		<h4>문의사항</h4>
		 		<br><br>	 		
		 		
		 		<!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
	            <c:if test="${ !empty loginUser }">
	            	<a class="btn btn-secondary" style="float:right; font-size: 14px;" href="enrollFormInquiry.do">문의글작성</a>
	            </c:if>
		 		<br><br>
		 		
		 		<div>	
		 		
			 		<table id="InquiryList" class="table table-hover" align="center">
	                <thead>
	                  <tr>
	                    <th>글번호</th>
	                    <th>카테고리</th>
	                    <th>제목</th>
	                    <th>조회수</th>
	                    <th>작성자</th>                                  
	                    <th>게시날짜</th>	                    	                    
	                  </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${ list }" var="i">
		                    <tr>
		                        <td>${ i.inquiryNo }</td>
		                        <td>${ i.category }</td>
		                        <td>${ i.title } &nbsp; [ ${ i.replyCount } ]</td>
		                        <td>${ i.count }</td>
		                        <td>${ i.writer }</td>		                        
		                        <td>${ i.createDate }</td>	
		                        <td><input type="hidden" name="open" value="${ i.userId }"></td>
		                        <td><input type="hidden" name="open" value="${ i.open }"></td>		                                               
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
                			<li class="page-item"><a class="page-link" href="inquiryList.do?currentPage=${ pi.currentPage-1 }"><i class="bi bi-arrow-left"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href=""><i class="bi bi-arrow-left"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="inquiryList.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="inquiryList.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="inquiryList.do?currentPage=${ pi.currentPage+1 }"><i class="bi bi-arrow-right"></i></a></li>
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
    		$("#InquiryList tbody tr").click(function(){    		
    			
    			/*if($(this).children().eq(7).text() == 'Y') {
    				location.href="detailInquiry.do?ino=" + $(this).children().eq(0).text();
    			}else{    				  			
    				if("${loginUser.userId}" == $(this).children().eq(5).text()) {
    					location.href="detailInquiry.do?ino=" + $(this).children().eq(0).text();
    				}else if("${loginUser.userId}" == 'admin'){
    					location.href="detailInquiry.do?ino=" + $(this).children().eq(0).text();
    				}else{
    					alert("이 게시글은 작성자와 관리자만 볼 수 있습니다.");
    				}
    			};*/
    			    			
    			
    			if($(this).children().eq(7).find("input").val() == 'Y') {
    				location.href="detailInquiry.do?ino=" + $(this).children().eq(0).text();
    			}else{    				  			
    				if("${loginUser.userId}" == $(this).children().eq(6).find("input").val()) {
    					location.href="detailInquiry.do?ino=" + $(this).children().eq(0).text();
    				}else if("${loginUser.userId}" == 'admin'){
    					location.href="detailInquiry.do?ino=" + $(this).children().eq(0).text();
    				}else{
    					alert("이 게시글은 작성자와 관리자만 볼 수 있습니다.");
    				}
    			};
    			
    		});
    	});
    </script>

</body>
</html>