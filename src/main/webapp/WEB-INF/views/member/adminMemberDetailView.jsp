<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 회원 관리</title>
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
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>ADMIN :: 회원 관리</h2>
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/spring"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">관리자</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="adminMember.do">회원 관리</a></li>
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
            <h2>회원 관리</h2>
            <br>
            
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th>회원번호</th>
                    <td>${ m.userNo }</td>
                    <th>아이디</th>
                    <td>${ m.userId }</td>                               
                </tr>
                <tr>
                	<th>이름</th>
                    <td>${ m.userName }</td>  
                    <th>상태</th>
                    <td>${ m.status }</td>
                </tr>
                <tr>                    
                    <th>생년월일</th>
                    <td>${ m.birth }</td>
                    <th>성별</th>
                    <td>${ m.gender }</td>                    
                </tr>
                <tr>
                    <th>주소</th>
                    <td>${ m.address }</td>
                    <th>상세주소</th>
                    <td>${ m.addressDetail }</td>                    
                </tr>
                <tr>
                    <th>일반전화</th>
                    <td>${ m.tel }</td>
                    <th>휴대전화</th>
                    <td>${ m.phone }</td>       
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${ m.email }</td>
                    <th>선호도</th>
                    <td>${ m.preference }</td>     
                </tr>
                <tr>
                    <th>가입일</th>
                    <td>${ m.enrollDate }</td>
                    <th>탈퇴일</th>
                    <td>${ m.delDate }</td>     
                </tr>
            </table>
            <br>
				
	            <div align="center">	                
	            	<button class="btn btn-primary" onclick="postFormSubmit(1);">회원복구</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="mno" value="${ m.userNo }">					
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
							if(num == 1) {
								if(confirm("회원을 복구하시겠습니까?")){
									postForm.attr("action", "updateAdminMember.do");
								}else{
									alert("회원 복구를 취소하셨습니다.");
									return;
								}
							}else{
								if(confirm("회원을 삭제하시겠습니까?")){
									postForm.attr("action", "deleteAdminMember.do");
								}else{
									alert("회원 삭제를 취소하셨습니다.");
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