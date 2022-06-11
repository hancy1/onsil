<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Loding font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">

    <!-- Custom Styles -->
    <link rel="stylesheet" type="text/css" href="resources/css/login_styles.css">

    <title>온실 | 로그인</title>
    
    <!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/icon.png">
	
	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	
  </head>
  <body>
  	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>

    <!-- Backgrounds -->

    <div id="login-bg" class="container-fluid">

      <div class="bg-img"></div>
      <div class="bg-color"></div>
    </div>

    <!-- End Backgrounds -->
    <div class="container" id="login">
    	
        <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="login">
          	<!-- 뒤로가기 -->
			<button type="button" onclick="history.back()" class="btn btn-lg btn-block btn-success" style="width: 100px; height: 30px; font-size: 15px; padding-top: 5px"> 뒤로가기</button>
            <h1>Login</h1>
            
            <!-- Loging form -->
                  <form action="login.do" method="post">
                    <div class="form-group">
                      <input class="form-control" id="id" name="userId" placeholder="Enter ID" required>
                      
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Password" required>
                    </div>

                      <div class="form-check">

					  <!-- 아이디 저장 -->
                      <label class="switch">
                      <input type="checkbox" id="checkId">
                      <span class="slider round"></span>
                      </label>
                      <label class="form-check-label" for="exampleCheck1">Remember me</label>
                      
                      <label class="forgot-password"><a href="#">Forgot Password?<a></label>

                    </div>
                  
                    <br>
                    <button type="submit" class="btn btn-lg btn-block btn-success" id="loginbtn">Sign in</button>
                    
                  </form>
             <!-- End Loging form -->

          </div>
        </div>
        </div>
    </div>


	<script type="text/javascript">
		$("#id").focus();
	
		$(document).ready(function() {
		    var userInputId = getCookie("userInputId"); // 쿠키에 저장된 아이디
		    var setCookieYN = getCookie("setCookieYN"); // 쿠키에 저장된 것이 있는지 없는지
		    
		    if(setCookieYN == 'Y') { // 쿠키에 저장된게 있다면
		        $("#checkId").prop("checked", true); // input 체크박스 체크
		    } else {
		        $("#checkId").prop("checked", false);
		    }
		    
		    $("#id").val(userInputId); // 아이디 넣는 input 에 쿠키에 저장된 id 넣기
		    
		    
		    
		    //로그인 버튼 클릭
		    $('#loginbtn').click(function() {
		        if($("#checkId").is(":checked")){ // 아이디저장에 체크가 되어있다면
		            var userInputId = $("#id").val();
		            setCookie("userInputId", userInputId, 60); // userInputId 이름으로 id.val 60일 동안 저장 
		            setCookie("setCookieYN", "Y", 60); // setCookieYN 이름으로 Y(쿠키있음) 저장
		        } else {
		            deleteCookie("userInputId"); // 체크가 해제되어 있다면 쿠키에서 삭제
		            deleteCookie("setCookieYN");
		        }
		        
		        document.fform.submit();
		    });
		});
		
		//쿠키값 Set
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays); // 쿠키등록날짜 + 60일
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + 
		    exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		
		//쿠키값 Delete
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		
		//쿠키값 가져오기
		function getCookie(cookie_name) {
		    var x, y;
		    var val = document.cookie.split(';');
		    
		    for (var i = 0; i < val.length; i++) {
		        x = val[i].substr(0, val[i].indexOf('='));
		        y = val[i].substr(val[i].indexOf('=') + 1);
		        x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
		        
		        if (x == cookie_name) {
		          return unescape(y); // unescape로 디코딩 후 값 리턴
		        }
		    }
		}
	</script>

  </body>
</html>