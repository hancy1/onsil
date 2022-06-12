<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 | 자주묻는질문 관리</title>
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
			style="background-image: url(resources/img/bg-img/튤립.jpg);">
			<h2>온실 :: 자주묻는질문 관리</h2>
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
            
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th>글번호</th>
                    <td>${ f.faqNo }</td>
                    <th>카테고리</th>
                    <td>${ f.categoryName }</td>                    
                </tr>
                <tr>                    
                    <th>작성일</th>
                    <td>${ f.createDate }</td>
                    <th>상태</th>
                    <td>${ f.status }</td>
                </tr>
                <tr>
                    <th width="100">질문</th>
                    <td colspan="3">${ f.question }</td>
                </tr>
                <tr>
                    <th>답변</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${ f.answer }</p></td>
                </tr>
            </table>
            <br>
				
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="fno" value="${ f.faqNo }">					
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormAdminFaq.do");
						}else{
							if(confirm("글을 삭제하시겠습니까?")){
								postForm.attr("action", "deleteAdminFaq.do");
							}else{
								alert("글 삭제를 취소하셨습니다.");
								return;
							}											
						}
						postForm.submit();
					}
				</script>
            
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
    	
    </script>

</body>
</html>