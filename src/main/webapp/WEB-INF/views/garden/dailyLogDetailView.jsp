<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session" />
	</c:if>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>${ hostUser }님의 정원</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<!-- 이 부분 나중에 수정..? -->
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="gardenMain.do">정원 메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page">데일리로그</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<section class="blog-content-area section-padding-0-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Blog Posts Area -->
                <div class="col-12 col-md-8">
                    <div class="blog-posts-area">

                        <!-- Post Details Area -->
                        <div class="single-post-details-area">
                            <div class="post-content">
                                <!-- <h4 class="post-title">Garden designers across the country forecast ideas shaping the gardening world in 2018</h4> -->
                                <div class="post-meta mb-30">
                                	<a href="#"><i class="fa fa-user" aria-hidden="true"></i>${log.userNo}</a>
                                    <a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${log.enrollDate}</a>
                                </div>
                                <div class="post-thumbnail mb-30">
                                	<c:if test="${ log.serverName != null }">
                                    <img src="resources/garden_upload_files/${log.serverName}" alt="">
                                    </c:if>
                                </div>
                                <p>${log.content}</p>
                            </div>
                            <c:if test="${ hostUser == loginUser.userId }">
                            <a class="btn btn-outline-success btn-sm" href="updateDailyLogForm.do?logNo=${log.logNo}"><i class="fa-solid fa-eraser"></i></a>
                            <button class="btn btn-outline-success btn-sm" type="button" onclick='deleteLog();'><i class="fa-solid fa-trash-can"></i></button>
                        	</c:if>
                        </div>
                        <form id="postForm" action="deleteDailyLog.do" method="post">
							<input type="hidden" name="logNo" value="${ log.logNo }">
							<input type="hidden" name="fileName" value="${ log.fileName }"> 
						</form>
						<!-- jQuery-2.2.4 js -->
						<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
                        <script>
                        
                        	function deleteLog(){
                        		
                        		var yn = confirm("데일리로그를 삭제하시겠습니까?")
                        		var postForm = $("#postForm");
                        		if(yn){
                        			postForm.submit();
                        		}
                        	}
                        
                        </script>

                        <!-- Comment Area Start -->
                        <div class="comment_area clearfix">
                            <h6 class="headline">${fn:length(comment)} Comments</h6>
                            <ol>
                                <!-- Single Comment Area -->
                                <li class="single_comment_area">
                                	<c:if test="${ !comment.isEmpty()}">                  	
                                	<c:forEach items="${comment}" var="c">
                                	<c:if test="${c.commentType == 0}">
                                    <div class="comment-wrapper d-flex">
                                        <!-- Comment Meta -->
                                        <div class="comment-author">
                                            <!-- <img src="resources/img/bg-img/37.jpg" alt=""> -->
                                            <i class="fa-solid fa-seedling"></i>
                                            <i class="fa-solid fa-seedling"></i>
                                        </div>
                                        <!-- Comment Content -->
                                        <div class="comment-content">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h5>${c.userNo}</h5>
                                                <span class="comment-date">${c.enrollDate}</span>
                                            </div>
                                            <p>${c.content}</p>
                                            <div id="modify${c.commentNo} modify">
                                            	<form action="modifyComment.do">
                                            		<input type="text" name="content" value="${c.content}">
                                            		<input type="hidden" name="commentNo" value="${c.commentNo}">
                                            		<button type="submit">수정</button>
                                            	</form>
                                            </div>
                                            <a class="active" onclick="openInput(${c.commentNo});">Reply</a> |
                                            <c:if test="${loginUser.userId == c.userNo }">
                                            <a class="active" onclick="modifyComment(${c.commentNo});">Modify</a> |
                                            <a class="active" onclick="deleteComment(${c.commentNo});">Delete</a>
                                            <div class="reInput${c.commentNo}" style="display:none">
	                                         <input type="text" id="reContent${c.commentNo}" name="content" placeholder="Comment">
	                                            <button class="btn" type="button" onclick="insertReComment(${c.commentNo});">Reply</button>
                                            	<button class="btn" type="button" onclick="closeInput(${c.commentNo});">Cancel</button></div>
                                            </c:if>
                                        </div>
                                    </div>
                                    </c:if>
                                    <c:if test="${c.commentType == 1}">
                                    <ol class="children">
                                        <li class="single_comment_area">
                                            <div class="comment-wrapper d-flex">
                                                <!-- Comment Meta -->
                                                <div class="comment-author">
                                                    <img src="resources/img/bg-img/38.jpg" alt="">
                                                </div>
                                                <!-- Comment Content -->
                                                <div class="comment-content">
                                                    <div class="d-flex align-items-center justify-content-between">
                                                        <h5>${c.userNo}</h5>
                                                        <span class="comment-date">${c.enrollDate}</span>
                                                    </div>
                                                    <p>답글 : ${c.content}</p>
                                                    <!--  <a class="active" href="#">Reply</a>-->
                                                </div>
                                            </div>
                                        </li>
                                    </ol> 
                                    </c:if>
                                   </c:forEach>
                                    </c:if>
                                    <c:if test="${ comment.isEmpty()}">
                                    	<div class="comment-wrapper d-flex">
                                        <div class="comment-content">
                                            <p>작성된 댓글이 없습니다</p>
                                        </div>
                                    	</div>
                                    </c:if>
                                   
                                    
                                </li>
                            </ol>
                        </div>
              
              <!-- pagingArea Start -->      
              <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="visitorBoard.do?currentPage=${ pi.currentPage-1 }">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
							</svg></a>
							</li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
							</svg></a>
							</li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="visitorBoard.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="visitorBoard.do?currentPage=${ pi.currentPage+1 }">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
							</svg></a>
							</li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="visitorBoard.do?currentPage=${ pi.currentPage+1 }">
                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
							</svg></a>
							</li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
            <br>
			<!-- pagingArea End -->
			
                        <!-- Leave A Comment -->
                        <div class="leave-comment-area clearfix">
                            <div class="comment-form">
                                <h4 class="headline">Leave A Comment</h4>

                                <div class="contact-form-area">
                                    <!-- Comment Form -->
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <textarea class="form-control" name="content" id="content" cols="30" rows="10" placeholder="Comment"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn alazea-btn comment-btn" onclick="insertComment();">댓글 남기기</button>
                                            </div>
                                        </div>    
                                </div>
                            </div>
                        </div>
                        
                        

                    </div>
                </div>
                
                

<script>

	function openInput(commentNo){

		var div = $('.reInput'+commentNo)
		div.show();	
	}
	
	function closeInput(commentNo){
		var div = $('.reInput'+commentNo)
		div.hide();
	}
	
	//일반댓글 인서트하기
	function insertComment(){
		
		var content = $('#content').val();
		var logNo = ${log.logNo};
		
		if($("#content").val().trim().length != 0){
			
			$.ajax({
				url:"insertLogComment.do",
				type:"post",
				data:{logNo:logNo,
					  userNo:"${loginUser.userNo}",
					  content:content,
					  commentType:0
				},
					  
				success:function(result){
					
					if(result > 0){
						$("#content").val("");
						history.go(0);
						//selectReplyList();		
					}else{
						alert("댓글등록실패");
					}
				},error:function(){
					console.log("댓글 작성 ajax 통신 실패");
				}
			});
			
		}else{
			alert("댓글을 입력해주세요.");
		}
	}
	
	//답글 인서트하기
	function insertReComment(commentNo){
		
		console.log(commentNo);
		
		var content = $('#reContent'+commentNo).val();
		console.log(content);
		
		var logNo = ${log.logNo};
		
		if($('#reContent'+commentNo).val().trim().length != 0){
			
			$.ajax({
				url:"insertLogReComment.do",
				type:"post",
				data:{logNo:logNo,
					  commentGroup:commentNo,
					  userNo:"${loginUser.userNo}",
					  content:content,
					  commentType:1
				},
					  
				success:function(result){
					
					if(result > 0){
						$('.reInput'+commentNo).hide();
						history.go(0);
							
					}else{
						alert("댓글등록실패");
					}
				},error:function(){
					console.log("댓글 작성 ajax 통신 실패");
				}
			});
			
		}else{
			alert("댓글을 입력해주세요.");
		}
	}
	
	function deleteComment(commentNo){
		
		var yn = confirm("해당 댓글을 삭제하시겠습니까?")
		if(yn){
			$.ajax({
				url:"deleteLogComment.do",
				type:"post",
				data:{commentNo:commentNo},				
				success:function(result){
					
					if(result > 0){	
						history.go(0);
							
					}else{
						alert("댓글삭제실패");
					}
				},error:function(){
					console.log("댓글 삭제 ajax 통신 실패");
				}
			});
		}
		
	}
	
	function modifyComment(commentNo){
		
		var div = modifyComment()
	}
</script>
                <!-- Blog Sidebar Area -->
                <div class="col-12 col-sm-9 col-md-4">
                    <div class="post-sidebar-area">                        

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Author Widget -->
                            <div class="author-widget">
                                <div class="author-thumb-name d-flex align-items-center">
                                    <div class="author-thumb">
                                        <img src="resources/img/bg-img/29.jpg" alt="">
                                    </div>
                                    <div class="author-name">
                                        <h5>Alan Jackson</h5>
                                        <p>Editor</p>
                                    </div>
                                </div>
                                <p>I’m the editor for houseplants &amp; garden design articles on social, and I like to put each of those articles in the topic.</p>
                                <div class="social-info">
                                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h4>Recent post</h4>
                            </div>

                            <!-- Single Latest Posts -->
                            <div class="single-latest-post d-flex align-items-center">
                                <div class="post-thumb">
                                    <img src="resources/img/bg-img/30.jpg" alt="">
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
                                    <img src="resources/img/bg-img/31.jpg" alt="">
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
                                    <img src="resources/img/bg-img/32.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="#" class="post-title">
                                        <h6>SGD Members win Best of Houzz Design Award</h6>
                                    </a>
                                    <a href="#" class="post-date">20 Jun 2018</a>
                                </div>
                            </div>

                            <!-- Single Latest Posts -->
                            <div class="single-latest-post d-flex align-items-center">
                                <div class="post-thumb">
                                    <img src="resources/img/bg-img/33.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="#" class="post-title">
                                        <h6>Shepherding Vegetables From Roof to Restaurant</h6>
                                    </a>
                                    <a href="#" class="post-date">20 Jun 2018</a>
                                </div>
                            </div>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h4>Tag Cloud</h4>
                            </div>
                            <!-- Tags -->
                            <ol class="popular-tags d-flex flex-wrap">
                                <li><a href="#">PLANTS</a></li>
                                <li><a href="#">NEW PRODUCTS</a></li>
                                <li><a href="#">CACTUS</a></li>
                                <li><a href="#">DESIGN</a></li>
                                <li><a href="#">NEWS</a></li>
                                <li><a href="#">TRENDING</a></li>
                                <li><a href="#">VIDEO</a></li>
                                <li><a href="#">GARDEN DESIGN</a></li>
                            </ol>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h4>BEST SELLER</h4>
                            </div>

                            <!-- Single Best Seller Products -->
                            <div class="single-best-seller-product d-flex align-items-center">
                                <div class="product-thumbnail">
                                    <a href="shop-details.html"><img src="resources/img/bg-img/4.jpg" alt=""></a>
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
                                    <a href="shop-details.html"><img src="resources/img/bg-img/5.jpg" alt=""></a>
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
                                    <a href="shop-details.html"><img src="resources/img/bg-img/34.jpg" alt=""></a>
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
    

	<jsp:include page="../common/footer.jsp" />
	
	<!-- i태그 이미지 cdn -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	
	<!-- ##### All Javascript Files ##### -->
	
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