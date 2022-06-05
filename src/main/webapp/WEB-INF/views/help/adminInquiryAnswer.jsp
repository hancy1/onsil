<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 문의사항</title>
	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/favicon.ico">   
		
	<!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />	
    
    <!-- Core Stylesheet -->
	<link rel="stylesheet" href="resources/style.css">
	
<style>
	#boardList{text-align: center;}
    #boardList>tbody>tr:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
    
    .btn.btn-danger{background: white;
				    border-color: #3ac240;
				    color: #3ac240;}
    .btn.btn-danger:hover{background: #3ac240;
						  border-color: #3ac240;
						  color:white;}
</style>

</head>
<body>

	<!-- 댓글 -->
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
						value += "<th>" + obj.writer + "</th>" + 
								 "<td colspan=2>" + obj.answer + "</td>" + 
								 "<td colspan=2>" + obj.createDate + "</td>" +
								 "<td colspan=1> <button id='updateReply' class='btn btn-danger' onclick='updateReplyForm(" + obj.answerNo + ");'> 수정 </button> </td>" +
								 "<td colspan=1> <button id='deleteReply' class='btn btn-danger' onclick='deleteReply(" + obj.answerNo + ");'> 삭제 </button> </td>" + 									 
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