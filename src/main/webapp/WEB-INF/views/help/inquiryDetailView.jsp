<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온실 - 문의사항 </title>
	
	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/icon.png">   
		
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
	    
	    #contentArea{width:100%}
		#contentArea *{margin:5px}
		textarea {width:100%;
				  height:80%;		
				  resize:none;		  
		}
		
		.btn.btn-primary{background: #3ac240;
						 border-color: #3ac240;} 
		.btn.btn-primary:hover{background: white;
					  		   border-color: #3ac240;
					  	       color: #3ac240;} 
					  	       
		.btn.btn-danger{background: white;
					    border-color: #3ac240;
					    color: #3ac240;}
	    .btn.btn-danger:hover{background: #3ac240;
							  border-color: #3ac240;}
		
				
	</style>
</head>

<body>

<jsp:include page="../common/menubar.jsp" />
	
	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/데이지.jpg);">
			<h2>문의사항</h2>
		</div>		
		  
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/spring"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">고객센터</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="/spring/inquiryList.do">문의사항</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ##### Breadcrumb Area End ##### -->
	
	
	<!-- 게시판 본문 -->
	<div class="container">
	 	<div class="input-form-backgroud row">
	 		<div class="input-form col-md-12 mx-auto" style="margin-top: 0px; margin-left: 0px; margin-bottom: 100px;">
		 		<h4>문의사항</h4>
		 		<br><br>	 		
		 		
		 		
		 		<div>	
		 		
		 		<!-- 상세보기 본문 -->
		 			<div class="content">
				        <br><br>
				        <div class="innerOuter">				            
				            <table id="contentArea" align="center" class="table">
				                <tr>
				                	<th width="100" id="titletitle">제목</th>
				                    <td colspan="10">${ i.title } [ ${ i.replyCount } ]</td>
				                </tr>
				                <tr>
				                	<th>글번호</th>
				                	<td colspan="3">${ i.inquiryNo }</td>
				                	<th>카테고리</th>
				                	<td colspan="3">${ i.category }</td>				                    
				                	<th>조회수</th>
				                	<td>${ i.count }</td>				                    
				                </tr>				                
				                <tr>
				                    <th>작성자</th>
				                    <td colspan="3"><a href="gardenMain.do?hostUser=${i.writer}">${ i.writer }</a></td>
				                    <th>작성일</th>
				                    <td colspan="3">${ i.createDate }</td>
				                    <th>글 공개여부</th>
				                	<td>${ i.open }</td>   
				                </tr>				                
				                <tr>
				                    <th>내용</th>		
				                    <td colspan="10"></td>		                    
				                </tr>
				                <tr>
				                    <td colspan="10"><p style="height:auto;">${ i.content }</p></td>
				                </tr>				                
				            </table>
				            <br>
					
							<c:if test="${ loginUser.userId eq i.userId }">
					            <div align="center">
					                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
					                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
					            </div>
					            
					            <form id="postForm" action="" method="post">
									<input type="hidden" name="ino" value="${ i.inquiryNo }">									
								</form>
								
								<script>							
									function postFormSubmit(num){
										var postForm = $("#postForm");
										
										if(num == 1){
											postForm.attr("action", "updateFormInquiry.do");
										}else{
											if(confirm("글을 삭제하시겠습니까?")){
												postForm.attr("action", "deleteInquiry.do");
											}else{
												alert("글 삭제를 취소하셨습니다.");
												return;
											}											
										}
										postForm.submit();
									}
								</script>
				            </c:if>
				            <br><br>				            
				        </div>
				        <br><br>
				    </div>
			 	<!-- 상세보기 본문 끝 -->
            
            	<!-- 댓글 -->
            		<br><br>

		            <table id="replyArea" class="table" align="center">
		                <thead>
		                    <tr>
		                    	<c:if test="${ !empty loginUser }">
			                        <th colspan="5" style="width:80%">
			                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%"></textarea>
			                        </th>
			                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply">등록하기</button></th>
		                        </c:if>
		                        <c:if test="${ empty loginUser }">
		                        	<th colspan="5" style="width:80%">
			                            <textarea class="form-control" readonly rows="2" style="resize:none; width:100%">로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
			                        </th>
			                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
		                        </c:if>
		                    </tr>
		                    <tr>
		                       <td colspan="6">댓글 (<span id="rcount">0</span>) </td> 
		                    </tr>
		                </thead>
		                <tbody>
		                	
		                </tbody>
		            </table>		 		
		 		<!-- 댓글 끝 -->
		 		
 				</div>
 				
			</div>
		</div>
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
	selectReplyList();
		
	// 댓글리스트	
	function selectReplyList(){
		
		var ino = ${ i.inquiryNo };
		
		$.ajax({
			url:"rlistAnswer.do",
			data:{ino:ino},
			type:"get",
			success:function(list){
				$("#rcount").text(list.length);
				
				var value = "";
				
				$.each(list, function(i, obj){
					if("${loginUser.userId}" == obj.userId){
						value += "<tr style='background:#EAFAF1'>";
						
						value += "<th>" + obj.writer + "</th>" + 
									 "<td colspan=2>" + obj.answer + "</td>" + 
									 "<td colspan=2>" + obj.createDate + "</td>" +								 
									 "<td colspan=1> <button id='updateReply' class='btn btn-danger' onclick='updateReplyForm(" + obj.answerNo + ");'> 수정 </button> </td>" +
									 "<td colspan=1> <button id='deleteReply' class='btn btn-danger' onclick='deleteReply(" + obj.answerNo + ");'> 삭제 </button> </td>" + 
							 "</tr>";
					}else{
						value += "<tr>";
						value += "<th>" + obj.writer + "</th>" + 
										 "<td colspan=2>" + obj.answer + "</td>" + 
										 "<td colspan=2>" + obj.createDate + "</td>" +								 
										 "<td colspan=1></td>" +
										 "<td colspan=1></td>" + 
								 "</tr>";
					}
					
					
				});
				$("#replyArea tbody").html(value);
			},error:function(){
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
	}
	
	// 댓글 작성
	$("#addReply").click(function(){
		var ino = ${ i.inquiryNo };
		
		if($("#replyContent").val().trim().length != 0) {
			$.ajax({
				url:"rinsertInquiry.do",
				type:"post",
				data:{answer:$("#replyContent").val(),
					reperNo:ino,
					userNo:"${loginUser.userNo}"},
				success:function(result){
					if(result > 0) {
						$("#replyContent").val("");
						selectReplyList();
					}else{
						alert("댓글등록실패");
					}
				},error:function(){
					console.log("댓글 작성 ajax 통신 실패");
				}
			});
		}else{
			alert("댓글을 등록하세요.");
		}
	});
	
	// 댓글 삭제
	function deleteReply(answerNo) {
		var q = confirm("댓글을 삭제하시겠습니까?")
		
		if(q == true) {
			$.ajax({
				url:"deleteReply.do",
				data:{answerNo:answerNo},
				type:"get",
				success:function(result){
					if(result > 0) {
						$("#replyContent").val("");
						selectReplyList();
					}else{
						alert("댓글삭제실패");
					}
				}, error:function(){
					console.log("댓글 삭제 ajax 통신 실패");
				}
			})
		}else{
			alert("댓글 삭제를 취소하셨습니다.");
		}
	}
	
	// 댓글 수정 폼
	function updateReplyForm(answerNo){
		var ino = ${ i.inquiryNo };
		
		$.ajax({
			url:"rlistAnswer.do",
			data:{ino:ino},
			type:"get",
			success:function(list){
				$("#rcount").text(list.length);
				
				var value="";
				$.each(list, function(i, obj){
					if("${loginUser.userId}" == obj.userId){
						value += "<tr style='background:#EAFAF1'>";
					}else{
						value += "<tr>";
					}
					
					if(obj.answerNo == answerNo){
						value += "<th>" + obj.writer + "</th>" + 
								 "<td colspan=2><textarea id='updateReplyContent' placeholder=" + obj.answer + "></textarea></td>" + 
								 "<td colspan=2>" + obj.createDate + "</td>" +
								 "<td colspan=1> <button id='updateReply' class='btn btn-danger' onclick='updateReply(" + obj.answerNo + ");'> 저장 </button> </td>" +
								 "<td colspan=1> <button id='deleteReply' class='btn btn-danger' onclick='selectReplyList();'> 취소 </button> </td>" + 									 
						 "</tr>";
					}
					
					if(obj.answerNo != answerNo) {						
						value += "<tr>";
						value += "<th>" + obj.writer + "</th>" + 
										 "<td colspan=2>" + obj.answer + "</td>" + 
										 "<td colspan=2>" + obj.createDate + "</td>" +								 
										 "<td colspan=1></td>" +
										 "<td colspan=1></td>" + 
								 "</tr>";
					}
					
				});
				$("#replyArea tbody").html(value);
			},error:function(){
				console.log("댓글 수정폼용 ajax 통신 실패");
			}
		});
	}
	
	// 댓글 수정
	function updateReply(answerNo){		
		
		if($("#updateReplyContent").val().trim().length != 0){
			$.ajax({
				url:"updateReply.do",
				type:"post",
				data:{answer:$("#updateReplyContent").val(),
					answerNo:answerNo,
					userNo:"${loginUser.userNo}"},
				success:function(result) {
					if(result > 0) {
    					$("#updateReplyContent").val("");
    					selectReplyList();
    				}else{
    					alert("댓글수정실패");
    				}
				}, error:function(){
    				console.log("댓글 수정 ajax 통신 실패");
				}
			});
		}else{
			alert("수정할 댓글을 입력하세요.");
		}
	}
    </script>

</body>
</html>