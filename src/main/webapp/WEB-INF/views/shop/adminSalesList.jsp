<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 매출 확인</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>

	#salesList{
	text-align: left;
	width:65%;
	}
    #salesList>tbody>tr:hover{
    cursor:pointer;
    }
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{
    width:20%;
    }    
    .text{
    width:53%;
    }

    
   .btn-grad {
      background-image: linear-gradient(to right, #16A085 0%, #F4D03F  51%, #16A085  100%);
      margin: 10px;
      padding: 10px;
      text-align: center;
      text-transform: uppercase;
      transition: 0.5s;
      background-size: 200% auto;
      color: white;            
      box-shadow: 0 0 20px #eee;
      border-radius: 10px;
      display: block;
      Width:150px;
      height:30px;
    }

    .btn-grad:hover {
      background-position: right center;
      color: #fff;
      text-decoration: none;
    }
    
    #dateSearchBtn{
	 padding: 3.5px;
	 border-radius: 10px;
	 width: 27px;
	 height: 27px;
	}
    
</style>
</head>
<body>
	 

    <jsp:include page="../common/menubar.jsp"/>
    
    
    <!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>ADMIN :: 매출 확인</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>							
							<li class="breadcrumb-item active" aria-current="page">매출확인</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
    
   <!-- 월별 조회하는 버튼들.. -->
    
	<!-- 매출관리 테이블 -->
    <div class="content" align="center">
    	<h4>총 매출은 <span id="finalTotal" style="color:#6EB4B5; font-weight:bold" ></span>원 입니다. </h4>
    	
    	<form action="dateSearch.do" method="post">    	
    		<input type="text" id="startDate" name="startDate" placeholder="시작일 입력"/> ~
			<input type="text" id="endDate" name="endDate" placeholder="종료일 입력"/>
    		<button class="btn btn-info btn-sm" id="dateSearchBtn" type="submit"><i class="icon_search"></i></button>
    	</form>
    	

    	
    	
    	<script type="text/javascript">
	    	$(document).ready(function () {
	    		    $.datepicker.regional['ko'] = {
	    		        closeText: '닫기',
	    		        prevText: '이전달',
	    		        nextText: '다음달',
	    		        currentText: '오늘',
	    		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	    		        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	    		        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	    		        '7월','8월','9월','10월','11월','12월'],
	    		        dayNames: ['일','월','화','수','목','금','토'],
	    		        dayNamesShort: ['일','월','화','수','목','금','토'],
	    		        dayNamesMin: ['일','월','화','수','목','금','토'],
	    		        weekHeader: 'Wk',
	    		        dateFormat: 'yy-mm-dd',
	    		        firstDay: 0,
	    		        isRTL: false,
	    		        showMonthAfterYear: true,
	    		        yearSuffix: '',
	    		        showOn: 'focus',    				
	    				//buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //버튼 이미지 경로
	    			    //buttonImageOnly: true, //버튼 이미지만 깔끔하게 보이게함
	    		        //buttonText: "🔢",
	    		        changeMonth: true,
	    		        changeYear: true,
	    		        showButtonPanel: true,
	    		        yearRange: 'c-99:c+99',
	    		    };
	    		    $.datepicker.setDefaults($.datepicker.regional['ko']);
	    		 
	    		    $('#startDate').datepicker();
	    		    $('#startDate').datepicker("option", "maxDate", $("#endDate").val());
	    		    $('#startDate').datepicker("option", "onClose", function ( selectedDate ) {
	    		        $("#endDate").datepicker( "option", "minDate", selectedDate );
	    		    });
	    		 
	    		    $('#endDate').datepicker();
	    		    $('#endDate').datepicker("option", "minDate", $("#startDate").val());
	    		    $('#endDate').datepicker("option", "onClose", function ( selectedDate ) {
	    		        $("#endDate").datepicker( "option", "maxDate", selectedDate );
	    		    });
	    		});
    		
		</script>
    	
    	
    	<br>
        <div class="innerOuter" style="padding:0px 10% 15% 10%;">    	
            <table id="salesList" class="table table-hover" align="center">
                <thead>
                  <tr>
                  	<th width=100>주문No</th><!-- 누르면 오더디테일로 이동하게? 구현 -->
                  	<th>제품명</th>
                  	<th>수령인</th>
                    <th>수량</th>
                    <th>주문날짜</th>
                    <th>결제금액</th>
                                        
                  </tr>
                </thead>
                <c:forEach items="${ list }" var="o">
                <tbody>
                	
	                    <tr>
	                    	<td>${ o.orderNo }</td>
	                    	<td>${ o.proName }</td>
	                    	<td>${ o.orderName }</td>	                        
	                        <td>${ o.amount }</td>
	                        <td>${ o.orderDate }</td>
	                        <td id="totalVal">
	                        <c:set var="total" value="${o.amount*o.price }"/>${total}
	                        
	                        </td>

	                        <!--확정하면서 금액을 담는 DB를 만들지 단순 계산할지 생각을 잘 해야될듯... -->	                    	               	                        
	                    </tr>
                    
                </tbody>                
                </c:forEach>
            </table>
            <br>
			
            <br clear="both"><br>
            
  		    <script type="text/javascript">		
				
				$(document).ready(function() {	
					
					const table = document.getElementById('salesList');
					  
					 
					  // 합계 계산
					  let finalSum = 0;
					  for(let i = 1; i < table.rows.length; i++)  {
						 const totalOne = parseInt(table.rows[i].cells[5].innerHTML);
						 finalSum += totalOne;
					    
					    console.log("totalOne 가져와진거야?"+totalOne);
					  }
					  
					  //정규식통해서 ,(쉼표)찍고 가독성 높힘
					  const finalSumComma = finalSum.toString()
					  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					  
					  
					  // 합계 출력
					  document.getElementById('finalTotal').innerText = finalSumComma;
						
							
			    });
			
			</script>

            <br><br>
        </div>
        <br><br>
    </div>
    



    <jsp:include page="../common/footer.jsp"/>
    
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