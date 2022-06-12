<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 공지사항</title>
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
			style="background-image: url(resources/img/bg-img/단풍.jpg);">
			<h2>온실 :: 공지사항 관리</h2>
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/spring"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">고객센터</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="adminNotice.do">공지사항 관리</a></li>
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
            <h2>공지사항 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="updateAdminNotice.do">
            	<input type="hidden" name="noticeNo" value="${ n.noticeNo }">
                <table align="center" style="width:100%;">
                    <tr>
                        <th style="width:100px;"><label for="category">카테고리</label></th>
                        <td>
                        	<select name="category" required>
	                			<option> </option>
	                			<option id="mem" name="category" value="1">회원</option>
	                			<option id="order" name="category" value="2">주문결제</option>
	                			<option id="deliver" name="category" value="3">배송</option>
	                			<option id="cancle" name="category" value="4">취소/환불</option>
	                			<option id="point" name="category" value="5">포인트</option>
	                			<option id="exchange" name="category" value="6">반품/교환</option>
	                			<option id="etc" name="category" value="7">기타</option>
	                		</select>
                		</td>			
                    </tr>
                    <tr>
                    	<th>상태</th>
                    	<td>
                    		<select  name="status" required>                    			
                    			<option id="Yes" name="status" value="Y">Y</option>
                    			<option id="No" name="status" value="N">N</option>
                    		</select>
                    	</td>
                    </tr>
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="title" value="${ n.title }" required></td>
                    </tr>                    
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="content" id="content" rows="10" style="resize:none;">${ n.content }</textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
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
 	// 카테고리 선택됨 
	$(function(){
    	
   		if("${n.category}" == "1"){
   			$("#mem").attr("selected", true);
   		}else if("${n.category}" == "2"){
   			$("#order").attr("selected", true);
   		}else if("${n.category}" == "3"){
   			$("#deliver").attr("selected", true);
   		}else if("${n.category}" == "4"){
   			$("#cancle").attr("selected", true);
   		}else if("${n.category}" == "5"){
   			$("#point").attr("selected", true);
   		}else if("${n.category}" == "6"){
   			$("#exchange").attr("selected", true);
   		}else{
   			$("#etc").attr("selected", true);
   		}
   	});
 	
 	// 상태 선택됨
 	$(function(){
 		
 		if("${ n.status }" == 'Y') {
 			$("#Yes").attr("selected", true);
 		}else{
 			$("#No").attr("selected", true);
 		}
 	});
 	
    </script>

</body>
</html>