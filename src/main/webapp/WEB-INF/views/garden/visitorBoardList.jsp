<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - Garden 방명록</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">
</head>
<body>	
	<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/garden1.jpg);">
			<h2>${ hostUser }님의 방명록</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-10">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="gardenMain.do">정원 메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page">방명록</li>
						</ol>
					</nav>
				</div>
				<c:if test="${hostUser ne loginUser.userId}">
				<div class="col-2">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='gardenMain.do?hostUser=${loginUser.userId}'">내 정원 바로가기</button></li>
						</ol>
					</nav>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<section id="aa-product-category">
		<div class="container" align="center">
			<div class="row my-5">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="aa-product-catg-content">

						<div class="aa-product-catg-body">
							<div class="table-responsive">
								<br>
								<div class="row my-3" style="margin:auto"><input type="text" id="insertContent" name="content" placeholder="방명록을 작성해주세요" style="width:400px" required maxlength='250'>
								&nbsp;<button class="btn btn-outline-success btn-sm" type="button" onclick="insertContent();">작성</button></div>
								<table class="table">
									<!-- ajax구현 -->
								</table>
						</div>
					</div>
				</div>


					<!-- 페이징바 만들기 -->
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
        <!-- 페이지 -->			
            </div>
			</div>            
         </div>
</section>
	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
<script>

	$(document).ready(function(){
		
		selectVBoard();
	})

	function selectVBoard(){
		
		var hostUser = "${hostUser}";
		var currentPage = "${pi.currentPage}";
		
		$.ajax({
			url:"selectVBoard.do",
			data:{hostUser:hostUser, currentPage:currentPage},
			type:"get",
			success:function(map){

				console.log("currentPage" + map.pi.currentPage);
				
				var value = "";
				$.each(map.list, function(i, b){

					if(map.list.length > 0){

									
					value += "<tr style='background-color: lightgray'>" + 
							 "<th><img src='https://cdn-icons-png.flaticon.com/512/3598/3598055.png' alt='' style='width:40px;height:40px'></th>" +
							 "<td id='" + b.boardNo + "userId'>" + b.writer + "</td>" +
							 "<td class='" + b.boardNo + "defB def'>" + b.content + "</td>" +
							 "<td class='" + b.boardNo + "inputB input' style='display:none'>" + 
							 "<div><input type='text' name='content' id='bContent' value='" + b.content + "' style='width:200px' required/>" + 
							 "<button class='btn btn-outline-success btn-sm' type='bytton' onclick='updateBoardContent(" + b.boardNo + ");'>수정</button>" + 
							 "<button class='btn btn-outline-success btn-sm' onclick='cancleUpdateB(" + b.boardNo + ");' >취소</button></div></td>" + 
							 "<th>" + b.enrollDate + "</th>" +
							 "<td><button class='btn btn-outline-success reply' onclick='insertComment(" + b.boardNo + ");'><i class='fa-brands fa-replyd'></i></button>";

					if("${loginUser.userId}" == b.writer){
						value += "<button class='btn btn-outline-success updateBoard' onclick='updateB(" + b.boardNo + ");'><i class='fa-solid fa-eraser'></i></button>";
					}
					if("${loginUser.userId}" == "${hostUser}" || "${loginUser.userId}" == b.writer){
						value += "<button class='btn btn-outline-success deleteBoard' onclick='deleteBoard(" + b.boardNo + ");' ><i class='fa-solid fa-trash-can'></i></button>";
					}
					if("${loginUser.userId}" == b.writer){
						value += "<button class='btn btn-outline-success visitGarden' onclick='visitGarden(" + b.boardNo + ");'><i class='fa-solid fa-leaf'></i></button>";
					}
					
					value += "</td></tr>";
					
					
					$.each(map.comment, function(i, c){
						if(c.boardNo == b.boardNo){
							value += "<tr><td></td>" + 
									 "<td id='" + c.commentNo + "userId'>" + c.userNo + "</td>" +
									 "<td class='" + c.commentNo +"def def'>" + c.content + "</td>" + 
									 "<td class='" + c.commentNo +"input input' style='display:none'>" +  
									 "<div><input type='text' name='content' id='cContent' value='" + c.content +"'/>" + 
									 "<button class='btn btn-outline-success btn-sm' type='submit' onclick='updateCommentContent(" + c.commentNo + ");'>수정</button>" + 
									 "<button class='btn btn-outline-success btn-sm' onclick='cancleUpdate(" + c.commentNo + ");' >취소</button></div></td>" + 
									 "<td>" + c.enrollDate + "</td><td>";
									 
							if("${loginUser.userId}" == c.userNo){		
								value += "<button class='btn btn-outline-success modifyComment' onclick='update(" + c.commentNo + ");' ><i class='fa-solid fa-eraser'></i></button>";
							}
							if("${loginUser.userId}" == "${hostUser}" || "${loginUser.userId}" == c.userNo){
								value += "<button class='btn btn-outline-success deleteComment' onclick='deleteComment(" + c.commentNo +");' ><i class='fa-solid fa-trash-can'></i></button>";
							}
							if("${loginUser.userId}" != c.userNo){
								value += "<button class='btn btn-outline-success visitGarden' onclick='visitGarden(" + c.commentNo +");'><i class='fa-solid fa-leaf'></i></button>";
							}
							value += "</td></tr>";
						}
					})
					
					
					}else{
						value += "<tr><td colspan='5' align='center'>작성된 방명록이 없습니다.</td></tr>";
					}
				})
				
				
				$(".table").html(value);
			
				//-----------------------
				//페이지 처리

				var page = "";

					if(map.pi.currentPage != 1){
						page += "<li class='page-item'><a class='page-link' href='visitorBoard.do?currentPage=" + map.pi.currentPage-1 + "'>" + 
								"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-arrow-left' viewBox='0 0 16 16'>" + 
								"<path fill-rule='evenodd' d='M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z'/>" + 
								"</svg></a></li>";
					}else{
						page += "<li class='page-item disabled'><a class='page-link' href=''>" + 
								"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-arrow-left' viewBox='0 0 16 16'>" + 
								"<path fill-rule='evenodd' d='M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z'/>" + 
								"</svg></a></li>";
					}
					
					for(var p = map.pi.startPage; p <= map.pi.endPage; p++){
						if(map.pi.currentPage != p){
							page += "<li class='page-item'><a class='page-link' href='visitorBoard.do?currentPage=" + p + "'>"+ p +"</a></li>";
						}else{
							page += "<li class='page-item disabled'><a class='page-link' href=''>" + p + "</a></li>";
						}
					}
					
					if(map.pi.currentPage != map.pi.maxPage){
						page += "<li class='page-item'><a class='page-link' href='visitorBoard.do?currentPage="+ (map.pi.currentPage)+1 +"'>" + 
						"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-arrow-right' viewBox='0 0 16 16'>" + 
						"<path fill-rule='evenodd' d='M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z'/>" + 
						"</svg></a></li>";
					}else{
						page += "<li class='page-item disabled'><a class='page-link' href='visitorBoard.do?currentPage="+ (map.pi.currentPage)+1 +"'>" + 
						"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-arrow-right' viewBox='0 0 16 16'>" + 
						"<path fill-rule='evenodd' d='M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z'/>" + 
						"</svg></a></li>";	
					}
				
				
				
				//$(".pagination").html(page);
				
			},
			error:function(){
				console.log("방명록 조회용 ajax 통신 실패")
			}	
		});
		
		
	}
	
	function insertContent(){
		
		var content = $('#insertContent').val();
		var writer = ${loginUser.userNo};
		console.log(writer);
		
		$.ajax({
			url:"vBoardEnroll.do",
			data:{content:content, writer:writer},
			type:"post",
			success:function(result){
				if(result>0){
					selectVBoard();
				}else{
					alert("오류가 발생했습니다. 관리자에게 문의하세요.")
				}
				
			},
			error:function(){
				console.log("방명록 작성용 ajax 통신 실패")
			}
		})
	
	}
	
	//방명록 삭제하기
	function deleteBoard(boardNo){
		
		var yn = confirm("방명록을 삭제하시겠습니까?")
		console.log(yn)
		if(yn){
			
			$.ajax({
				url:"deleteVBoard.do",
				data:{boardNo:boardNo},
				type:"get",
				success:function(result){
					if(result>0){
						selectVBoard();
						alert("삭제되었습니다.");
					}else{
						alert("오류가 발생했습니다. 관리자에게 문의하세요.")
					}
					
				},
				error:function(){
					console.log("방명록 삭제용 ajax 통신 실패")
				}
			})
		}else{
			alert("삭제를 취소했습니다.")
		}
	}
	
	function updateB(no){
		
		var tagDef = $('.' + no + 'defB')
		var tag = $('.' + no + 'inputB')
		console.log(tag)
		
		tagDef.hide();
		tag.show();	
	}
	
	function cancleUpdateB(no){
		
		console.log(no);
		var tagDef = $('.' + no + 'defB')
		var tag = $('.' + no + 'inputB')
		
		tagDef.show();
		tag.hide();	
	}
	
	function updateBoardContent(boardNo){
		var content = $('#bContent').val();
		console.log(content);
		
		$.ajax({
			url:"updateVBoard.do",
			data:{boardNo:boardNo,content:content},
			type:"post",
			success:function(result){
				if(result>0){
					selectVBoard();
				}else{
					alert("오류가 발생했습니다. 관리자에게 문의하세요.")
				}
			},
			error:function(){
				console.log("방명록 수정용 ajax 통신 실패")
			}
		})
		
	}
	
	//회원의 정원 방문하기
	function visitGarden(no){
		
		var userId = $('#' + no + 'userId')[0].innerHTML;
		
		location.href = "gardenMain.do?hostUser=" + userId;
		
	}
	
	function insertComment(boardNo){
		
		var content = prompt("댓글입력 창입니다.");
		
		if(content){
			
			$.ajax({
				url:"insertComment.do",
				data:{boardNo:boardNo,content:content},
				type:"get",
				success:function(result){
					if(result>0){
						selectVBoard();
					}else{
						alert("오류가 발생했습니다. 관리자에게 문의하세요.")
					}
				},
				error:function(){
					console.log("댓글 작성용 ajax 통신 실패")
				}
			})	
		}else{
			alert("내용을 입력해주세요.")
		}
	}
	
	function update(no){
		
		var tagDef = $('.' + no + 'def')
		var tag = $('.' + no + 'input')
		
		tagDef.hide();
		tag.show();	
	}

	function cancleUpdate(no){
		var tagDef = $('.' + no + 'def')
		var tag = $('.' + no + 'input')
		
		tagDef.show();
		tag.hide();	
	}
	
	function updateCommentContent(commentNo){
		
		var content = $('#cContent').val();
		console.log(content);
		
		$.ajax({
			url:"updateComment.do",
			data:{commentNo:commentNo,content:content},
			type:"post",
			success:function(result){
				if(result>0){
					selectVBoard();
				}else{
					alert("오류가 발생했습니다. 관리자에게 문의하세요.")
				}
			},
			error:function(){
				console.log("방명록 댓글 수정용 ajax 통신 실패")
			}
		})
	}
	
	function deleteComment(commentNo){
	
		var yn = confirm("댓글을 삭제하시겠습니까?")

		if(yn){
			
			$.ajax({
				url:"deleteComment.do",
				data:{commentNo:commentNo},
				type:"get",
				success:function(result){
					if(result>0){
						selectVBoard();
						alert("삭제되었습니다.");
					}else{
						alert("오류가 발생했습니다. 관리자에게 문의하세요.")
					}
					
				},
				error:function(){
					console.log("방명록 댓글 삭제용 ajax 통신 실패")
				}
			})
		}else{
			alert("삭제를 취소했습니다.")
		}
	}

</script>

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