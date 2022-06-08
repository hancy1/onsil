<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Insert title here</title>

<style>
 	#enrollForm>table{
 	width:80%;
 	 margin:auto;
 	 }
    #enrollForm>table *{ margin:5px;}
    
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
			<h2>후기게시판</h2>
		</div>
    	<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">예약</a></li>
							<li class="breadcrumb-item active" aria-current="page">후기게시판</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<div class="content">
        <br><br>
         <div class="innerOuter" align="center"><br>
            <h2>후기게시판</h2>
            <br>
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="inserRBoard.do" enctype="multipart/form-data">
                <table align="center">
                   
                    <tr>
                        <th><label for="rbTitle">제목</label></th>
                        <td><input type="text" id="rbTitle" class="form-control" name="rbTitle" value="${r.rbTitle}" required></td>
                    </tr>
                  
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control"  name="userId" value="${ loginUser.userId }" required></td>
                        <td><input type="hidden" id="writer" class="form-control"  name="userNo" value="${ loginUser.userNo }" required></td>
                        
                    </tr>
                    <div class="col-12 col-md-6">
                           <div class="form-group">
                           <select name="category" class="form-control" id="category">
                               <option name="">카테고리 선택</option>
                               <option value="Fair">전시회후기</option>
                               <option value="prohibit">박람회후기</option>
                              
                               </select>
                                 </div>
                            </div>
                         
 
                    <tr>
                         <th>첨부파일</th>
                    <td colspan="3">
                    	<c:if test="${ !empty r.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/RB_upload_files/${r.changeName}" download="${ r.originName }">${ r.originName }</a>
                        </c:if>
                        <c:if test="${ empty r.originName }">
                        	첨부파일이 없습니다.
                        </c:if>
                    </td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="rbContent" id="content" rows="10" style="resize:none;">${ r.rbContent }</textarea></th>
                    </tr>
                </table>
                <br>

              <c:if test="${ loginUser.userId eq r.userNo }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ r.rbNo }">
					<input type="hidden" name="fileName" value="${ r.changeName }"> 
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormRBoard.do");
						}else{
							postForm.attr("action", "deleteRBoard.do");
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