<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="icon" href="resources/img/core-img/favicon.ico">
	
  </head>
  <body>

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
                      <input class="form-control" id="userId" name="userId" placeholder="Enter ID">
                      
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Password">
                    </div>

                      <div class="form-check">

                      <label class="switch">
                      <input type="checkbox">
                      <span class="slider round"></span>
                    </label>
                      <label class="form-check-label" for="exampleCheck1">Remember me</label>
                      
                      <label class="forgot-password"><a href="#">Forgot Password?<a></label>

                    </div>
                  
                    <br>
                    <button type="submit" class="btn btn-lg btn-block btn-success">Sign in</button>
                    
                  </form>
             <!-- End Loging form -->

          </div>
        </div>
        </div>
    </div>


  </body>
</html>