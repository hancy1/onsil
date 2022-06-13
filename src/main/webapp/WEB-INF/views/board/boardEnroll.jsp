<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>온실 :: 자유게시판</title>

    <!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png"> 

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(img/bg-img/24.jpg);">
            <h2>온실 :: 자유게시판</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="boardList.do">자유게시판</a></li>
                            <li class="breadcrumb-item active" aria-current="page">글 작성하기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->
    
    <!-- ##### Blog Content Area Start ##### -->
    <section class="blog-content-area section-padding-0-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Blog Posts Area -->
                <div class="col-12 col-md-8">
                    <div class="blog-posts-area">
                       
                        <!-- Leave A Comment -->
                        <div class="leave-comment-area clearfix">
                            <div class="comment-form">
                                <h4 class="headline">게시글 작성하기</h4>

                                <div class="contact-form-area">
                                    <!-- Comment Form --><!-- 첨부파일 등록할꺼니깐 Multipart/form-data encType 지정하기 -->
                                    <form id="enrollForm" action="insertBoard.do" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="bno" value="${ b.BNo }">
                                        <div class="row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="BTitle" placeholder="제목을 입력해주세요.">
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <input type="hidden" class="form-control" value="${ loginUser.userNo }" name="userNo" readonly>
                                                </div>
                                            </div>
                                   			<div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <select name="BCategoryNo" class="form-control">
                                                    	<option value="">카테고리 선택</option>
                                                    	<option value="1">사진</option>
                                                    	<option value="2">정보</option>
                                                    	<option value="3">후기</option>
                                                    	<option value="4">기타</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <input type="file" class="form-control" id="upfile" name="uploadFile" required>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <textarea class="form-control" required name="BContent" cols="30" rows="10" placeholder="내용을 작성해 주세요."></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn alazea-btn">작성하기</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Blog Content Area End ##### -->
    
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
</body>
</html>