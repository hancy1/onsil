<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Insert title here</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png"> 

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
			
			  <form id="updateForm" method="post" action="updateTicket.do" enctype="multipart/form-data">
            	<input type="hidden" name="rbNo" value="${ rb.rbNo }">
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
                <table align="center">
                   
                    <tr>
                        <th><label for="rbTitle">제목</label></th>
                        <td><input type="text" id="rbTitle" class="form-control" name="rbTitle" value="${ rb.rbTitle }"  required></td>
                    </tr>
                  
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control"  name="userId" value="${ loginUser.userId }" readonly></td>
                        <td><input type="hidden" id="writer" class="form-control"  name="userNo" value="${ loginUser.userNo }" readonly></td>
                        
                    </tr>
                    <div class="col-12 col-md-6">
                           <div class="form-group">
                           <select name="category" class="form-control" id="category" value="${ rb.TCategoryNo }" required>
                               <option name="">카테고리 선택</option>
                               <option value="Fair">전시회후기</option>
                               <option value="exhibition">박람회후기</option>
                              
                               </select>
                                 </div>
                            </div>
                         
 
                     <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
                            <c:if test="${ !empty rb.originName }">
	                                                               현재 업로드된 파일 : ${ rb.originName } <br>
	                            <input type="hidden" name="changeName" value="${ rb.changeName }">
	                            <input type="hidden" name="originName" value="${ rb.originName }">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" value="${ rb.rbContent }" required name="rbContent" id="content" rows="10" style="resize:none; ">${ rb.rbContent }</textarea></th>
                    </tr>
                </table>
                <br>

                 <div align="center">
                    <button type="submit" class="btn btn-primary">수정완료</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
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