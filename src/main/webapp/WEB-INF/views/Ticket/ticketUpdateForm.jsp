<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#updateForm>table{
	width:80%;
 	 margin:auto;
	}
    #updateForm>table *{ margin:5px;}
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
							<li class="breadcrumb-item active" aria-current="page">티켓수정하기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
 

    <div class="content" align="center">
        <br><br>
        <div class="innerOuter" align="center">
            <h2>티켓수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="updateTicket.do" enctype="multipart/form-data">
            	<input type="hidden" name="ticketNo" value="${ t.ticketNo }">
                <table align="center">
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
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
                            <c:if test="${ !empty t.originName }">
	                                                               현재 업로드된 파일 : ${ t.originName } <br>
	                            <input type="hidden" name="changeName" value="${ t.changeName }">
	                            <input type="hidden" name="originName" value="${ t.originName }">
                            </c:if>
                        </td>
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