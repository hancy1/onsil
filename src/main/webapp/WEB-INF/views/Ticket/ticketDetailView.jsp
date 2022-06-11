<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png"> 
<style>
 	#contentArea{
 	width:80%;
 	 margin:auto;
 	 }
    #contentArea *{ margin:5px;}
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
			<h2>티켓등록</h2>
		</div>
    	<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">관리자페이지</a></li>
							<li class="breadcrumb-item active" aria-current="page">티켓상세보기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

    <div class="content">
        <br><br>
        <div class="innerOuter" align="center"><br>
            <h2>티켓상세보기</h2>
            <br>
			
		
                <table id="contentArea" align="center">
                    <tr>
                        <th><label for="ticketNo">티켓번호</label></th>
                        <td><input type="text" id="ticketNo" class="form-control" name="ticketNo" value="${t.ticketNo}" required></td>
                    </tr>
                    <tr>
                        <th><label for="division">티켓구분코드</label></th>
                        <td><input type="text" id="division" class="form-control" name="division" value="${t.division}" required></td>
                    </tr>
                    <tr>
                        <th><label for="ticketTitle">전시회명</label></th>
                        <td><input type="text" id="title" class="form-control" name="ticketTitle" value="${t.ticketTitle}" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control"  name="userNo" value="${ loginUser.userId }" required></td>
                    </tr>
                     <tr>
                        <th><label for="price">가격코드</label></th>
                        <td><input type="text" id="price" class="form-control" name="price"  value="${ t.price }" required></td>
                    </tr>
                    <tr>
                        <th><label for="ticketPhone">전화번호</label></th>
                        <td><input type="text" id="ticketPhone" class="form-control" name="ticketPhone" value="${ t.ticketPhone }" required></td>
                    </tr>
                  
                   
                    <tr>
                        <th colspan="2"><label for="content">공지사항</label></th>
                    </tr>
                    <tr>
                      <th colspan="2"><textarea class="form-control" required name="ticketNotice" id="content" rows="10" style="resize:none;">${ t.ticketNotice }</textarea></th>
                    
                     
                    </tr>
                      <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                    	<c:if test="${ !empty t.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/T_upload_files/${t.changeName}" download="${ t.originName }">${ t.originName }</a>
                        </c:if>
                        <c:if test="${ empty t.originName }">
                        	첨부파일이 없습니다.
                        </c:if>
                    </td>
                </tr>
                </table>
                <br>
               
               <c:if test="${ loginUser.userId eq t.userNo }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	                <button type="button" onclick="location.href='ticketAddress.do' " class="btn btn-primary">위치확인</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ t.ticketNo }">
					<input type="hidden" name="fileName" value="${ t.changeName }"> 
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormTicket.do");
						}else{
							postForm.attr("action", "deleteTicket.do");
						}
						postForm.submit();
					}
				</script>
            </c:if>
            <br><br>
               
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