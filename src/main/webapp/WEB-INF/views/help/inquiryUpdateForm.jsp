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
		 		
		 		
		 		<div>	
		 		<form id="updateForm" method="post" action="updateInquiry.do" enctype="multipart/form-data">
		 		<!-- 문의글 수정 본문 -->
		 			<div class="content">
				        <br><br>
				        <div class="innerOuter">				            
				            <table id="contentArea" align="center" class="table">
				                <tr>
				                	<th width="100" id="titletitle">제목</th>
				                    <td colspan="10"><input type="text" id="title" class="form-control" name="title" value="${ i.title }" required></td>
				                </tr>
				                <tr>
				                	<th>글번호</th>
				                	<td colspan="2">${ i.inquiryNo }</td>
				                	<input type="hidden" name="inquiryNo" value="${ i.inquiryNo }">
				                	<th>카테고리</th>
				                	<td colspan="2">			                			
				                			<select name="category" required>
					                			<option> </option>
					                			<option id="mem" name="category" value="1">회원</option>
					                			<option id="order" name="category" value="2">주문결제</option>
					                			<option id="deliver" name="category" value="3">배송</option>
					                			<option id="cancle" name="category" value="4">취소/환불</option>
					                			<option id="point" name="category" value="5">포인트</option>
					                			<option id="exchange" name="category" value="6">반품/교환</option>
					                			<option id="etc" name="category" value="7">기타</option>
					                		</select></td>				                    
				                	<th>조회수</th>
				                	<td colspan="2">${ i.count }</td>				                    
				                </tr>				                
				                <tr>
				                    <th>작성자</th>
				                    <td colspan="3">${ i.writer }</td>
				                    <th>작성일</th>
				                    <td colspan="3">${ i.createDate }</td>
				                </tr>				                
				                <tr>
				                    <th>내용</th>		
				                    <td colspan="10"></td>		                    
				                </tr>
				                <tr>
				                    <td colspan="10">
				                    	<textarea class="form-control" required name="content" id="content" rows="10" style="resize:none;">${ i.content }</textarea>
				                    </td>
				                </tr>				                
				            </table>
				            <br>
					
							
					            <div align="center">
					                <button type="submit" class="btn btn-primary">수정하기</button>
                    				<button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
					            </div>		   
					            								
								
				            
				            <br><br>				            
				        </div>
				        <br><br>
				    </div>
				    </form>
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
	// 카테고리 선택됨 
	$(function(){
    	
   		if("${i.category}" == "회원"){
   			$("#mem").attr("selected", true);
   		}else if("${i.category}" == "주문결제"){
   			$("#order").attr("selected", true);
   		}else if("${i.category}" == "배송"){
   			$("#deliver").attr("selected", true);
   		}else if("${i.category}" == "취소/환불"){
   			$("#cancle").attr("selected", true);
   		}else if("${i.category}" == "포인트"){
   			$("#point").attr("selected", true);
   		}else if("${i.category}" == "반품/교환"){
   			$("#exchange").attr("selected", true);
   		}else{
   			$("#etc").attr("selected", true);
   		}
   	});
	
	</script>	
</body>
</html>