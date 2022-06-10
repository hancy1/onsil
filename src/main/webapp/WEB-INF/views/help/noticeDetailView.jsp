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
	    
	    #contentArea{width:100%}
		#contentArea *{margin:5px}
		textarea {width:100%;
				  height:80%;		
				  resize:none;		  
		}
		
		.btn.btn-primary{background: #3ac240;
						 border-color: #3ac240;} 
		.btn.btn-primary:hover{background: white;
					  		   border-color: #3ac240;
					  	       color: #3ac240;} 
					  	       
		.btn.btn-danger{background: white;
					    border-color: #3ac240;
					    color: #3ac240;}
	    .btn.btn-danger:hover{background: #3ac240;
							  border-color: #3ac240;}
		
				
	</style>
</head>

<body>

<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/단풍.jpg);">
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
							<li class="breadcrumb-item active" aria-current="page"><a href="/spring/noticeList.do">공지사항</a></li>
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
		 		
		 		
		 		<div>	
		 		
		 		<!-- 상세보기 본문 -->
		 			<div class="content">
				        <br><br>
				        <div class="innerOuter">				            
				            <table id="contentArea" align="center" class="table">
				                <tr>
				                	<th width="100">제목</th>
				                    <td colspan="3">${ n.title }</td>
				                </tr>
				                <tr>
				                	<th>글번호</th>
				                	<td>${ n.noticeNo }</td>
				                	<th>카테고리</th>
				                	<td>${ n.category }</td>				                    
				                </tr>				                
				                <tr>
				                    <th>작성자</th>
				                    <td>${ n.writer }</td>
				                    <th>작성일</th>
				                    <td>${ n.createDate }</td>
				                </tr>				                
				                <tr>
				                    <th>내용</th>
				                    <td colspan="3"></td>
				                </tr>
				                <tr>
				                    <td colspan="4"><p style="height:150px">${ n.content }</p></td>
				                </tr>
				            </table>
				            <br>
					
							<c:if test="${ loginUser.userId eq n.userId }">
					            <div align="center">
					                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
					                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
					            </div>
					            
					            <form id="postForm" action="" method="post">
									<input type="hidden" name="nno" value="${ n.noticeNo }">									
								</form>
								
								<script>
									function postFormSubmit(num){
										var postForm = $("#postForm");
										
										if(num == 1){
											postForm.attr("action", "updateFormBoard.do");
										}else{
											postForm.attr("action", "deleteBoard.do");
										}
										postForm.submit();
									}
								</script>
				            </c:if>
				            <br><br>				            
				        </div>
				        <br><br>
				    </div>
			 	<!-- 상세보기 본문 끝 -->           
           		
		 		
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
    	
    </script>

</body>
</html>