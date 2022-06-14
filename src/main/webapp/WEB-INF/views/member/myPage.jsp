<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - 마이페이지 </title>

	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/icon.png">
	
   <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<!-- 다음 지도api -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
  <style>
    body {
      min-height: 100vh;

   	  background: -webkit-gradient(linear, left bottom, right top, from(#FBDB5D), to(#FBDB5D));
      background: -webkit-linear-gradient(bottom left, #FBDB5D 0%, #FBDB5D 100%);
      background: -moz-linear-gradient(bottom left, #FBDB5D 0%, #FBDB5D 100%);
      background: -o-linear-gradient(bottom left, #FBDB5D 0%, #FBDB5D 100%);
      background: linear-gradient(to top right, #FBDB5D 0%, #FBDB5D 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 180px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
      
      
      
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
			style="background-image: url(resources/img/bg-img/springflowers.jpg);">
			<h2>MY PAGE</h2>
		</div>

		

  <div class="container" style="padding-top: 0px">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto" style="margin-top: 100px;">
        <h4 class="mb-3" style="text-align: center;">마이페이지</h4>
        
        <form method="post" class="validation-form" novalidate>
          <div class="row">
          
          
          	<!-- 아이디 -->
          	<div class="col-md-6 mb-3">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="id" name="userId" placeholder="" value="${ loginUser.userId }" readonly>                           
            </div>
             <div class="col-md-6 mb-3" style="padding-top: 30px;">              
            </div>
            
            
            <!-- 이름, 성별, 생년월일 -->
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="userName" placeholder="" value="${ loginUser.userName }" readonly>
              <div id="nameValid"></div>
              <div class="invalid-feedback">
                	이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
            <div style="float: left;">
              <label for="gender">성별</label>              
              <select class="form-control" id="gender" name="gender" disabled>              	
              	<option name="gender" id="Female" value="F" > 여성 </option>
              	<option name="gender" id="Male" value="M"> 남성 </option>
              	<option name="gender" id="Nothing" value="T"> 미공개 </option>
              </select>
                           
              <div class="invalid-feedback">
                	성별을 선택해주세요.
              </div>
              </div>
              <div class="col-md-6 mb-3" style="float: left; margin-left: 20px">
              <label for="birth">생년월일</label>              
              <input class="form-control" type="date" id="birth" name="birth" value="${ loginUser.birth }" readonly>
              <div class="invalid-feedback">
                	생년월일을 입력해주세요.
              </div>
              </div>
            </div>     
           </div>                


		  <!-- 주소 -->
          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" name="address" value="${ loginUser.address }" readonly style="width: 100%" >            
            <div class="invalid-feedback">
             	 주소를 입력해주세요.
            </div>
          </div>          
		 


		  <!-- 상세주소 -->
          <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted" ></span></label>
            <input type="text" class="form-control" id="address2" name="addressDetail" value="${ loginUser.addressDetail }" readonly>
            <div class="invalid-feedback">
             	 상세주소를 입력해주세요.
            </div>
          </div>


		   <!-- 일반전화, 휴대전화 -->
		   <div class="row">
		   	<div class="col-md-6 mb-3">
              <label for="password">일반전화</label>
              <input type="text" class="form-control" id="tel" name="tel" value="${ loginUser.tel }" readonly>              
            </div>
            <div class="col-md-6 mb-3">
              <label for="passwordFeedback">휴대전화</label>
              <input type="text" class="form-control" id="phone" name="phone" value="${ loginUser.phone }" readonly>
              <div class="invalid-feedback">
                	휴대전화를 입력해주세요.
              </div>
            </div>
            </div>


		  <!-- 이메일 -->
		  <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="email" value="${ loginUser.email }" readonly>
            <div id="emailValid"></div>
            <div class="invalid-feedback">
              	이메일을 입력해주세요.
            </div>
          </div>
          
          
          <!-- 선호도 -->
          <div class="mb-3">
            <label for="preference">선호도</label>                  
            <div style=" display: flex;">            	
	            <input class="form-control" id="tree" type="radio" class="form-control" name="preference" value="1" style="width: 30px; height: 18px;" disabled>나무
	            <input class="form-control" id="flower" type="radio" class="form-control" name="preference" value="2" style="width: 30px; height: 18px;" disabled>꽃
	            <input class="form-control" id="eat" type="radio" class="form-control" name="preference" value="3" style="width: 30px; height: 18px;" disabled>식용재배	            
            <div class="invalid-feedback" style="width: 40%; margin-left: 30px">
             	선택해주세요.
            </div>    
            </div>                        
          </div>
          
           
           <!-- 수정, 탈퇴 버튼 -->        
           <div class="row">
		   	<div class="col-md-6 mb-3">
              <button id="modifyBtn" onclick="location.href='/spring/myPageModify.do'" class="btn btn-primary btn-lg btn-block" type="button" style="background: #FBDB5D; border-color: #FBDB5D" >수정</button>             
            </div>
            <div class="col-md-6 mb-3">
              <button id="deleteMember" class="btn btn-primary btn-lg btn-block" type="button" onclick="location.href='/spring/leavePage.do'" style="background: #FBDB5D; border-color: #FBDB5D" >탈퇴</button>              
            </div>
          </div>                 
          
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 Onsil</p>
    </footer>
  </div>
    
  <jsp:include page="../common/footer.jsp" />
  
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
	
	
  <script>    
  	// 성별
  	$(function(){
                    	
   		if("${loginUser.gender}" == "F"){
   			$("#Female").attr("selected", true);
   		}else if("${loginUser.gender}" == "M"){
   			$("#Male").attr("selected", true);
   		}else{
   			$("#Nothing").attr("selected", true);
   		}
   	});
  
  
    // 선호도 라디오 버튼 
    $(function(){
      	
  		if("${loginUser.preference}" == "1"){
  			$("#tree").attr("checked", true);
  		}else if("${loginUser.preference}" == "2"){
  			$("#flower").attr("checked", true);
  		}else{
  			$("#eat").attr("checked", true);
  		}
  	});
  	
  </script>
</body>

</html>