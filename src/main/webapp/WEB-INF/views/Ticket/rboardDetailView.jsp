
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Insert title here</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">





<style>
#contentArea {
	width: 80%
}

#contentArea * {
	margin: 5px
}

textarea {
	width: 100%;
	height: 80%;
	resize: none;
}

#replyArea {
	width: 80%;
	margin: auto;
}

#enrollForm>table {
	width: 80%;
	margin: auto;
}

#enrollForm>table * {
	margin: 5px;
}


 img{
     width: 35px;
     height: 35px;
     fill:"red" ;
     border: 1px solid red;
        }

  
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
			<h2>후기게시판</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">예약</a></li>
							<li class="breadcrumb-item active" aria-current="page">후기게시판</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="content">
		<br> <br>
		<div class="innerOuter" align="center">
			<br>
			<h2>후기게시판</h2>
			<a class="text-red heart" style="text-decoration-line: none;">
			 <img id="heart" src="resources/img/core-img/heart.svg">
			
			</a>			
            <br>

			<div class="content">
				<br> <br>
				<div class="innerOuter">
					<table id="contentArea" align="center" class="table">
						<tr>
							<th width="100" id="rbTitle">제목</th>
							<td colspan="10">${rb.rbTitle}[${ rb.count }]</td>
						</tr>
						<tr>
							<th>글번호</th>
							<td colspan="3">${ rb.rbNo }</td>
							<th>카테고리</th>
							<td colspan="3">${ rb.TCategoryName }</td>

						</tr>
						<tr>
							<th>작성자</th>
							<td>${ loginUser.userId }</td>

							<td><input type="hidden" id="writer" class="form-control"
								name="userId" value="${ loginUser.userId }"></td>
							<td><input type="hidden" id="writer" class="form-control"
								name="userNo" value="${ loginUser.userNo }"></td>

							<th>작성일</th>
							<td colspan="3">${ rb.date }</td>

						</tr>

						<tr>
							<th>내용</th>
							<td colspan="10"></td>
						</tr>
						<tr>
							<td colspan="10"><p style="height: auto;">${ rb.rbContent }</p></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3"><c:if test="${ !empty rb.originName }">
									<a
										href="${ pageContext.servletContext.contextPath }/resources/RB_upload_files/${rb.changeName}"
										download="${ rb.originName }" readonly>${ rb.originName }</a>
								</c:if> <c:if test="${ empty rb.originName }">
                        	첨부파일이 없습니다.
                           </c:if></td>
						</tr>
					</table>
					<br>



                    <br> 
					<c:if test="${ loginUser.userNo eq rb.userNo }">
						<div align="center">
							<button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
							<button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
						</div>

						<form id="postForm" action="" method="post">
							<input type="hidden" name="bno" value="${ rb.rbNo }"> 
							<input
								type="hidden" name="fileName" value="${ rb.changeName }">

						</form>
						<script>
					    function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormRBoard.do");
						}else{
							postForm.attr("action", "deleteRBoard.do");
						}
						postForm.submit();
					    }
				       </script>
					   </c:if>
					<br><br>
				</div>
			</div>
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

  </div>
  </div>





	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>

	<script>

  $(document).ready(function () {
		
		// 좋아요가 있는지 확인한 값을 heartval에 저장
	        var heartval = ${heart.heart}
	        console.log(heartval);
	        // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
	        if(heartval>0) {
	            console.log(heartval);
	            $("#heart").prop("src", "resources/img/core-img/heart-fill.svg");
	            $(".heart").prop('name',heartval)
	        }
	        else {
	            console.log(heartval);
	            $("#heart").prop("src","resources/img/core-img/heart.svg");
	            $(".heart").prop('name',heartval)
	        }

            
         // 좋아요 버튼을 클릭 시 실행되는 코드
            $(".heart").on("click", function () {
                var that = $(".heart");
                var bno = ${ rb.rbNo };
    	    $.ajax({
    	    	url :"insertHeart.do",
    	        type :"POST",
    	        data : {'rbNo':bno,'userNo':${sessionScope.loginUser.userNo}},
    	    	success : function(data){
    	    		that.prop('name',data);
    	        	if(data==1) {
    	        		   $("#heart").prop("src", "resources/img/core-img/heart-fill.svg");
    	        	} else {
    	        		  $("#heart").prop("src","resources/img/core-img/heart.svg");
    	        	}
                 	
    	    	}
	        	  
	   		 });
       });								

	
   });
  
 
    </script>

				




	<script>
	selectReplyList();
		
	// 댓글리스트	
	function selectReplyList(){
		
		var bno = ${ rb.rbNo };
		
		$.ajax({
			url:"rblist.do",
			data:{bno:bno},
			type:"get",
			success:function(list){
				$("#rcount").text(list.length);
				
				var value = "";
				
				$.each(list, function(rb, obj){
					if("${loginUser.userId}" == obj.userId){
						value += "<tr style='background:#EAFAF1'>";
						
						value += "<th>" + obj.userId + "</th>" + 
									 "<td colspan=2>" + obj.content + "</td>" + 
									 "<td colspan=2>" + obj.date + "</td>" +								 
									 "<td colspan=1> <button id='updateReply' class='btn btn-danger' onclick='updateReplyForm(" + obj.replyNo + ");'> 수정 </button> </td>" +
									 "<td colspan=1> <button id='deleteReply' class='btn btn-danger' onclick='deleteReply(" + obj.replyNo + ");'> 삭제 </button> </td>" + 
							 "</tr>";
					}else{
						value += "<tr>";
						value += "<th>" + obj.userId + "</th>" + 
										 "<td colspan=2>" + obj.content + "</td>" + 
										 "<td colspan=2>" + obj.date + "</td>" +								 
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
		var bno = ${ rb.rbNo };
		
		if($("#replyContent").val().trim().length != 0) {
			$.ajax({
				url:"rbinsert.do",
				type:"post",
				data:{content:$("#replyContent").val(),
					rbNo:bno,
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
	function deleteReply(replyNo) {
		var q = confirm("댓글을 삭제하시겠습니까?")
		
		if(q == true) {
			$.ajax({
				url:"deleteRBReply.do",
				data:{replyNo:replyNo},
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
	function updateReplyForm(replyNo){
		var bno = ${ rb.rbNo };
		
		$.ajax({
			url:"rblist.do",
			data:{bno:bno},
			type:"get",
			success:function(list){
				$("#rcount").text(list.length);
				
				var value="";
				$.each(list, function(rb, obj){
					if("${loginUser.userId}" == obj.userId){
						value += "<tr style='background:#EAFAF1'>";
					}else{
						value += "<tr>";
					}
					
					if(obj.replyNo == replyNo){
						value += "<th>" + obj.userId + "</th>" + 
								 "<td colspan=2><textarea id='updateReplyContent' placeholder=" + obj.content + "></textarea></td>" + 
								 "<td colspan=2>" + obj.date + "</td>" +
								 "<td colspan=1> <button id='updateReply' class='btn btn-danger' onclick='updateReply(" + obj.replyNo + ");'> 저장 </button> </td>" +
								 "<td colspan=1> <button id='deleteReply' class='btn btn-danger' onclick='selectReplyList();'> 취소 </button> </td>" + 									 
						 "</tr>";
					}
					
					if(obj.replyNo != replyNo) {						
						value += "<tr>";
						value += "<th>" + obj.userId + "</th>" + 
										 "<td colspan=2>" + obj.content + "</td>" + 
										 "<td colspan=2>" + obj.date + "</td>" +								 
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
	function updateReply(replyNo){		
		
		if($("#updateReplyContent").val().trim().length != 0){
			$.ajax({
				url:"updateRBReply.do",
				type:"post",
				data:{content:$("#updateReplyContent").val(),
					replyNo:replyNo,
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

				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<br> <br>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
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