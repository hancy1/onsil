<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN :: 문의사항</title>
	<!-- Favicon -->
	<link rel="icon" href="resources/img/core-img/icon.png">
		
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
						  border-color: #3ac240;}
</style>

</head>
<body>


<div class="content">
        <br><br>
        <div class="innerOuter" style="padding:0% 10%;">
            <h2>문의사항 관리</h2>
            <br>            
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th>글번호</th>
                    <td>${ i.inquiryNo }</td>
                    <th>카테고리</th>
                    <td>${ i.category }</td>                    
                </tr>
                <tr>    
               	 	<th>댓글 수</th>
                    <td>${ i.replyCount }</td>                
                    <th>게시날짜</th>
                    <td>${ i.createDate }</td>                    
                </tr>
                <tr>                    
                    <th>조회수</th>
                    <td>${ i.createDate }</td>
                    <th>작성자</th>
                    <td>${ i.writer }</td>
                </tr>
                <tr>                    
                    <th>상태</th>
                    <td>${ i.status }</td>
                    <th>답변상태</th>
                    <td>${ i.answer_status }</td>
                </tr>
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ i.title }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${ i.content }</p></td>
                </tr>
            </table>
            <br>
            <!-- 댓글 -->
           	<table id="replyArea" class="table" align="center">
	                <thead>	                   
	                    <tr>
	                       <td colspan="6">댓글 (<span id="rcount">0</span>) </td> 
	                    </tr>
	                </thead>
	                <tbody>
	                	
	                </tbody>
	            </table>		 	
            <!-- 댓글 끝 -->
            <br><br>
            
        </div>
        <br><br>
    </div>
        
    
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
							 "</tr>";
					}else{
						value += "<tr>";
						value += "<th>" + obj.writer + "</th>" + 
										 "<td colspan=2>" + obj.answer + "</td>" + 
										 "<td colspan=2>" + obj.createDate + "</td>" +						 
								 "</tr>";
					}
					
					
				});
				$("#replyArea tbody").html(value);
			},error:function(){
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
	}
	
	</script>
</body>
</html>