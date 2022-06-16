<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 매출 관리</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>

	#salesList{
	text-align: left;
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
    .searchBtn{
    Width:20%;
    }
    
   .btn-grad {
      background-image: linear-gradient(to right, #16A085 0%, #F4D03F  51%, #16A085  100%);
      margin: 10px;
      padding: 15px 45px;
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
			<h2>ADMIN :: 매출 관리</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>							
							<li class="breadcrumb-item active" aria-current="page">매출관리</li>
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
        <div class="innerOuter" style="padding:0px 10% 15% 10%;">    	
            <table id="salesList" class="table table-hover" align="center">
                <thead>
                  <tr>
                  	<th width=100>주문No</th><!-- 누르면 오더디테일로 이동하게? 구현 -->
                  	<th width=350>제품명</th>
                    <th>수량</th>
                    <th>날짜</th>
                    <th>금액</th>
                                        
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="o">
	                    <tr>
	                    	<td>${ o.orderNo }</td>
	                    	<td>${ o.proName }</td>	                        
	                        <td>${ o.amount }</td>
	                        <td>${ o.orderDate }</td>
	                        <td>${ o.orderDate }</td>
	                        <!--확정하면서 금액을 담는 DB를 만들지 단순 계산할지 생각을 잘 해야될듯... -->	                    	               	                        
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
			
            <br clear="both"><br>
            
			
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