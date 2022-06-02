<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#contentArea{width:100%}
	#contentArea *{margin:5px}
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
        <div class="innerOuter">
            <h2>티켓 상세보기</h2>
            <br>
            
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">티켓번호</th>
                    <td colspan="3">${ t.ticketNo }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ t.userId }</td>
                </tr>
                <tr>    
                    <th>작성일</th>
                    <td>${ t.ticketDate }</td>
                </tr>
                 <tr>
                        <th>전시회명</th>
                        <td>${ t.ticketTitle }</td>
                    </tr>
                    <tr>
                        <th>가격코드</th>
                        <td>${ t.price }</td>
                    </tr>
                     <tr>
                        <th>전화번호</th>
                        <td>${ t.ticketPhone }</td>
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
                <tr>
                    <th>공지사항</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${ t.ticketNotice }</p></td>
                </tr>
            </table>
            <br>
	
			<c:if test="${ loginUser.userNo eq t.userNo }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
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

        
                    
                </thead>
                <tbody>
                
                </tbody>
            </table>
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