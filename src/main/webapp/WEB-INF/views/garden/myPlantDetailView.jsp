<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - Garden 내식물관리</title>
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
			<h2>${ hostUser }님의 식물정보</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-10">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<!-- 이 부분 나중에 수정..? -->
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item "><a href="gardenMain.do">정원 메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page">내식물관리</li>
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
								<h5>내 식물 관리</h5>
								<br>
								<table class="table">
       								<tr>
       								<td><img src="resources/garden_upload_files/${plant.serverName}" alt="" width="130" height="130"></td>
       								<td>no.${plant.plantNo}<br>
       								<i class="fa-solid fa-seedling"></i> : [${plant.plantName}] ${plant.nickname}<br>
       								<i class="fa-solid fa-droplet"></i> : ${plant.water}<br>
       								<i class="fa-solid fa-sun"></i> : ${plant.sun}
       								</td>	
       								<td><br><br>${plant.enrollDate}</td>
       								<c:if test="${hostUser eq loginUser.userId}">
       								<td><br><br><a class="btn btn-outline-success" type="button" href="updateMyPlantForm.do?plantNo=${plant.plantNo}">수정</a> 
       											<button class="btn btn-outline-success" type="button" onclick="deleteMyPlant();">삭제</button></td></c:if>
       				       			</tr>	
								</table>
								<br>
								<table class="table" id="growList">
       							<!-- 관리내역 테이블 -->
								</table>
								<h6 style="color:gray" align="right">물주기는 <i class="fa-solid fa-droplet"></i>, 영양제는 <i class="fa-solid fa-prescription-bottle-medical"></i>, 분갈이는 <i class="fa-solid fa-seedling"></i>로 표시됩니다.</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</section>

<!-- jQuery-2.2.4 js -->
<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
<script>
	function deleteMyPlant(){
		
		var yn = confirm("해당 식물을 삭제하시겠습니까? 삭제 시 관리내역도 함께 삭제됩니다.");
		
		if(yn){
			
			var plantNo = "${plant.plantNo}";
			var fileName = "${plant.fileName}";
			
			$.ajax({
				url:"deleteMyPlant.do",
				data:{plantNo:plantNo,fileName:fileName},
				type:"post",
				success:function(result){
					
					if(result > 0){
						alert("삭제되었습니다.")
						location.href = "myPlant.do";
					}else{
						alert("삭제 중 오류가 발생했습니다.")
					}
					
				},
				error:function(){
					console.log("내 식물 리스트 삭제용 ajax 통신 실패")
					}
				});
			
		}
	}

	$(function(){
		selectGrowList();
	})

	function selectGrowList(){
		
		var plantNo = ${plant.plantNo};
		console.log(plantNo);
		
		$.ajax({
			url:"selectGrowList.do",
			data:{plantNo:plantNo},
			type:"get",
			success:function(growList){
				console.log(growList);
				var value = "";
				
				value += "<tr><th>날짜</th><th>관리내역</th><th>비고</th><th></th></tr>";
				
				$.each(growList, function(i, grow){
					
					if(growList.length != 0){
						
						value += "<tr><th class='def" + grow.listNo + "'>" + (grow.enrollDate).substr(0,16) + "</th><th class='def" + grow.listNo + "'>"; 
							 if(grow.water == 'Y'){
								 value += "<i class='fa-solid fa-droplet'></i>&nbsp;&nbsp;";
							 }
							 if(grow.supplement == 'Y'){
								 value += "<i class='fa-solid fa-prescription-bottle-medical'></i>&nbsp;&nbsp;";
							 }
							 if(grow.repotting == 'Y'){
								 value += "<i class='fa-solid fa-seedling'></i>";
							 }
						value += "</th><th class='def" + grow.listNo + "'>" + grow.etc + "</th>";
						
						if(${hostUser eq loginUser.userId}){
							value += "<th><button class='btn' type='button' onclick='updateGrowList(" + grow.listNo + ");'>" + 
									 "<i class='fa-solid fa-eraser'></i></button> " + 
									 "<button class='btn' type='button' onclick='deleteGrowList(" + grow.listNo + ");'>" + 
									 "<i class='fa-solid fa-xmark'></i></button></th>";
						}
						
						value += "</tr>";
						
					}			
				});
				
				if(growList.length == 0){
					value += "<tr><td colspan='4' align='center'>등록된 관리내역이 없습니다.</td></tr>"
				}
				$("#growList").html(value);
				
			},
			error:function(){
				console.log("식물 관리내역 리스트 조회용 ajax 통신 실패")
			}
		});
		
	}

	function deleteGrowList(listNo){

		var yn = confirm("관리내역을 삭제하시겠습니까?");
		
		if(yn){
			
			$.ajax({
				url:"deleteGrowList.do",
				data:{listNo:listNo},
				type:"get",
				success:function(result){
					
					if(result > 0){
						alert("삭제되었습니다.")
						selectGrowList();
					}else{
						alert("삭제 중 오류가 발생했습니다.")
					}
					
				},
				error:function(){
					console.log("식물 관리내역 리스트 삭제용 ajax 통신 실패")
					}
				});
		}
	}
	
	function updateGrowList(listNo){
		
		console.log(listNo);

		location.href = "updatePlantGrowForm.do?listNo=" + listNo;
	}
</script>	
	
	
	
	
	
	
	
	
	
	
	
<jsp:include page="../common/footer.jsp" />
<!-- i태그 이미지 cdn -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />

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