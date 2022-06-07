<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	#enrollForm>table{
 	width:80%;
 	 margin:auto;
 	 }
    #enrollForm>table *{ margin:5px;}
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
            <br>
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="inserRBoard.do" enctype="multipart/form-data">
                <table align="center">
                   
                    <tr>
                        <th><label for="rbTitle">제목</label></th>
                        <td><input type="text" id="rbTitle" class="form-control" name="rbTitle" required></td>
                    </tr>
                  
                    <tr>
                        <th><label for="userNo">작성자</label></th>
                        <td><input type="text" id="userNo" class="form-control" value="${ loginUser.userId }" name="userNo" readonly></td>
                    </tr>
                    <div class="col-12 col-md-6">
                           <div class="form-group">
                           <select name="category" class="form-control" id="category">
                               <option value="">카테고리 선택</option>
                               <option value="Fair">전시회후기</option>
                               <option value="prohibit">박람회후기</option>
                              
                               </select>
                                 </div>
                            </div>
                            <c:choose>
    <%-- 로그인 상태일때 - 하트 클릭 되게 --%>
    <c:when test="${!empty loginUser}">
        <c:choose>
            <c:when test="${empty tmp.rbLikeNo}">
                <%-- 빈 하트일때 --%>
                <span> <a idx="${tmp.rbNo }" href="javascript:"
                    class="heart-click heart_icon${tmp.rbNo }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                            fill="currentColor" class="bi bi-suit-heart"
                            viewBox="0 0 16 16">
                                  <path
                                d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                </svg></a>
                </span>
            </c:when>
            <c:otherwise>
                <%-- 꽉찬 하트일때 --%>
                <span> <a idx="${tmp.rbNo }" href="javascript:"
                    class="heart-click heart_icon${tmp.rbNo }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                            fill="currentColor" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
            </c:otherwise>
        </c:choose>
    </c:when>
    <%-- 로그인 상태가 아닐때  - 하트클릭 안되게 --%>
    <c:otherwise>
        <span> <a href="javascript:" class="heart-notlogin">
                <svg class="heart3" xmlns="http://www.w3.org/2000/svg"
                    width="16" height="16" fill="currentColor"
                    class="bi bi-suit-heart" viewBox="0 0 16 16">
                          <path
                        d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                        </svg>
        </a>
        </span>
    </c:otherwise>
</c:choose>
<span id="heart${tmp.rbNo }">${tmp.like }</span>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="uploadFile"></td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="boardContent" id="content" rows="10" style="resize:none;"></textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                   <button type="button" onclick="location.href='ticketAddress.do' " class="btn btn-primary">위치확인</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>
    
      <script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
    
    <script>
 // 로그인 한 상태에서 하트를 클릭했을 때 (로그인한 상태인 하트의 <a></a> class명: heart-click)
    $(".heart-click").click(function() {

        // 게시물 번호(no)를 idx로 전달받아 저장합니다.
        let no = $(this).attr('idx');
        console.log("heart-click");

        // 빈하트를 눌렀을때
        if($(this).children('svg').attr('class') == "bi bi-suit-heart"){
            console.log("빈하트 클릭" + no);

            $.ajax({
                url : 'saveHeart.do',
                type : 'get',
                data : {
                    no : no,
                },
                success : function(pto) {
                    //페이지 새로고침
                    //document.location.reload(true);

                    let heart = pto.heart;

                    // 페이지, 모달창에 하트수 갱신
                    $('#m_heart'+no).text(heart);
                    $('#heart'+no).text(heart);

                    console.log("하트추가 성공");
                },
                error : function() {
                    alert('서버 에러');
                }
            });
            console.log("꽉찬하트로 바껴라!");

            // 꽉찬하트로 바꾸기
            $(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart-fill' viewBox='0 0 16 16'><path d='M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z'/></svg>");
            $('.heart_icon'+no).html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart-fill' viewBox='0 0 16 16'><path d='M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z'/></svg>");

        // 꽉찬 하트를 눌렀을 때
        }else if($(this).children('svg').attr('class') == "bi bi-suit-heart-fill"){
            console.log("꽉찬하트 클릭" + no);

            $.ajax({
                url : 'removeHeart.do',
                type : 'get',
                data : {
                    no : no,
                },
                success : function(pto) {
                    //페이지 새로고침
                    //document.location.reload(true);

                    let heart = pto.heart;
                    // 페이지, 모달창에 하트수 갱신
                    $('#m_heart'+no).text(heart);
                    $('#heart'+no).text(heart);

                    console.log("하트삭제 성공");
                },
                error : function() {
                    alert('서버 에러');
                }
            });
            console.log("빈하트로 바껴라!");

            // 빈하트로 바꾸기
            $(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16"><path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" /></svg>');

            $('.heart_icon'+no).html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16"><path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" /></svg>');
        }



    });


    // 로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창이 뜹니다.
    // (로그인한 상태인 하트의 <a></a> class명: heart-notlogin)
    $(".heart-notlogin").unbind('click');
    $(".heart-notlogin ").click(function() {
        alert('로그인 하셔야 하트를 누를수 있습니다!');
    });
    </script>
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