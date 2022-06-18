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
    
    <!-- jQuery library 제이쿼리 라이브러리 추가!!!!!!!!!!!!!! -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- 모달창 -->
    <style>
    .background {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.3);
      z-index: 1000;

      /* 숨기기 */
      z-index: -1;
      opacity: 0;
    }

    .show {
      opacity: 1;
      z-index: 1000;
      transition: all 0.5s;
    }

    .window {
      position: relative;
      width: 100%;
      height: 100%;
    }

    .popup {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #ffffff;
      box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);

      /* 모달창 크기 */
      width: 400px;
      height: 350px;

      /* 초기에 약간 아래에 배치 */
      transform: translate(-50%, 20%);
    }

    .show .popup {
      transform: translate(-50%, -50%);
      transition: all 0.5s;
    }
  </style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(img/bg-img/24.jpg);">
            <h2>자유게시판</h2>
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
                                    <a href="gardenMain.do?hostUser=${ loginUser.userNo }"><i class="fa fa-user" aria-hidden="true"></i>${ b.userName }</a>
                                        <div class="post-meta mb-30" align="right">
											<a>좋아요♡</a>
											<a><i>/</i></a>
		                                    <a id="show">신고하기</a>
		                                    <!-- 모달 창 -->
											<div class="background">
											  <div class="window">
											    <div class="popup">
											    	<br>
											    	<form id="bReportForm" action="bReport.do" method="get">
											    		<input type="hidden" name="bno" value="${ b.BNo }">
												    	<h3 style="color: #2C3539">신고하기</h3>
												    	<hr>	
												    	<div class="radio">											    	
												        <ol style="color: #7BCCB5">
													        <li><input type="radio" name="bReport" value="1" required> 1. 욕설, 비방, 차별, 혐오 </li>
													        <li><input type="radio" name="bReport" value="2" required> 2. 홍보, 영리 목적 </li>
													        <li><input type="radio" name="bReport" value="3" required> 3. 음란, 청소년 유해 </li>
													        <li><input type="radio" name="bReport" value="4" required> 4. 개인정보 노출, 유포, 거래 </li>
													        <li><input type="radio" name="bReport" value="5" required> 5. 도배, 스팸 </li>
													        <li><input type="radio" name="bReport" value="6" required> 6. 기타 </li>
												        </ol>
												        </div>
												        <br><br>
												        <button type="submit" class="btn" onclick="bReport();">신고</button>	
												      	<button type="button" class="btn" id="close">취소</button>
											      	</form>
											      	<script>
														function bReport(){
															
															var bReportForm = $("#bReportForm");
												
															bReportForm.attr("action", "bReport.do");
											
															alert("신고가 완료되었습니다.");
															
															bReportForm.submit();
														}
											      	</script>									    
											      </div>
											  </div>
											</div>
		                                </div>                                
                                </div>
                                
                                <!-- 게시글 사진과 내용 -->
                                <div class="post-thumbnail mb-30">
                                	<c:if test="${ !empty b.BChangeName }">	                                
	                                    <img src="resources/b_upload_files/${ b.BChangeName }">
	                                </c:if>
	                                <c:if test="${ empty b.BChangeName }">	                                
	                                </c:if>	                                
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
	                            <c:if test="${ loginUser.userNo eq b.userNo }">
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
									                            <textarea class="form-control" id="reContent" rows="2" style="resize:none; width:100%"></textarea>
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
								                <tbody></tbody>
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
                                    <img src="" alt="">
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
                                    <img src="" alt="">
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
                                    <img src="" alt="">
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
                                    <a href="shop-details.html"><img src="" alt=""></a>
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
                                    <a href="shop-details.html"><img src="" alt=""></a>
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
                                    <a href="shop-details.html"><img src="" alt=""></a>
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
    
	<script>
		// 모달 창 보임
		function show() {
		  document.querySelector(".background").className = "background show";
		}
		// 모달 창 닫힘
		function close() {
		  document.querySelector(".background").className = "background";
		  return;
		}
		
		document.querySelector("#show").addEventListener("click", show);
		document.querySelector("#close").addEventListener("click", close);
	</script>
    
    <script>
    // 게시물 신고하기
    $(".btn_report").on("click",function(){
    	$("#bReport").val("");
    	
    })
    
    </script>
    
	<script>
		// 댓글 작성
	 	$(function(){
			selectReplyList();
			
			$("#addReply").click(function(){
	
				if($("#reContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsertBoard.do",
						type:"post",
						data:{reContent:$("#reContent").val(),
								bno:"${b.BNo}",
								userNo:"${ loginUser.userNo }"},
						success:function(result){
							if(result > 0){
								$("#reContent").val("");
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
	 	
		//댓글 목록 생성
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
						
						if("${loginUser.userNo}" == obj.userName){
							value += "<tr style='background:#EAFAF1'>";
						}else{
							value += "<tr>";
						}
						
						value += "<th>" + obj.userName + "</th>" + 
								"<td>" + obj.reContent + "</td>" + 
								"<td>" + obj.reDate + "</td>" +
								"<td><button class='btn btn-danger' onclick='deleteReply(" + obj.reNo + ");'>삭제</button></td>" + 
							 "</tr>";
					});
					$("#replyArea tbody").html(value);
				},error:function(){
					console.log("댓글 리스트 조회용 ajax 통신 실패!");
				}
			});
		}
		
		// 댓글 삭제...
	 	function deleteReply() {
			
			if(){
				$.ajax({
					url:"rdeleteBoard.do",
					type:"post",
					data:{reNo:reNo},				
					success:function(result){
						
						if(result > 0){	
							selectReplyList();
							alert("댓글이 삭제되었습니다.");	
						}else{
							alert("댓글 삭제 실패!");
						}
					},error:function(){
						console.log("댓글 삭제 ajax 통신 실패!");
					}
				});
			}
		}
    </script>

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