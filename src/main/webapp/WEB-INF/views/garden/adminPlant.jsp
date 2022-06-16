<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 식물정보 관리</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">
<style>

th, td {
  text-align: center;
}

.danger {

	font-weight: bold;
}
</style>
</head>
<body>	
	<jsp:include page="../common/menubar.jsp" />

	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/garden2.jpg);">
			<h2>ADMIN :: 식물정보 관리</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">식물정보 관리</li>
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
								<br>
					            <div style="float:left" class="my-2"><h6 id="infoLength"></h6></div>
								<div style="float:right" class="my-2">
								<button class="btn btn-outline-success btn-sm" type="button" onclick="location.href='insertPlantForm.do'">식물정보 추가 <i class="fa-solid fa-plus"></i></button>
								</div>
								<div style="float:right" class="my-2"> 
								<button class="btn btn-outline-secondary btn-sm" onclick="selectInfoList();">전체</button> &nbsp;&nbsp;
					         	<button class="btn btn-outline-secondary btn-sm" onclick="selectInfoList('Y');">상태 Y</button> &nbsp;&nbsp;
					         	<button class="btn btn-outline-secondary btn-sm" onclick="selectInfoList('N');">상태 N</button> &nbsp;&nbsp;
					         	</div>	
								<br>
								<table class="table table-striped" text-align="center">
									<!-- ajax 구현 -->
								</table>
							</div>							
						</div>
						<!-- ##### Single Widget Area ##### -->
						<div class="col-4 col-md-4">
		                    <div class="post-sidebar-area">
		                        <div class="single-widget-area">
	                                <input type="search" name="search" id="widgetsearch" placeholder="품종 검색">
	                                <button class="btn" type="button" onclick="searchInfo();"><i class="icon_search"></i></button>
		                        </div>
		                     </div>
			            </div>	
					</div>
			<!-- 페이징바 만들기 -->
				<div id="pagingArea">
		                <ul class="pagination">
		                	<c:choose>
		                		<c:when test="${ pi.currentPage ne 1 }">
		                			<li class="page-item"><a class="page-link" href="adminPlant.do?currentPage=${ pi.currentPage-1 }">
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
		                    			<li class="page-item"><a class="page-link" href="adminPlant.do?currentPage=${ p }">${ p }</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
			                		</c:otherwise>
			                	</c:choose>
		                    </c:forEach>
		                    
		                    <c:choose>
		                		<c:when test="${ pi.currentPage ne pi.maxPage }">
		                			<li class="page-item"><a class="page-link" href="adminPlant.do?currentPage=${ pi.currentPage+1 }">
		                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
		  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
									</svg></a>
									</li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="adminPlant.do?currentPage=${ pi.currentPage+1 }">
		                			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
		  							<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
									</svg></a>
									</li>
		                		</c:otherwise>
		                	</c:choose>
		                </ul>
           			 </div>
				</div>
			</div>
		</div>		
</section>
<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
<script>

	$(function(){
		selectInfoList();
	})
	
	function selectInfoList(search){
		
		console.log(search)
	
		var currentPage = "${pi.currentPage}";
			
		$.ajax({
			url:"selectInfoList.do",
			data:{currentPage:currentPage, search:search},
			type:"post",
			success:function(map){
				
				var value = "<tr class='danger'><td>등록번호</td><td>카테고리</td><td>품종</td><td>관수량</td><td>일조량</td><td>상태</td><td></td></tr>";
				
				$.each(map.info, function(i, i){
					
					$("#infoLength").html("등록된 식물 정보 : " + map.info.length);

					if(map.info.length > 0){
						
							value += "<tr>"+
									 "<td width='10%'>no." + i.regNo + "</td>" +
									 "<td width='10%'>" + i.category + "</td>" + 
									 "<td width='10%'>" + i.plantName + "</td>" +
									 "<td>" + i.water + "</td>" +
									 "<td>" + i.sun + "</td>" + 
									 "<td width='10%'>" + i.status + "</td>" +
									 "<td width='10%'>" + 
									 "<button class='btn btn-outline-success updatePlant' onclick='updatePlantForm(" + i.regNo + ");' ><i class='fa-solid fa-eraser'></i></button>" +
									 "<button class='btn btn-outline-success deletePlant' onclick='deletePlant(" + i.regNo + ");' ><i class='fa-solid fa-trash-can'></i></button>" +
									 "</td></tr>";
					}else{
						value += "<tr><td colspan='7' align='center'>등록된 식물정보가 없습니다.</td></tr>";
					}
				})
				$(".table").html(value);
			},
			error:function(){
				console.log("관리자 식물정보 조회용 ajax 통신 실패")
			}
		});
	}
	
	function searchInfo(){
		
		var search = $('#widgetsearch').val();

		selectInfoList(search);
		
	}
	
	function updatePlantForm(regNo){
		location.href='updatePlantForm.do?regNo=' + regNo;
	}
	
	function deletePlant(regNo){
		
		var yn = confirm("정보를 삭제하시겠습니까?");
		if(yn){
			
			$.ajax({
				url:"deletePlant.do",
				data:{regNo:regNo},
				type:"post",
				success:function(result){
					if(result > 0){
						alert("정상적으로 삭제되었습니다.");
						selectInfoList();
					}		
				},
				error:function(){
					console.log("관리자 식물정보 삭제용 ajax 통신 실패");
				}
	
			})
		}
	}

</script>
	
	<!-- i태그 이미지 cdn -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<jsp:include page="../common/footer.jsp" />
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