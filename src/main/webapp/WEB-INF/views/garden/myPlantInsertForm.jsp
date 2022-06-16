<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
		</div>

		<div class="container">
			<div class="row">
				<div class="col-10">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
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
							<div class="content">
					        <br><br>
					        <div class="innerOuter">	
					       	 <form id="enrollForm" method="post" action="insertMyPlant.do" enctype="multipart/form-data">
                <table align="center">                    
                    <tr>
                    	<th><label for=plantName>식물 이름</label></th>
                    	<td><input type="text" name="plantName" id="plantName" required>
                    	<select id="info" onchange="selectInfo();">
                    		<option value="">식물 정보를 확인해보세요</option>
                    		<c:forEach items="${info}" var="info">
                    			<option value="${info.regNo}">${info.plantName}</option>
                    		</c:forEach>
                    	</select>
                    	</td>
                    </tr>
                    <tr>
                    	<th><label for="nickname">별명 등록</label></th>
                    	<td><input type="text" name="nickname" id="nickname" style="width:400px" placeholder="미입력 시 식물 이름으로 저장됩니다."></td>
                    </tr>
                    <tr>
                    	<th><label for="water">관수량</label></th>
                    	<td><input type="text" name="water" id="water" required style="width:400px" placeholder="ex) 겉흙이 마를 때 물을 줌"></td>
                    </tr>
                    <tr>
                    	<th><label for="sun">일조량</label></th>
                    	<td><input type="text" name="sun" id="sun" required  style="width:400px" placeholder="ex) 직사광선을 피해 밝은 곳에 둠"></td>
                    </tr>
                    <tr>
                    	<th><label for="enrollDate">등록일</label></th>
                    	<td><input type="date" name="enrollDate" id="enrollDate"></td>
                    	<input type="hidden" name="userNo" value="${loginUser.userNo}">
                    </tr>
                    <tr>
                    	<td colspan="2"><input type="file" id="upfile" class="form-control-file border input-file-button" name="upfile" required></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-success">등록하기</button>
                    <button type="reset" class="btn btn-success">초기화</button>
                </div>
            </form>				            
			<br><br>				            
	        </div>
        <br><br>
   	</div>							
</div>		
</section>

    
<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	
	<script type="text/javascript">

	$(function(){
		 //등록일을 오늘 날짜로
		 document.getElementById('enrollDate').value = new Date().toISOString().substring(0, 10);	

		 
	});
	
	function selectInfo(){
		
		var select = document.getElementById('info')		
		var regNo = select.options[select.selectedIndex].value;
		
		
		$.ajax({
			
			url:"selectPlantInfo.do",
			data:{regNo:regNo},
			type:"get",
			success:function(info){

				document.getElementById('plantName').value = info.plantName;
				document.getElementById('water').value = info.water;
				document.getElementById('sun').value = info.sun;
				
			},
			error:function(){
				console.log("plantInfo ajax 통신 실패")
			}
		});	
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