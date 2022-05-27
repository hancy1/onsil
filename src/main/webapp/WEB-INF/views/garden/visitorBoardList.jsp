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
								<table class="table table-striped">
									<tr class="danger">
										<th>작성자</th>
										<th>내용</th>
										<th>작성일</th>
										<th></th>
										
									</tr>
									<c:if test="${ !board.isEmpty() }">
         								<c:forEach items="${board}" var="b">
	         								<tr>
	         								<td>${b.writer}</td>	
	         								<td>${b.content}</td>
	         								<td>${b.enrollDate}</td>
											<td><button class="btn btn-outline-success reply"onclick='insertComment("${b.boardNo}");'  data-bs-toggle="tooltip" title="댓글작성" ><i class="fa-solid fa-pen"></i></button> 
											<c:if test="${hostUser eq loginUser.userId || hostUser eq b.writer}"> 
											<button class="btn btn-outline-success deleteBoard" onclick='deleteBoard("${b.boardNo}");' ><i class="fa-solid fa-trash-can"></i></button>
											</c:if>
											<button class="btn btn-outline-success visitGarden" onclick='visitGarden("${b.writer}");' data-bs-toggle="tooltip" title="정원방문" ><i class="fa-solid fa-leaf"></i></button>
											</td>
	         								</tr>
	         								<c:if test="${ !comment.isEmpty() }">
	         								<c:forEach items="${comment}" var="c">
	         								<c:if test="${ c.boardNo == b.boardNo}">
	         								<tr>
	         								<td>${c.userNo}</td>	
	         								<td>${c.content}</td>
	         								<td>${c.enrollDate}</td>
	         								<td>버튼자리</td>
	         								</tr>
	         								</c:if>
	         								</c:forEach>	
	         								</c:if>		
	         							</c:forEach>
	         							 
         							</c:if>
         							
         							<c:if test="${ board.isEmpty() }">
									<tr><td colspan="4" align="center">작성된 방명록이 없습니다.</td></tr>
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
<script>

	//방명록 삭제하기
	function deleteBoard(boardNo){
		
		var yn = confirm("방명록을 삭제하시겠습니까?")
		console.log(yn)
		if(yn){
			location.href="deleteVBoard.do?boardNo=" + boardNo;
			alert("방명록을 삭제했습니다.")
		}else{
			alert("삭제를 취소했습니다.")
		}
	}
	
	//회원의 정원 방문하기
	function visitGarden(userId){
		
		location.href = "gardenMain.do?hostUser=" + userId;
		
	}
	
	function insertComment(boardNo){
		
		var content = prompt("댓글입력 창입니다.");
		console.log(content);
		console.log(boardNo);
	
		location.href = "insertComment.do?content=" + content + "&boardNo=" + boardNo;
		
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