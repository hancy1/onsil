<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정원 | 방명록관리</title>
</head>
<body>	
	<jsp:include page="../common/menubar.jsp" />
	
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>${ hostUser }님의 정원</h2><!-- 나중에 이름 수정 -->
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="gardenMain.do">정원 메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page">방명록</li>
						</ol>
					</nav>
				</div>
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
								<h5>방명록</h5>
								<br>
								<table class="table">
									<!-- <tr class="danger">
										<th>작성자</th>
										<th>내용</th>
										<th>작성일</th>
										<th></th>
										
									</tr> -->
									<c:if test="${ !empty board }">
         								<c:forEach items="${board}" var="b">
	         								<tr style="background-color: lightgray" >
	         								<th><i class="fa-solid fa-comments"></i></th>
	         								<th>${b.writer}</th>	
	         								<!-- <th>${b.content}</th> -->
	         								<td class="${b.boardNo}defB def">${b.content}</td>
	         								<td class="${b.boardNo}inputB input">
	         								<div><form action="updateVBoard.do"><input type="text" name="content" value="${b.content}"/><input type="hidden" name="boardNo" value="${b.boardNo}">
	         								<button class="btn btn-outline-success btn-sm" type="submit">수정</button></form>
	         								<button class="btn btn-outline-success btn-sm" onclick='cancleUpdateB("${b.boardNo}");' >취소</button></div></td>
	         								<th>${b.enrollDate}</th>
											<td><button class="btn btn-outline-success reply"onclick='insertComment("${b.boardNo}");'  data-bs-toggle="tooltip" title="댓글작성" ><i class="fa-brands fa-replyd"></i></button> 
											<c:if test="${loginUser.userId eq b.writer}">
											<button class="btn btn-outline-success updateBoard" onclick='updateB("${b.boardNo}");' ><i class="fa-solid fa-eraser"></i></button>
											</c:if>
											<c:if test="${hostUser eq loginUser.userId || loginUser.userId eq b.writer}"> 
											<button class="btn btn-outline-success deleteBoard" onclick='deleteBoard("${b.boardNo}");' ><i class="fa-solid fa-trash-can"></i></button>
											</c:if>
											<button class="btn btn-outline-success visitGarden" onclick='visitGarden("${b.writer}");' data-bs-toggle="tooltip" title="정원방문" ><i class="fa-solid fa-leaf"></i></button>
											</td>
	         								</tr>
	         								<c:if test="${ !comment.isEmpty() }">
	         								<c:forEach items="${comment}" var="c">
	         								<c:if test="${ c.boardNo == b.boardNo}">
	         								<tr>
	         								<td>댓글</td>	
	         								<td>${c.userNo}</td>
	         								<td class="${c.commentNo}def def">${c.content}</td>
	         								<td class="${c.commentNo}input input">
	         								<div><form action="updateComment.do"><input type="text" name="content" value="${c.content}"/><input type="hidden" name="commentNo" value="${c.commentNo}">
	         								<button class="btn btn-outline-success btn-sm" type="submit">수정</button></form>
	         								<button class="btn btn-outline-success btn-sm" onclick='cancleUpdate("${c.commentNo}");' >취소</button></div></td>
	         								<td>${c.enrollDate}</td>
	         								<td>      								
	         								<c:if test="${loginUser.userId eq c.userNo}"> 		
	         								<button class="btn btn-outline-success modifyComment" onclick='update("${c.commentNo}");' ><i class="fa-solid fa-eraser"></i></button>
											</c:if>
											<c:if test="${hostUser eq loginUser.userId || loginUser.userId eq c.userNo}"> 
											<button class="btn btn-outline-success deleteComment" onclick='deleteComment("${c.commentNo}");' ><i class="fa-solid fa-trash-can"></i></button>
											</c:if>
											<button class="btn btn-outline-success visitGarden" onclick='visitGarden("${b.writer}");' data-bs-toggle="tooltip" title="정원방문" ><i class="fa-solid fa-leaf"></i></button>
											</td>
	         								</tr>
	         								</c:if>
	         								</c:forEach>	
	         								</c:if>		
	         							</c:forEach>
	         							 
         							</c:if>
         							
         							<c:if test="${ empty board }">
									<tr><td colspan="5" align="center">작성된 방명록이 없습니다.</td></tr>
									</c:if>
								</table>
		
							<p>
							<button class="btn btn-outline-success btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
							    방명록 작성하기
							</button>
							</p>
							<div class="collapse" id="collapseExample">
							  <div class="card card-body">
							    <div><form action="vBoardEnroll.do"><input type="text" name="content"><input type="hidden" name="writer" value="${ loginUser.userNo }"/><button class="btn btn-outline-success btn-sm" type="submit" >작성하기</button></form></div>
							  </div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</section>

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
            
	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
<script>

	$(document).ready(function(){
		$('.def').show();
		$('.input').hide();

	})

	//방명록 삭제하기
	function deleteBoard(boardNo){
		
		var yn = confirm("방명록을 삭제하시겠습니까?")
		console.log(yn)
		if(yn){
			location.href="deleteVBoard.do?boardNo=" + boardNo;
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
		var tagDef = $('.' + no + 'defB')
		var tag = $('.' + no + 'inputB')
		
		tagDef.show();
		tag.hide();	
	}
	
	//회원의 정원 방문하기
	function visitGarden(userId){
		
		location.href = "gardenMain.do?hostUser=" + userId;
		
	}
	
	function insertComment(boardNo){
		
		var content = prompt("댓글입력 창입니다.");
		console.log(content.length);
		console.log(boardNo);
		
		if(content == null || content.length < 0){
			alert("내용을 입력해주세요.")
		}else{
			console.log(content.length);
			console.log(content);
			location.href = "insertComment.do?content=" + content + "&boardNo=" + boardNo;
			
		}
	
		
		
	}
	
	function update(no){
		
		var tagDef = $('.' + no + 'def')
		var tag = $('.' + no + 'input')
		console.log(tag)
		
		tagDef.hide();
		tag.show();	
	}
	
	
	
	function cancleUpdate(no){
		var tagDef = $('.' + no + 'def')
		var tag = $('.' + no + 'input')
		
		tagDef.show();
		tag.hide();	
	}
	
	function deleteComment(commentNo){
	
		var yn = confirm("댓글을 삭제하시겠습니까?")

		if(yn){
			location.href="deleteComment.do?commentNo=" + commentNo;
		}else{
			alert("삭제를 취소했습니다.")
		}
	}

</script>
		<!-- 페이징바 만들기 -->
		
	
	
	
	
	
	
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