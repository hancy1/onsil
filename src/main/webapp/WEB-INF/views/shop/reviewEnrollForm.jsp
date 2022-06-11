<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

 

<title>온실 - Review 작성</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<style>

 	#enrollForm>table{
 	width:100%;
 	}
    #enrollForm>table *{
     margin:10px;
     }
     
	/* component */

	.star-rating {
	  /*border:solid 1px #ccc;*/
	  display:flex;
	  flex-direction: row-reverse;
	  font-size:1.5em;
	  justify-content:space-around;
	  padding:0 .2em;
	  text-align:center;
	  width:5em;
	 
	}
	
	.star-rating input {
	  display:none;
	}
	
	.star-rating label {
	  color:#ccc;
	  cursor:pointer;
	}
	
	.star-rating :checked ~ label {
	  color:#f90;
	}
	
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  color:#fc0;
	}
	
	/* explanation */
	
	article {
	  background-color:#ffe;
	  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
	  color:#006;
	  font-family:cursive;
	  font-style:italic;
	  margin:4em;
	  max-width:30em;
	  padding:2em;
	}
     

     
</style>

	<jsp:include page="../common/menubar.jsp"/>
        
    <!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/admin1.jpg);">
			<h2>Review 작성</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="myReviewList.do">내가 쓴 리뷰</a></li>
							<li class="breadcrumb-item active" aria-current="page">리뷰 작성</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
    
   <div class="container">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-6 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
			    <div class="content">
		        <br><br>
		       		           
		            <form id="enrollForm" method="post" action="insertReview.do" enctype="multipart/form-data">
		            	
		            	<input type="hidden" name="orderNo" value="${ orderNo }">
					    <input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
					    
		                <table align="center">


							<!-- 오더NO, 유저NO.. 히든으로 보내기 -->
							
							
		                    <tr>		                    
		                        <th><label for="reviewTitle">제목</label></th>
		                       	<td colspan="3"><input type="text" id="reviewTitle" class="form-control" name="reviewTitle" required></td>
		                    </tr>
		                    
		                    
		                    <tr>
		                        <th><label for="reviewStar">별점</label></th>	
		                        <td> &nbsp;&nbsp; &nbsp;&nbsp;</td>	                             
		                       	<td colspan="2" id="radiotest">
		                       	
		                       	<div class="star-rating">
								  <input type="radio" id="1-stars" name="reviewStar" value="5"/>
								  <label for="1-stars" class="star">&#9733;</label>
								  <input type="radio" id="2-stars" name="reviewStar" value="4" />
								  <label for="2-stars" class="star">&#9733;</label>
								  <input type="radio" id="3-stars" name="reviewStar" value="3" />
								  <label for="3-stars" class="star">&#9733;</label>
								  <input type="radio" id="4-stars" name="reviewStar" value="2" />
								  <label for="4-stars" class="star">&#9733;</label>
								  <input type="radio" id="5-star" name="reviewStar" value="1" />
								  <label for="5-star" class="star">&#9733;</label>
								</div>
		                       	
		                       	
		                       	</td>
		                    </tr>
		                    
		                    
		                    <tr>
		                        <th><label for="reviewContent">내용</label></th>		                              
		                       	<td colspan="3" ><textarea  rows="10" id="reviewContent" class="form-control" name="reviewContent" required></textarea></td>
		                    </tr>
		                    
		                    
		                    <tr>
		                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		                       	<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		                    </tr>
		                    
		                    
		                    
		                    <tr>
		                        <th><label for="upfile">리뷰이미지</label></th>
		                        
		                        <td colspan="3">
		                        	<input type="file" id="upfile" class="form-control-file border" name="uploadFile">		                          
		                        </td>
		                    </tr>
		 
		                </table>

		                
		                
		                <br>
		
		                <div align="center">
		                    <button onclick="insertSubmit();" class="btn btn-outline-success">작성하기</button>
		                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:history.go(-1);">이전으로</button>
		                </div>
		            </form>
		        </div>
		        <br><br>
		    </div>
			   
			</div>
		</div>
		
		<script>
			function insertSubmit(){
				
				var enrollForm = $("#enrollForm");				
				enrollForm.submit();

				alert("100point 적립 완료!💐");
			}
		</script>

    
    
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




</head>
<body>

</body>
</html>