<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 판매제품 등록</title>



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




</head>
<body>
    
    <jsp:include page="../common/menubar.jsp"/>
    
    
    <!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>ADMIN :: 판매제품 등록</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">관리자페이지</a></li>
							<li class="breadcrumb-item"><a href="#">판매제품관리</a></li>							
							<li class="breadcrumb-item active" aria-current="page">새제품등록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    


	
    <div class="content">
        <br><br>
        <div class="innerOuter">
           
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="insertProduct.do" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="proCode">판매상품코드</label></th>
                        <td><input type="text" id="proCode" class="form-control" name="proCode" required></td>
                    </tr>
                    <tr>
                        <th><label for="cateCode">카테고리(다시해야됨)</label></th>
                        <td>
						<select name="cateCode">
						    <option value="">카테선택</option>
						    <option value="tree">나무</option>
						    <option value="edible">식용식물</option>
						    <option value="flower">꽃</option>
						    <option value="ect">기타</option>
						</select>
						</td>
                    </tr>
                    <tr>
                        <th><label for="proName">판매상품명</label></th>
                        <td><input type="text" id="proName" class="form-control"  name="proName" required></td>
                    </tr>
                    <tr>
                        <th><label for="price">가격</label></th>
                        <td><input type="text" id="price" class="form-control" name="price" required></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">대표이미지</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="uploadFile"></td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">상세페이지</label></th>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea class="summernote" id="summernote" name="proContent"></textarea></td>
                    </tr>
                </table>
                <br>

				
				<script>
				$('.summernote').summernote({
				  	placeholder: 'content',
			        minHeight: 370,
			        maxHeight: null,
			        focus: true, 
			        lang : 'ko-KR'
					});
				</script>
				
				
	
				
                <div align="center">
                    <button type="submit" class="btn btn-outline-success">등록하기</button>
                   
                </div>
            </form>
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