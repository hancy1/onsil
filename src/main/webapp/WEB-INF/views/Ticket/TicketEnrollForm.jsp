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
							<li class="breadcrumb-item active" aria-current="page">티켓등록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

    <div class="content">
        <br><br>
        <div class="innerOuter"><br>
            <h2>티켓등록</h2>
            <br>
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="insertTicket.do" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="ticketNo">티켓번호</label></th>
                        <td><input type="text" id="ticketNo" class="form-control" name="ticketNo" required></td>
                    </tr>
                    <tr>
                        <th><label for="ticketTitle">전시회명</label></th>
                        <td><input type="text" id="title" class="form-control" name="ticketTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control"  name="writer" required></td>
                    </tr>
                     <tr>
                        <th><label for="price">가격코드</label></th>
                        <td><input type="text" id="price" class="form-control" name="price" required></td>
                    </tr>
                    <tr>
                        <th><label for="ticketPhone">전화번호</label></th>
                        <td><input type="text" id="ticketPhone" class="form-control" name="ticketPhone" required></td>
                    </tr>
                  
                   
                    <tr>
                        <th colspan="2"><label for="content">공지사항</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="ticketNotice" id="content" rows="10" style="resize:none;"></textarea></th>
                    </tr>
                     <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="uploadFile"></td>
                    </tr>
                </table>
                <br>
               
                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                   <button type="button" onclick="location.href='ticketAddress.do' " class="btn btn-primary">위치확인</button>
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