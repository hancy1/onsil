<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 | 문의사항</title>

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
		 		<div class="input-form col-md-12 mx-auto" style="margin-left: 0px; margin-bottom: 100px;">
			 		<h4>문의사항</h4>	 			 		
			 		
			 		<div>	
			 		
			 		<!-- 문의글작성 본문 -->
			 			<div class="content">
					        <br><br>
					        <div class="innerOuter">	
					       	 <form id="enrollForm" method="post" action="insertInquiry.do" enctype="multipart/form-data">			            
					            <table id="contentArea" align="center" class="table">
					                <tr>
					                	<th width="100" id="titletitle">제목</th>
					                    <td colspan="10"><input type="text" id="title" class="form-control" name="title" required></td>
					                </tr>
					                <tr>					                	
					                	<th>카테고리</th>
					                	<td>
					                		<select name="category" required>
					                			<option> </option>
					                			<option name="category" value="1">회원</option>
					                			<option name="category" value="2">주문결제</option>
					                			<option name="category" value="3">배송</option>
					                			<option name="category" value="4">취소/환불</option>
					                			<option name="category" value="5">포인트</option>
					                			<option name="category" value="6">반품/교환</option>
					                			<option name="category" value="7">기타</option>
					                		</select>
					                	</td>             				                    
					                </tr>				                
					                <tr>
					                    <th>작성자</th>
					                    <td colspan="3"><input type="text" id="writer" class="form-control" value="${ loginUser.userName }" name="userId" readonly></td>					                    
					                    <input type="hidden" id="userNo" class="form-control" value="${ loginUser.userNo }" name="userNo" readonly>					                    
					                </tr>				                
					                <tr>
					                    <th>내용</th>		
					                    <td colspan="10"></td>		                    
					                </tr>
					                <tr>
					                    <td colspan="10">
					                    	<textarea class="form-control" required name="content" id="content" rows="10" style="resize:none;"></textarea>
					                    </td>
					                </tr>				                
					            </table>
					            <br>

								<div align="center">
				                    <button type="submit" class="btn btn-primary">등록하기</button>
				                    <button type="reset" class="btn btn-danger">취소하기</button>
				                </div>
			            	</form>				            
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
	// 줄바꿈
	$('#content').val().replace(/\n/g, "<br>")	
	</script>
</body>
</html>