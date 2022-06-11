<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

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
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/style.css">
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
                            <li class="breadcrumb-item active" aria-current="page">게시글 상세보기</li>
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
                                              
                        <!-- Post Details Area -->
                        <div class="single-post-details-area">
                            <div class="post-content">
                                <h4 class="post-title">[ ${ b.BCategoryName } ] ${ b.BTitle }</h4>
                                <div class="post-meta mb-30">
                                    <a><i class="fa fa-clock-o" aria-hidden="true"></i>${ b.BDate }</a>
                                    <a href="gardenMain.do?hostUser=${ loginUser.userNo }"><i class="fa fa-user" aria-hidden="true"></i>${ b.userId }</a>
                                </div>
                                <div class="post-meta mb-30" align="right">
									<a><i>좋아요♡</i></a>
                                    <a><i>신고하기</i></a>
                                </div>
                                
                                <div class="post-thumbnail mb-30">
	                                
	                                    <img src="resources/b_upload_files/${ b.BChangeName }">
	                                
                                </div>                                
                                <p>${ b.BContent }</p>
                            </div>
                        </div>

                        <!-- Post Tags & Share -->
                        <div class="post-tags-share d-flex justify-content-between align-items-center">                            
                            <!-- Share -->
                            <div class="post-share">
                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            </div>
                            <!-- 수정, 삭제 버튼 -->
                            <div align="right">
	                            <c:if test="${ loginUser.userId eq b.userId }">
	                            <ol class="popular-tags d-flex align-items-center flex-wrap">
	                                <li><a onclick="bSubmit(1);">수정하기</a></li>
	                                <li><a onclick="bSubmit(2);">삭제하기</a></li>
	                            </ol>
	                            <form id="postForm" action="" method="post">
									<input type="hidden" name="bno" value="${ b.BNo }">
									<input type="hidden" name="fileName" value="${ b.BChangeName }"> 
								</form>
	                            <script>
									function bSubmit(num){
										var postForm = $("#postForm");
							
										if(num == 1){
											postForm.attr("action", "updateForm.do");
										}else{
											postForm.attr("action", "deleteBoard.do");
											alert("삭제가 완료되었습니다.");
										}
										postForm.submit();
									}
								</script>
	                            </c:if>
                            </div>
                        </div>

                        <!-- 댓글 -->
                        <div class="comment_area clearfix" id="replyArea">
                            <h4 class="headline">댓글 [ <span id="rcount">0</span> ]</h4>

                            <ol>
                                <!-- Single Comment Area -->
                                <li class="single_comment_area">
                                    <div class="comment-wrapper d-flex">
                                        <!-- Comment Content -->
                                        <div class="comment-content">
                                        	<table id="replyArea" class="table" align="center">
								                <thead>
								                    <tr>
								                    	<c:if test="${ !empty loginUser }">
									                        <th colspan="2" style="width:75%">
									                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%"></textarea>
									                        </th>
									                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply">등록하기</button></th>
								                        </c:if>
								                        <c:if test="${ empty loginUser }">
								                        	<th colspan="2" style="width:75%">
									                            <textarea class="form-control" readonly rows="2" style="resize:none; width:100%">로그인 후 이용해주세요.</textarea>
									                        </th>
									                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
								                        </c:if>
								                    </tr>
								                </thead>
								                <tbody>
								                
								                </tbody>
								            </table>
                                        </div>
                                    </div>
                                </li>                           
                            </ol>
                        </div>                      
                    </div>
                </div> 
                   
                <!-- 게시글 사이드바 -->
                <div class="col-12 col-sm-9 col-md-4">
                    <div class="post-sidebar-area">
                    
                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <form action="#" method="get" class="search-form">
                                <input type="search" name="search" id="widgetSearch" placeholder="Search...">
                                <button type="submit"><i class="icon_search"></i></button>
                            </form>
                        </div>                      

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h4>인기 게시글</h4>
                            </div>

                            <!-- Single Latest Posts -->
                            <div class="single-latest-post d-flex align-items-center">
                                <div class="post-thumb">
                                    <img src="img/bg-img/30.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="#" class="post-title">
                                        <h6>New Harris Bugg design for Bridgewater</h6>
                                    </a>
                                    <a href="#" class="post-date">20 Jun 2018</a>
                                </div>
                            </div>

                            <!-- Single Latest Posts -->
                            <div class="single-latest-post d-flex align-items-center">
                                <div class="post-thumb">
                                    <img src="img/bg-img/31.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="#" class="post-title">
                                        <h6>The designers will create a new kitchen garden</h6>
                                    </a>
                                    <a href="#" class="post-date">20 Jun 2018</a>
                                </div>
                            </div>

                            <!-- Single Latest Posts -->
                            <div class="single-latest-post d-flex align-items-center">
                                <div class="post-thumb">
                                    <img src="img/bg-img/32.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="#" class="post-title">
                                        <h6>SGD Members win Best of Houzz Design Award</h6>
                                    </a>
                                    <a href="#" class="post-date">20 Jun 2018</a>
                                </div>
                            </div>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h4>최근 게시글</h4>
                            </div>

                            <!-- Single Best Seller Products -->
                            <div class="single-best-seller-product d-flex align-items-center">
                                <div class="product-thumbnail">
                                    <a href="shop-details.html"><img src="img/bg-img/4.jpg" alt=""></a>
                                </div>
                                <div class="product-info">
                                    <a href="shop-details.html">Cactus Flower</a>
                                    <p>$10.99</p>
                                    <div class="ratings">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Best Seller Products -->
                            <div class="single-best-seller-product d-flex align-items-center">
                                <div class="product-thumbnail">
                                    <a href="shop-details.html"><img src="img/bg-img/5.jpg" alt=""></a>
                                </div>
                                <div class="product-info">
                                    <a href="shop-details.html">Tulip Flower</a>
                                    <p>$11.99</p>
                                    <div class="ratings">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Best Seller Products -->
                            <div class="single-best-seller-product d-flex align-items-center">
                                <div class="product-thumbnail">
                                    <a href="shop-details.html"><img src="img/bg-img/34.jpg" alt=""></a>
                                </div>
                                <div class="product-info">
                                    <a href="shop-details.html">Recuerdos Plant</a>
                                    <p>$9.99</p>
                                    <div class="ratings">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Blog Content Area End ##### -->
    
	<script>
	 	$(function(){
			selectReplyList();
			
			$("#addReply").click(function(){
	    		var bno = ${b.BNo};
	
				if($("#replyContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsertBoard.do",
						type:"post",
						data:{replyContent:$("#replyContent").val(),
							  refBoardNo:bno,
							  replyWriter:"${ loginUser.userId }"},
						success:function(result){
							if(result > 0){
								$("#replyContent").val("");
								selectReplyList();
								
							}else{
								alert("댓글 등록에 실패했습니다.");
							}
						},error:function(){
							console.log("댓글 작성 ajax 통신 실패!");
						}
					});
					
				}else{
					alert("댓글을 등록해주세요.");
				}
				
			});
		});
	 	
	 	function selectReplyList(){
			var bno = ${b.BNo};
			$.ajax({
				url:"rlistBoard.do",
				data:{bno:bno},
				type:"get",
				success:function(list){
					$("#rcount").text(list.length);
					
					var value="";
					$.each(list, function(i, obj){
						
						if("${loginUser.userId}" == obj.replyWriter){
							value += "<tr style='background:#EAFAF1'>";
						}else{
							value += "<tr>";
						}
						
						value += "<th>" + obj.replyWriter + "</th>" + 
									 "<td>" + obj.replyContent + "</td>" + 
									 "<td>" + obj.createDate + "</td>" +
							 "</tr>";
					});
					$("#replyArea tbody").html(value);
				},error:function(){
					console.log("댓글 리스트 조회용 ajax 통신 실패!");
				}
			});
		}   
    </script>
    
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