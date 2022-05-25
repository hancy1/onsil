<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 | 회원가입</title>

	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/favicon.ico">
	
   <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<!-- 다음 지도api -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
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
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>온실 :: 회원정보수정</h2>
		</div>

		<!--  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">관리자페이지</a></li>
							<li class="breadcrumb-item active" aria-current="page">판매제품관리</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	-->
	<!-- ##### Breadcrumb Area End ##### -->
	
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto" style="margin-top: 100px;">
        <h4 class="mb-3" style="text-align: center;">회원정보수정</h4>
        
        <form id="modifyForm" action="updateMember.do" method="post" class="validation-form" novalidate>
          <div class="row">
          	<div class="col-md-6 mb-3">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="id" name="userId" placeholder="" value="${ loginUser.userId }" readonly>
              <div class="invalid-feedback" id="idRegex">
                	아이디를 입력해주세요.
              </div>              
            </div>
             <div class="col-md-6 mb-3" style="padding-top: 30px;">
              
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" id="pwd" name="userPwd" placeholder="" value="" required>
              <div id="pwdValid"></div>
              <div class="invalid-feedback">
                	비밀번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="passwordFeedback">비밀번호 확인</label>
              <input type="password" class="form-control" id="pwdCheck" placeholder="" value="" required>
              <div id="pwdFeedback"></div>
              <div class="invalid-feedback">
                	비밀번호 확인을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="userName" placeholder="" value="${ loginUser.userName }" required>
              <div id="nameValid"></div>
              <div class="invalid-feedback">
                	이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
            <div style="float: left;">
              <label for="gender">성별</label>              
              <select class="form-control" id="gender" name="gender"  required>
              	<option> </option>
              	<option name="gender" id="Female" value="F"> 여성 </option>
              	<option name="gender" id="Male" value="M"> 남성 </option>
              	<option name="gender" id="Nothing" value="T"> 미공개 </option>
              </select>
              <div class="invalid-feedback">
                	성별을 선택해주세요.
              </div>
              </div>
              <div class="col-md-6 mb-3" style="float: left; margin-left: 20px">
              <label for="birth">생년월일</label>              
              <input class="form-control" type="date" id="birth" name="birth" value="${ loginUser.birth }" required>
              <div class="invalid-feedback">
                	생년월일을 입력해주세요.
              </div>
              </div>
            </div>                     

          <div class="col-md-10 mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" name="address" placeholder="주소검색을 해주세요." style="width: 100%" value="${ loginUser.address }" required>            
            <div class="invalid-feedback">
             	 주소를 입력해주세요.
            </div>
          </div>
          <div class="col-md-2 mb-3" style="padding-top: 30px; ">
          	<button type="button" id="searchAdd" onclick="add();" style="height: 35px; width: 80px; border-radius: 5px; background: #3ac240; border-color: #3ac240; color: white">주소검색</button>
          </div>
		 </div>



          <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted" ></span></label>
            <input type="text" class="form-control" id="address2" name="addressDetail" placeholder="상세주소를 입력해주세요." value="${ loginUser.addressDetail }" required>
            <div class="invalid-feedback">
             	 상세주소를 입력해주세요.
            </div>
          </div>



		   <div class="row">
		   	<div class="col-md-6 mb-3">
              <label for="password">일반전화</label>
              <input type="text" class="form-control" id="tel" name="tel" placeholder="" value="${ loginUser.tel }">              
            </div>
            <div class="col-md-6 mb-3">
              <label for="passwordFeedback">휴대전화</label>
              <input type="text" class="form-control" id="phone" name="phone" placeholder="" value="${ loginUser.phone }" required>
              <div class="invalid-feedback">
                	휴대전화를 입력해주세요.
              </div>
            </div>
            </div>



		  <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" value="${ loginUser.email }" required>
            <div id="emailValid"></div>
            <div class="invalid-feedback">
              	이메일을 입력해주세요.
            </div>
          </div>
          
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
          
          <div class="row">
		   	<div class="col-md-6 mb-3">
              <button id="modifyBtn" class="btn btn-primary btn-lg btn-block" type="submit" style="background: #3ac240; border-color: #3ac240" >수정</button>             
            </div>
            <div class="col-md-6 mb-3">
              <button id="deleteMember" class="btn btn-primary btn-lg btn-block" type="button" onclick="$('#postForm').submit();" style="background: #3ac240; border-color: #3ac240" >탈퇴</button>              
            </div>
          </div>               
          
        </form>
      </div>
    </div>
    
    <!-- 탈퇴 시 필요한 정보 -->
    <form action="deleteMember.do" method="post" id="postForm">
    	<input type="hidden" name="userId" value="${ loginUser.userId }">
    </form>
    
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
    
    
    // 아이디 유효성 검사 & 중복확인 
   function idCheck(){
    	var id = $("#id").val();
    	if(id == ""){
    		alert("아이디를 입력해주세요");
    		return;
    	}
    	
    	var idReg = /^[a-z]+[a-z0-9]{4,11}$/g;
        if( !idReg.test( $("#id").val())) {
            alert("아이디는 영문자로 시작하는 5~12자 영문자 또는 숫자이어야 합니다.");
            return;
        }else{
        	
        	$.ajax({
        		url:"idCheck.do",
        		type:"post",
        		data:{id:id},
        		success:function(result){
        			if(result > 0) {
        				alert("사용할 수 없는 아이디입니다.");
        				$("id").focus();
        			}else{
        				if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
        					$("#enrollBtn").removeAttr("disabled");        					
        				}else{
        					$("#id").focus();
        				}
        			}
        		},
        		error:function(){
        			console.log("아이디 중복체크용 ajax 통신 실패")
        		}
        	});
        }
    	
    }
    
    // 비밀번호 정규식 
    $("#pwd").on("keyup", function(){
    	var pwdReg = /^[A-Za-z\d]{5,13}$/;
	    if( !pwdReg.test($("#pwd").val())){
	    	$("#pwdValid").css("color", "red").text("비밀번호는 영어대소문자, 숫자  5 - 12 자리여야 합니다.");
	    	return false;
	    }else{
	    	$("#pwdValid").text("");	
	    	return true;
	    }
    })
    
    // 비밀번호 일치 확인    
    $("#pwdCheck").on("keyup", function(){
    	if($("#pwd").val() == $("#pwdCheck").val()) {  
    		$("#pwdFeedback").text("");
    		return true;
    	}else{
    		$("#pwdFeedback").css("color", "red").text("비밀번호가 일치하지 않습니다");
    		return false;
    	}
    })
    
    // 이름 유효성 검사
    $("#name").on("input",function(){
                    var regex = /[가-힣]{2,}/;
                    var result = regex.exec($("#name").val());
                    
                    if(result != null){
                       $("#nameValid").html("");  
                    }else{
                        $("#nameValid").css("color", "red").text("한글로 2글자 이상 입력해주세요.");
                    }                    
                })
                
    // 주소 API 
    function add(){    	
    	new daum.Postcode({
            oncomplete: function(data) {
            	document.getElementById("address").value = data.address; 
                document.getElementById("address2").focus();                
            }
        }).open();
    }
    
    // 전화번호 입력 자동 하이픈 & 유효성 검사
    $("#tel, #phone").on("keyup", function() { 

		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
		
	});
    
    // 이메일 유효성 검사
    $("#email").on("input",function(){
                     var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
                     var result = regex.exec($("#email").val());
                    
                    if(result != null){
                       $("#emailValid").html("");  
                    }else{
                        $("#emailValid").css("color", "red").html("올바른 이메일이 아닙니다.");
                    }
                })
                
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
    
    // 칸 누르면 주소검색이 뜨도록
    $(function(){
    	$("#address").click(function(){
    		$("#searchAdd").click();
    	});
    });
    
  </script>
</body>

</html>