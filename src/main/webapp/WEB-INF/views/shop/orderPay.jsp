<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->



<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<!-- 아임포트 API -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Title -->
<title>온실 - 결제 </title>
</head>
<body>
	<h5>결제중...</h5>
	<!--  
	<script>

	 
    $(function(){
    	var IMP = window.IMP; // 생략가능
		IMP.init('imp62250320');	//아임포트 관리자계정
		//결제 시스템을 실행시키는 함수
	  	IMP.request_pay({
	  		pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '',
            amount : '100',
            buyer_email : '',
            buyer_name : '',
            buyer_tel : '',
            buyer_addr : '',
            buyer_postcode : '',
            //m_redirect_url : 'http://www.naver.com'
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					let purchaseVo = {
						
						}
					// 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
	                // 결제내역을 사용자에게 보여주기 위해 필요함.
	             
              			$.ajax({
						url : "orderProduct.do",
						type : "post",
						data : purchaseVo,
						dataType : "text",
						success : function(result){
							
							if(result == "success"){
								location.href = "orderResult.do"
							}else{
								alert("결제에 실패하였습니다.")
								location.href = "listProducts.do"
							}	
						},
						error : function(a,b,c){
							console.log("ajax 통신 실패")
						}
					});
				} else {
					var msg = '결제에 실패하였습니다. \n';
					msg += rsp.error_msg;
					alert(msg);
					location.href = "listProducts.do"
				}
			
			});
        
    });
    </script> -->
    
	<script>
	  
			  $( function () {
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
				  
				  name: '주문명 : ${ p.proName }',
				  //결제창에서 보여질 이름
				  amount: 10,
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
						 							 
						  } 
					  
					  	 else {
							  var msg = '결제에 실패하였습니다.';
							  msg += '에러내용 : ' + rsp.error_msg;
							  }            
					  alert(msg);
					  });    
			});
				  
		</script>
	
	
	
	
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