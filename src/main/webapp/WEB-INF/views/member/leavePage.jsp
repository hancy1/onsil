<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 | 탈퇴페이지 </title>
	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/favicon.ico">   
		
	<!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />	
    
	<style>
		body {
	      min-height: 100vh;
	
	      background: -webkit-gradient(linear, left bottom, right top, from(#79b07b), to(#5a8c5c));
	      background: -webkit-linear-gradient(bottom left, #79b07b 0%, #5a8c5c 100%);
	      background: -moz-linear-gradient(bottom left, #79b07b 0%, #5a8c5c 100%);
	      background: -o-linear-gradient(bottom left, #79b07b 0%, #5a8c5c 100%);
	      background: linear-gradient(to top right, #79b07b 0%, #5a8c5c 100%);
	    }
	    
	    .input-form {
	      text-align:center;
	      width: 680px;
	
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
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>온실 :: 탈퇴</h2>
		</div>
 
 
 	<!-- 탈퇴 본문 -->
 	<div class="container">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-12 mx-auto" style="margin-top: 100px; margin-left: 0px; margin-bottom: 100px;">
		 		<h4>탈퇴페이지</h4>
		 		<br><br>	 		
		 		<div>
		 			<p>
		 				저희 온실(溫室)을 탈퇴하시면, 열심히 가꾸었던 나의 정원과 이제껏 기록해왔던 회원님의 일정들,<br>
		 				우리 이웃들과 주고 받았던 이야기들. 그리고 구매내역 모두가 사라지게 됩니다.<br>
		 				정말 탈퇴하시겠습니까?<br>
		 				<br>
		 				탈퇴를 원하신다면 현재 비밀번호를 입력해주세요.
		 			</p>
		 		</div>
		 		
		 		<!-- 비밀번호 입력 칸  -->
		 		<div>
		 			<table style="margin: auto; border-style: solid; border-color: #12D400; width: 200px;">
		 				<tr>
		 					<td style="width: 50px;"><i class="bi bi-key"></i></td>
		 					<td><input type="password" id="password" name="userPwd" style="border-style: none;"></td>
		 				</tr>
		 			</table>
		 		</div>
		 		
		 		<br>
		 		
				<div>
			      <button id="deleteMember" class="btn btn-primary btn-lg btn-block" type="button" onclick="pwdCheck();" style="background: #3ac240; border-color: #3ac240" >탈퇴</button>              
			    </div>
		    </div>
	 	</div>
 	</div>
 	
  <!-- 탈퇴 시 필요한 정보 -->
    <form action="deleteMember.do" method="post" id="postForm">
    	<input type="hidden" name="userId" value="${ loginUser.userId }">
    </form>    
    
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
   
    // 탈퇴 시 비밀번호 한번 더 체크
  	function pwdCheck(){
  		
  		var pwd = $("#password").val();
  		
  		if(pwd == "${ loginUser.userPwd }" ) {
  			
  			var check = confirm("정말 탈퇴하시곘습니까?");
  			
  			if(check){
  				$('#postForm').submit();
  				//location.href="'/spring/deleteMember.do'"
  			}else{
  				alert("회원탈퇴를 취소하셨습니다.")
  			}
  		}else{
  			alert("비밀번호가 일치하지 않습니다.")
  		}
  	}
  </script>
</body>

</html>