<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<title>ADMIN :: 판매제품 수정</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 




<!-- 썸머노트 라이트 버젼 include summernote-ko-KR -->

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>



<style>
 	#enrollForm>table{
 	width:100%;
 	}
    #enrollForm>table *{
     margin:10px;
     }
     
</style>

	<jsp:include page="../common/menubar.jsp"/>
        
    <!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>ADMIN :: 판매제품 수정</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="adminProducts.do">판매제품관리</a></li>
							<li class="breadcrumb-item active" aria-current="page">판매제품수정</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
   <div class="container">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-6 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
			    <div class="content">
		        <br><br>
		       		           
		            <form id="updateForm" method="post" action="updateProduct.do" enctype="multipart/form-data">
		            	
		                <table align="center">
		                    <tr>
		                        <th><label for="proCode">판매상품코드</label></th>       
		                       	<td><input type="text" id="proCode" class="form-control" name="proCode" value="${ p.proCode }" readonly></td>
		                    </tr>
		                    <tr>
		                        <th><label for="writer">카테고리</label></th>
		                        <td>		                      
		                        <select name="cateCode" id="cateCode" required>
									<option value="">카테선택</option>
							        <option id="tree" value="tree">나무</option>
								    <option id="edible" value="edible">식용식물</option>
									<option id="flower" value="flower">꽃</option>
									<option id="ect" value="ect">기타</option>								
									</select>								
								</td>								
		                    </tr>
		                    <tr>
		                        <th><label for="proName">상품명</label></th>       
		                       	<td><input type="text" id="proName" class="form-control" name="proName" value="${ p.proName }" required></td>
		                    </tr>
		                    <tr>
		                        <th><label for="price">상품가격</label></th>       
		                       	<td><input type="text" id="price" class="form-control" name="price" value="${ p.price }" required></td>
		                    </tr>
		                    
		                    <tr>
		                        <th><label for="upfile">대표이미지</label></th>
		                        <td>
		                            <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
		                            <c:if test="${ !empty p.detailOri }"> 현재 업로드된 파일 : ${ p.detailOri } <br>
			                            <input type="hidden" name="changeName" value="${ p.detailCha }">
			                            <input type="hidden" name="originName" value="${ p.detailOri }">
		                            </c:if>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th colspan="2"><label for="content">상세페이지</label></th>
		                    </tr>
		                    <tr>		                    
		                        <th colspan="2"><textarea class="summernote" required name="proContent" id="proContent">${ p.proContent }</textarea></th>
		                    </tr>
		                </table>
		                
		                <!-- 썸머노트 -->
		                
		                <script>
								$('.summernote').summernote({
								  	placeholder: 'content',
							        minHeight: 370,
							        maxHeight: 150,
							        focus: true, 
							        lang : 'ko-KR'
									});
					    </script>
		                
		                <!-- 카테코드 value불러오기 -->
		               <script>
			
						$(function() {
							
							if("${p.cateCode}" === "tree"){
								$("#tree").attr("selected",true);
							}else if("${p.cateCode}" === "edible"){
								$("#edible").attr("selected",true);
							}else if("${p.cateCode}" === "flower"){
								$("#flower").attr("selected",true);
							}else{
								$("#ect").attr("selected",true);
							}
							
							
							
						});

					   </script>
		                
		                
		                
		                <br>
		
		                <div align="center">
		                    <button type="submit" class="btn btn-outline-success">수정하기</button>
		                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:history.go(-1);">이전으로</button>
		                </div>
		            </form>
		        </div>
		        <br><br>
		    </div>
			    
			    
			    
			</div>
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




</head>
<body>

</body>
</html>