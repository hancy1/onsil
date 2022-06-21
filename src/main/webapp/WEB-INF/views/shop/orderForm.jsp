<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<!-- 다음 주소입력 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 아임포트 API -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">

  /*radio 버튼 색상변경 */
  input[type='radio'] {
    -webkit-appearance:none;
    width:16px;
    height:16px;
    border:1px solid darkgray;
    border-radius:50%;
    outline:none;
    background:#e6e6e6;
  }
  input[type='radio']:before {
    content:'';
    display:block;
    width:60%;
    height:60%;
    margin: 20% auto;  
    border-radius:50%;  
  }
  input[type='radio']:checked:before {
  	background:#008675;
  }


</style>

<!-- Title -->
<title>온실 - 주문하기 </title>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />


	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>ORDER</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="listProducts.do">구매하기</a></li>
							<li class="breadcrumb-item active" aria-current="page">주문하기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	
	<!-- ##### Checkout Area Start ##### -->
    <div class="checkout_area mb-100">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12 col-lg-7">
                    <div class="checkout_details_area clearfix">
                        <h5>SHOP : Order 내역서</h5>
                        <form action="" method="post" id="orderForm">
                        	
                        	<input type="hidden" name="proCode" value="${p.proCode }">
                        	<input type="hidden" name="amount" value="${ amount }">
							<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
                            <input type="hidden" id="freeNo" name="freeNo" value="0">
                            <div class="row">
                                
                                 <div class="col-12">
                                    <div class="d-flex align-items-center">
                                        <!-- Single Checkbox -->
                                        <div class="custom-control custom-checkbox d-flex align-items-center mr-30">
                                            <div class="form-check">
											  <input style="width:15px; height:15px;" onclick="memberInfo();" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
											  <label class="form-check-label" for="flexRadioDefault1">
											    회원 정보와 동일
											  </label>
											</div>
											<div class="form-check">
											  <input style="width:15px; height:15px;" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
											  <label class="form-check-label" for="flexRadioDefault2">
											    새 배송지
											  </label>
											</div>
                                        </div>
                                    </div>
                                </div>
                                <br> <br>        
                                <div class="col-12 mb-4">
                                    <label for="orderName">수취인명 *</label>
                                    <input type="text" class="form-control" id="orderName" name="orderName" value="" required>
                                </div>                                
                                
                                <div class="col-12 mb-4">
                                    <label for="orderPhone">Phone Number *</label>
                                    <input type="tel" class="form-control" id="orderPhone" name="orderPhone" onkeyup="mobile_keyup(this)" maxlength='13' value="" required>
                                </div>

                                <div class="col-md-8 mb-4">
                                    <label for="address">Address *</label>
                                    <input type="text" class="form-control" id="address" name="address" value="" placeholder="주소를 검색하세요." required>                                    
                                </div>
                                
                                <div class="col-md-4 mb-4" style="padding-top: 35px; ">
                               		<label for="address"></label>
                                	<button type="button" id="addressIn" onclick="add();" class="btn btn-outline-secondary ">주소 검색</button>
                                </div>
                                
                                
                                <div class="col-md-8 mb-4">
                                    <label for="city">Address Detail *</label>
                                    <input type="text" class="form-control" id="addressDetail" name="addressDetail" value="" placeholder="상세주소를 검색하세요." required>
                                </div>
                                
                               <div class="col-md-3 mb-4">
                                    
                               </div>      
                            </div>
                        </form>
                    </div>
                </div>
			<script>
				
				$(function(){
			
					 
				}); 
				
				
				
				//멤버정보 불러오기		
				$('#flexRadioDefault1').click(function() {
					  if($('#flexRadioDefault1').is(':checked')){ 
					    //input where you put a value
					    $('#orderName').val("${ m.userName }");
					    $('#orderPhone').val("${ m.phone }");
					    $('#address').val("${ m.address }");
					    $('#addressDetail').val("${ m.addressDetail }");
					   
					    $('#orderName').attr("readonly", true);
					    $('#orderPhone').attr("readonly", true);
					    $('#address').attr("readonly", true);
					    $('#addressDetail').attr("readonly", true);
					    
					    
					  }                     
				});
				
				//새로 정보 입력하기누르면 지워짐
				$('#flexRadioDefault2').click(function() {
					  if($('#flexRadioDefault2').is(':checked')){ 
						  
						  $('#orderName').attr("readonly", false);
						  $('#orderPhone').attr("readonly", false);
						  $('#address').attr("readonly", false);
						  $('#addressDetail').attr("readonly", false);
						  				
						  $('#orderName').val("");
						  $('#orderPhone').val("");
					      $('#address').val("");
						  $('#addressDetail').val("");						  
						 
					  }					   	             
				});
				
			    // 주소 API 
			    function add(){    	
			    	new daum.Postcode({
			            oncomplete: function(data) {
			            	document.getElementById("address").value = data.address; 
			                document.getElementById("addressDetail").focus();                
			            }
			        }).open();
			    }
			    
			    
			    // 폰번호입력할 때 자동하이픈			    
				function mobile_keyup(obj){
			    	
				    var mobile_len=obj.value.length;
				    console.log(mobile_len);
				    
				    if(event.keyCode==8){
				        obj.value=obj.value.slice(0,mobile_len); 
				        return 0; 
				    }else if (mobile_len==3 || mobile_len==8){
				        obj.value += '-';
				    }
				}

			</script>
                <div class="col-12 col-lg-4">
                    <div class="checkout-content">
                        <h5 class="title--">Your Order</h5>
                        <div class="products">
                            <div class="products-data">
                                <h5>Products:</h5>
                                <div class="single-products d-flex justify-content-between align-items-center">
                                    <p>${ p.proName }</p>
                                    <p>수량: ${ amount } </p>
                                    <p><fmt:formatNumber type="number" value="${p.price}"/>원</p>
                                </div>
                            </div>
                           <div class="products-data">
                                <h5>Gift :</h5>
                                <div class="single-products d-flex justify-content-between align-items-center">
                                    <p id=freebieName></p>                                                                        
                                </div>
                            </div>
                        </div>                        
                        <div class="order-total d-flex justify-content-between align-items-center">
                            <h5>Order Total</h5>
                            <h5><c:set var="oTotal" value="${amount*p.price }"/><fmt:formatNumber type="number" value="${oTotal}"/>원</h5>
                        </div>
                        <div class="checkout-btn mt-30" id="payBtnArea">
                            <!--<a id="check_module" class="btn alazea-btn w-100">결제하기</a>  -->
							<button id="check_module" type="button" class="btn btn-success" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							결제하기
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</button>                         
                        </div>
                    </div>
                </div>
            </div>
            <h5>사은품 선택</h5>
            <!-- All 사은품 Area -->
			<div class="col-12 col-md-8 col-lg-9">
				<div class="shop-products-area">
					<div class="row">
						
						<c:forEach items="${ fList }" var="f">
						<!-- Single Product Area -->
						<div style="margin-left: 10px">
							<div class="single-product-area mb-80">
								<!-- Product Image -->
								<div class="text-left">	
									<img style="width: 100px; height: 100px; border-radius: 5px;" src="${ pageContext.servletContext.contextPath }/resources/pro_upload_files/${f.changeName}" >																			
								</div>
								<!-- Product Info -->
								<div class="product-info mt-15 text-left">									
									<p>${ f.freeName }<br>									
									<span><fmt:formatNumber type="number" value="${ f.freePoint }"/>point</span></p>
									<button class="btn btn-warning btn-sm buyPointBtn"  onclick="buyPoint(${ f.freeNo });">포인트구매</button>
									<script type="text/javascript">
									
									function buyPoint(freeNo) {
											
											//input 태그에 사은품 번호 넣기
											//(결제시 사은품 정보를 controller로 넘기기 위함)
									        $('#freeNo').val(freeNo);
																						
											//두개이상 구매 못하게 버튼 비활성화시킴
									        $('.buyPointBtn').prop("disabled", true);
											
											//포인트 사용하기 위해 ajax
									        $.ajax({
												url: "buyFreebie.do",
								                type: "POST",
								                data: {
								                	'freeNo':freeNo									        		
								                },
								                success: function (data) {
								                	alert(data.freePoint+"point가 사용되었습니다.");
								                	$('#freebieName').text(data.freeName);
								                },
											})									
										}
									
									
									</script>
								
								
								
								</div>
							</div>
						</div>						
						</c:forEach>					
					</div>
				</div>
			</div>	
        </div>
    </div>
    <!-- ##### Checkout Area End ##### -->
    
    <script>
	  
 		$("#check_module").click(function () {
 			

		 	var name = $('#orderName').val().length;
			var phone = $('#orderPhone').val().length;
			var address = $('#address').val().length;
			var addtessD = $('#addressDetail').val().length;
			
			//console.log("길이 잘 받아와지냐?" + name);
			
			if(name>0 && phone>0 && address>0 && addtessD>0){
				
				var IMP = window.IMP; // 생략가능        
				  IMP.init('imp62250320');         
				  // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용        
				  // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드        
				  IMP.request_pay({
					  pg: 'kakao', 
				  // version 1.1.0부터 지원.    
				  /*
				  'kakao':카카오페이,
				  html5_inicis':이니시스(웹표준결제)                    
				  'nice':나이스페이                    
				  'jtnet':제이티넷                    
				  'uplus':LG유플러스                    
				  'danal':다날                    
				  'payco':페이코                    
				  'syrup':시럽페이                    
				  'paypal':페이팔
				  */
				  pay_method: 'card',
				  /*                 
				  'samsung':삼성페이,                 
				  'card':신용카드,
				  'trans':실시간계좌이체,
				  'vbank':가상계좌,
				  'phone':휴대폰소액결제
				  */            
				  merchant_uid: 'merchant_' + new Date().getTime(),
				  
				  name: '${ p.proName }',
				  //결제창에서 보여질 이름
				  amount: ${oTotal},
				  //가격             
				  buyer_email: 'iamport@siot.do',
				  buyer_name: ${ sessionScope.loginUser.userNo },
				  buyer_tel: '${ o.orderPhone }',
				  buyer_addr: '${ o.address }',
				  buyer_postcode: '123-456',
				  m_redirect_url: 'https://www.yourdomain.com/payments/complete'
				  
				  /*
				  모바일 결제시,
				  결제가 끝나고 랜딩되는 URL을 지정
				  (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
				  */        
				  }, function (rsp) {
					  console.log(rsp);
					  if (rsp.success) {
						  var msg = '결제가 완료되었습니다.';
						  msg += '고유ID : ' + rsp.imp_uid;
						  msg += '상점 거래ID : ' + rsp.merchant_uid;
						  msg += '결제 금액 : ' + rsp.paid_amount;
						  msg += '카드 승인번호 : ' + rsp.apply_num;
						  
						  
						  var postForm = $("#orderForm");
						  postForm.attr("action", "orderPay.do");
						  postForm.submit();
						  
					 }  else {
						    var msg = '결제에 실패하였습니다.';
						    msg += '에러내용 : ' + rsp.error_msg;
					}            
					  alert(msg);
					  }); 
				
				
				
				}else{				
					
					alert("주문서를 모두 작성해주세요");
					//$('#check_module').prop("disabled", true);
				}	
 							  				  
			});
				  
	</script>
    
    
    
    
	  
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

</body>
</html>