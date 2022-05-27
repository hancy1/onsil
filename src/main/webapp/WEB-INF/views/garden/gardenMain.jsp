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
    <title>온실 - 정원</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">

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
							<!-- <li class="breadcrumb-item "><a href="#">정원 메인화면</a></li> -->
							<li class="breadcrumb-item active" aria-current="page">정원 메인화면</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
<!-- Preloader-->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="resources/img/core-img/leaf.png" alt="">
        </div>
    </div> 
    
    <!-- ##### Portfolio Area Start ##### -->
    <section class="alazea-portfolio-area portfolio-page section-padding-0-100">
        <!-- <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading 
                    <div class="section-heading text-center">
                        <h2>정원</h2>
                        <p>정원소개하기</p>
                    </div>
                </div>
            </div>
        </div> -->

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="alazea-portfolio-filter">
                        <div class="portfolio-filter">
                            <button class="btn active" data-filter="*">모두보기</button>
                            <button class="btn" data-filter=".design">캘린더</button>
                            <button class="btn" data-filter=".garden">방명록</button>
                            <button class="btn" data-filter=".home-design">데일리로그</button>                       
                        </div>
                    </div>
                </div>
            </div>
            
            <hr>
         	<!-- 방명록 -->
         	<div class="row">
         		<div class="col-12">
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
											<td><button class="btn btn-outline-success reply" data-bs-toggle="tooltip" title="댓글작성" onclick='deleteBoard("${b.boardNo}");'><i class="fa-solid fa-pen"></i></button>
											<c:if test="${hostUser eq loginUser.userId || hostUser eq b.writer}"> 
											<button class="btn btn-outline-success deleteBoard" onclick='deleteBoard("${b.boardNo}");' ><i class="fa-solid fa-trash-can"></i></button>
											</c:if>
											<button class="btn btn-outline-success visitGarden" onclick='visitGarden("${b.writer}");' data-bs-toggle="tooltip" title="정원방문" ><i class="fa-solid fa-leaf"></i></button>
											</td>
	         								</tr>			
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
 
			<hr>

            <div class="row alazea-portfolio">

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item design home-design">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/16.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="resources/img/bg-img/16.jpg" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 1">
                            <div class="port-hover-text">
                                <h3>Minimal Flower Store</h3>
                                <h5>Office Plants</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-6 single_portfolio_item garden">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/17.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="resources/img/bg-img/17.jpg" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 2">
                            <div class="port-hover-text">
                                <h3>Minimal Flower Store</h3>
                                <h5>Office Plants</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item garden office-design">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/19.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="resources/img/bg-img/19.jpg" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 4">
                            <div class="port-hover-text">
                                <h3>Minimal Flower Store</h3>
                                <h5>Office Plants</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item design office-design">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/20.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="resources/img/bg-img/20.jpg" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 5">
                            <div class="port-hover-text">
                                <h3>Minimal Flower Store</h3>
                                <h5>Office Plants</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item garden">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/21.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="resources/img/bg-img/21.jpg" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 6">
                            <div class="port-hover-text">
                                <h3>Minimal Flower Store</h3>
                                <h5>Office Plants</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-6 single_portfolio_item home-design">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/22.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="resources/img/bg-img/22.jpg" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                                <h3>Minimal Flower Store</h3>
                                <h5>Office Plants</h5>
                            </div>
                        </a>
                    </div>
                </div>

                

            </div>
        </div>
    </section>
    <!-- ##### Portfolio Area End ##### -->
    
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