<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Insert title here</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png"> 

<style>
 	#enrollForm>table{
 	width:80%;
 	 margin:auto;
 	 }
    #enrollForm>table *{ margin:5px;}
      .bi-heart{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
        }

        .bi-heart-fill{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
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
        <br><br>
         <div class="innerOuter" align="center"><br>
            <h2>후기게시판</h2>
             
	<i id="heart" class="bi bi-heart"></i>
    
	
            <br>
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="inserRBoard.do" enctype="multipart/form-data">
                <table align="center">
                   
                    <tr>
                        <th><label for="rbTitle">제목</label></th>
                        <td><input type="text" id="rbTitle" class="form-control" name="rbTitle" value="${rb.rbTitle}" required></td>
                    </tr>
                  
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control"  name="userId" value="${ loginUser.userId }" required></td>
                        <td><input type="hidden" id="writer" class="form-control"  name="userNo" value="${ loginUser.userNo }" required></td>
                        
                    </tr>
                    <div class="col-12 col-md-6">
                           <div class="form-group">
                           <select name="category" class="form-control" id="category">
                               <option name="">카테고리 선택</option>
                               <option value="Fair">전시회후기</option>
                               <option value="prohibit">박람회후기</option>
                              
                               </select>
                                 </div>
                            </div>
                         
 
                    <tr>
                         <th>첨부파일</th>
                    <td colspan="3">
                    	<c:if test="${ !empty rb.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/RB_upload_files/${r.changeName}" download="${ rb.originName }">${ rb.originName }</a>
                        </c:if>
                        <c:if test="${ empty rb.originName }">
                        	첨부파일이 없습니다.
                        </c:if>
                    </td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="rbContent" id="content" rows="10" style="resize:none;">${ rb.rbContent }</textarea></th>
                    </tr>
                </table>
                <br>

              <c:if test="${ loginUser.userId eq r.userNo }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ rb.rbNo }">
					<input type="hidden" name="fileName" value="${ rb.changeName }"> 
					
				</form>
				
			 <script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
								
  <script>

  $(document).ready(function () {
		
		// 좋아요가 있는지 확인한 값을 heartval에 저장
	        var heartval = ${heart.heart}
	        // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
	        if(heartval>0) {
	            console.log(heartval);
	            $("#heart").prop("class", 'bi-heart-fill');
	            $(".heart").prop('name',heartval)
	        }
	        else {
	            console.log(heartval);
	            $("#heart").prop("class", 'bi-heart');
	            $(".heart").prop('name',heartval)
	        }

            
         // 좋아요 버튼을 클릭 시 실행되는 코드
            $(".heart").on("click", function () {
                var that = $(".heart");
    	    $.ajax({
    	    	url :'detailRBoard.do',
    	        type :'POST',
    	        data : {'rbNo':${bno},'userNo':${loginUser.userNo}},
    	    	success : function(data){
    	    		that.prop('name',data);
    	        	if(data==1) {
    	        		   $("#heart").prop("class", 'bi-heart-fill');
    	        	} else {
    	        		  $("#heart").prop("class", 'bi-heart');
    	        	}
                 	
    	    });
    	    }
    </script>
				
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
               
           <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                    	<c:if test="${ !empty loginUser }">
	                        <th colspan="2" style="width:75%">
	                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%"></textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply">등록하기</button></th>
                        </c:if>
                        <c:if test="${ empty loginUser }">
                        	<th colspan="2" style="width:75%">
	                            <textarea class="form-control" readonly rows="2" style="resize:none; width:100%">로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                        </c:if>
                    </tr>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                    </tr>
                    
          <script>
 	$(function(){
		selectReplyList();
		
		$("#addReply").click(function(){
    		var bno = ${b.boardNo};

			if($("#replyContent").val().trim().length != 0){
				
				$.ajax({
					url:"rinsertBoard.do",
					type:"post",
					data:{replyContent:$("#replyContent").val(),
						  refBoardNo:bno,
						  replyWriter:"${loginUser.userId}"},
					success:function(result){
						if(result > 0){
							$("#replyContent").val("");
							selectReplyList();
function selectReplyList(){
		var bno = ${b.boardNo};
		$.ajax({
			url:"rlistBoard.do",
			data:{bno:bno},
			type:"get",
			success:function(list){
				$("#rcount").text(list.length);
				
				var value="";
				$.each(list, function(i, obj){
					
					if("${loginUser.userId}" == obj.replyWriter){
						value += "<tr style='background:#EAFAF1'>";
					}else{
						value += "<tr>";
					}
					
					value += "<th>" + obj.replyWriter + "</th>" + 
								 "<td>" + obj.replyContent + "</td>" + 
								 "<td>" + obj.createDate + "</td>" +
						 "</tr>";
				});
				$("#replyArea tbody").html(value);
			},error:function(){
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
	}
     
     
     
    </script>
                    
                </thead>
                <tbody>
                
                </tbody>
            </table>
        </div>
        <br><br>
    </div>

  <jsp:include page="../common/footer.jsp"/>
    
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