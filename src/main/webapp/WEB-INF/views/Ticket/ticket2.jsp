<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	 

    <jsp:include page="../common/menubar.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>티켓등록</h2>
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollTicket.do">글쓰기</a>
            </c:if>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>티켓번호</th>              
                    <th>전시회명</th>
                    <th>작성자</th>
                    <th>전화번호</th>
                    <th>작성일</th>
                    <th>첨부파일</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="t">
	                    <tr>
	                        <td>${ t.ticketNo }</td>
	                        <td>${ t.ticketTitle }</td>
	                        <td>${ t.userName }</td>
	                        <td>${ t.phone }</td>
	                        <td>${ b.createDate }</td>
	                        <c:if test="${ !empty t.originName }">
	                        	<td>★</td>
	                        </c:if>
	                        <c:if test="${ empty t.originName }">
	                        	<td>&nbsp;</td>
	                        </c:if>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="listTicket.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="listBoard.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="listBoard.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="listBoard.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
    <script>
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			location.href="detailTicket.do?bno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>


    <jsp:include page="../common/footer.jsp"/>
</body>
</html>