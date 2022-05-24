<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
   <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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

  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate>
          <div class="row">
          	<div class="col-md-6 mb-3">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="id" placeholder="" value="" required>
              <div class="invalid-feedback">
                	아이디를 입력해주세요.
              </div>              
            </div>
             <div class="col-md-6 mb-3" style="padding-top: 30px;">
              <button style="height: 35px; width: 80px; border-radius: 5px; background: #3ac240; border-color: #3ac240; color: white">중복확인</button>
            </div>
            <div class="col-md-6 mb-3">
              <label for="password">비밀번호</label>
              <input type="text" class="form-control" id="password" placeholder="" value="" required>
              <div class="invalid-feedback">
                	비밀번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="passwordFeedback">비밀번호 확인</label>
              <input type="text" class="form-control" id="passwordFeedback" placeholder="" value="" required>
              <div class="invalid-feedback">
                	비밀번호 확인을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                	이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="gender">성별</label>
              <input type="text" class="form-control" id="gender" placeholder="" value="" required>
              <div class="invalid-feedback">
                	성별을 선택해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
             	 주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted" ></span></label>
            <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요." required>
          </div>

		   <div class="row">
		   	<div class="col-md-6 mb-3">
              <label for="password">일반전화</label>
              <input type="text" class="form-control" id="tel" placeholder="" value="">              
            </div>
            <div class="col-md-6 mb-3">
              <label for="passwordFeedback">휴대전화</label>
              <input type="text" class="form-control" id="phone" placeholder="" value="" required>
              <div class="invalid-feedback">
                	휴대전화를 입력해주세요.
              </div>
            </div>
            </div>

		  <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              	이메일을 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="preference">선호도</label>
            <input type="radio" class="form-control" name="preference" required>나무
            <input type="radio" class="form-control" name="preference" required>꽃
            <input type="radio" class="form-control" name="preference" required>식용재배
            <div class="invalid-feedback">
              	선택해주세요.
            </div>
          </div>
          
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit" style="background: #3ac240; border-color: #3ac240" >가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 YD</p>
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
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>

</html>