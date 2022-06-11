<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">
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
                                    <a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${fn:substring(log.enrollDate,0,16)}</a>
                                </div>
                                <div class="post-thumbnail mb-30">
                                	<c:if test="${ log.serverName != null }">
                                    <img src="resources/garden_upload_files/${log.serverName}" alt="">
                                    </c:if>
                                </div>
                                
                            </div>
                            <c:if test="${ hostUser == loginUser.userId }">
                            <hr>
                            <a class="btn btn-outline-success btn-sm" href="updateDailyLogForm.do?logNo=${log.logNo}"><i class="fa-solid fa-eraser"></i></a>
                            <button class="btn btn-outline-success btn-sm" type="button" onclick='deleteLog();'><i class="fa-solid fa-trash-can"></i></button>
                        	<hr>
                        	</c:if>
                        	<p>${log.content}</p>
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
                            <h6 class="headlineCheck"></h6>  
                            <ol>                               
                            </ol>
                        </div>
                        <!-- Comment Area End -->
        </div>
    </div>
<script>

	$(function(){
		selectComment();
	})
	
	function selectComment(){
		
		var logNo = ${log.logNo};
		
		$.ajax({
			url:"selectCommentList.do",
			data:{logNo:logNo},
			type:"get",
			success:function(comment){
				
				$(".headlineCheck").text(comment.length + "Comments");
				
				var value = "";
				$.each(comment, function(i, c){
				
					value += "<li class='single_comment_area'>";
					
					if(comment.length != 0){			
						if(c.commentType == 0){
							console.log("${loginUser.userId}" == "${hostUser}");
							value +=  "<div class='comment-wrapper d-flex'>" +
			                            <!-- Comment Meta -->
			                            "<div class='comment-author'>" +
			                                "<img src='https://cdn-icons-png.flaticon.com/512/1983/1983305.png' alt=''>" +  
			                            "</div>" +
			                            <!-- Comment Content -->
			                            "<div class='comment-content'>" +
			                                "<div class='d-flex align-items-center justify-content-between'>" +
			                                    "<h5>" + c.userNo + "</h5>" +
			                                    "<span class='comment-date'>" + c.enrollDate + "</span>" +
			                                "</div>" +
			                                "<p class='def" + c.commentNo + "'>" + c.content + "</p>"+
			                                "<div class='modify" + c.commentNo + "' style='display:none'>" +	
	                                		"<input type='text' id='update" + c.commentNo + "' name='content' value='" + c.content + "'>" +
	                                		"<button class='btn' type='button' onclick='updateComment(" + c.commentNo + ");'>수정</button>" +
	                                		"<button class='btn' type='button' onclick='closeModify(" + c.commentNo + ");'>닫기</button>" +
			                                "</div>" +
			                                "<a class='active' onclick='openInput(" + c.commentNo + ");'>Reply</a>"; 
			                                
			                                if("${loginUser.userId}" == c.userNo){
	                                            value += " | <a class='active' onclick='modifyComment(" + c.commentNo +");'>Modify</a>";
			                                }
                                            if("${loginUser.userId}" == "${hostUser}"){
                                            	value +=  " | <a class='active' onclick='deleteComment(" + c.commentNo +");'>Delete</a>"; 
                                            }
		                                            
                                            if("${loginUser.userId}" == c.userNo){
                                            <!-- 답글 달기 -->
		                                             value += "<div class='reInput" + c.commentNo +"' style='display:none'>" +
			                                         "<input type='text' id='reContent" + c.commentNo + "' name='content' placeholder='Comment'>" +
			                                         "<button class='btn' type='button' onclick='insertReComment(" + c.commentNo + ");'>Reply</button>" +
		                                             "<button class='btn' type='button' onclick='closeInput(" + c.commentNo + ");'>Cancel</button></div>";
                                            }
                                        value += "</div></div>";
                                   }
						
								if(c.commentType == 1){
									value += "<ol class='children'>" +
                                                    "<li class='single_comment_area'>" + 
                                                        "<div class='comment-wrapper d-flex'>" +
                                                            <!-- Comment Meta -->
                                                            "<div class='comment-author'>" + 
                                                                "<img src='https://cdn-icons-png.flaticon.com/512/628/628338.png' alt=''>" +
                                                            "</div>" +
                                                            <!-- Comment Content -->
                                                            "<div class='comment-content'>" + 
                                                                "<div class='d-flex align-items-center justify-content-between'>" + 
                                                                    "<h5>" + c.userNo + "</h5>" +
                                                                    "<span class='comment-date'>" + c.enrollDate + "</span>" +
                                                                "</div>" + 
                                                                "<p class='def" + c.commentNo + "'>답글 : " +  c.content + "</p>" +
                                                                "<div class='modify" + c.commentNo + "' style='display:none'>" +	
                    	                                		"<input type='text' id='update" + c.commentNo + "' name='content' value='" + c.content + "'>" +
                    	                                		"<button class='btn' type='button' onclick='updateComment(" + c.commentNo + ");'>수정</button>" +
                    	                                		"<button class='btn' type='button' onclick='closeModify(" + c.commentNo + ");'>닫기</button>" +
                    			                                "</div>";
                                                                <!--  <a class="active" href="#">Reply</a>-->
                                                                
                                                                if("${loginUser.userId}" == c.userNo){
                    	                                            value += "<a class='active' onclick='modifyComment(" + c.commentNo +");'>Modify</a> | " +
                    			                                             "<a class='active' onclick='deleteComment(" + c.commentNo +");'>Delete</a>" }
                                                                
                                                            value += "</div>" + 
                                                        "</div>" + 
                                                    "</li>" + 
                                                "</ol>"; } 	
                                                }   
						if(comment.length == 0){
	                    	value += "<div class='comment-wrapper d-flex'>" +
			                         "<div class='comment-content'>" + 
			                         "<p>작성된 댓글이 없습니다</p>" + 
			                         "</div>" + 
			                    	 "</div>";
	                    }
                         value += "</li>";            	
					})	
				$(".comment_area ol").html(value);
			},
			error:function(){
				console.log("댓글 리스트 조회용 ajax 통신 실패")
			}
			
		})
		
		
	}
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
						selectComment();		
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
						selectComment();
							
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
	
	//댓글, 답글 삭제
	function deleteComment(commentNo){
		
		var yn = confirm("해당 댓글을 삭제하시겠습니까?")
		if(yn){
			$.ajax({
				url:"deleteLogComment.do",
				type:"post",
				data:{commentNo:commentNo},				
				success:function(result){
					
					if(result > 0){	
						selectComment();
							
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
		
		$(".modify"+commentNo).show();
		
		var def = $('.def'+commentNo)
		def.hide();
	}
	
	
	function closeModify(commentNo){
		var div = $('.modify'+commentNo)
		div.hide();
		
		var def = $('.def'+commentNo)
		def.show();
	}
	
	//댓글 답글 수정
	function updateComment(commentNo){
		
		var content = $('#update'+commentNo).val();
		
		$.ajax({
			url:"updateLogComment.do",
			type:"post",
			data:{
				commentNo:commentNo,
				content:content
			},				
			success:function(result){
				
				if(result > 0){	
					selectComment();
						
				}else{
					alert("댓글수정실패");
				}
			},error:function(){
				console.log("댓글 수정 ajax 통신 실패");
			}
		});
		
		
	}
	
</script>
      <!-- Blog Sidebar Area -->
      <div class="col-12 col-sm-9 col-md-4">
          <div class="post-sidebar-area">
         	 <div class="single-widget-area">
                    			
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
                                            
                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h4>Recent post</h4>
                            </div>
							
							<c:if test="${ !list.isEmpty() }">
							<c:forEach items="${list}" var="list">
                            <!-- Single Latest Posts -->
                            <div class="single-latest-post d-flex align-items-center">
                                <div class="post-thumb">
                                	<c:if test="${list.serverName != null}">
                                    	<img src="resources/garden_upload_files/${list.serverName}" alt="">
                                    </c:if>
                                    <c:if test="${list.serverName == null}">
                                    	<img src="resources/garden_upload_files/noImage.png" alt="">
                                    </c:if>
                                </div>
                                <div class="post-content">
                                    <a href="logDetail.do?logNo=${list.logNo}" class="post-title">
                                        <c:choose>
											<c:when test="${fn:length(list.content)>14}">
												<c:out value="${fn:substring(list.content,0,13)}"/>...
											</c:when>
											<c:otherwise>
												<c:out value="${list.content}"/>
											</c:otherwise>
										</c:choose>
                                    </a>
                                    <a href="#" class="post-date">${list.enrollDate}</a>
                                </div>
                            </div>
                            </c:forEach>
                            </c:if>
                            <c:if test="${ list.isEmpty() }">
                            	<h6>작성된 데일리로그가 없습니다.</h6>
                            </c:if>
                            
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