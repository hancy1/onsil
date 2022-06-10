<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }

</style>
<script type="text/JavaScript">

  function setCookie( name, value, expiredays ) {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
  }
  function closeWin() {
    if ( document.checkClose.event.checked )
    setCookie("plantGrow_cook", "no" , 1);  // 쿠키이름_cook 은 위의 index와 같은 이름으로 변경
  }

</script>
</head>
<body onunload="closeWin()">
 <form name="checkClose" style="padding:0px; margin:0px;">

   <c:if test="${!empty list}">
   	<table class="table">
   		<tr><th>식물</th><th>마지막 관리일</th><th>관리내역</th></tr>
   		<c:forEach items="${list}" var="list">
   		<tr><th>[${list.plantName}]${list.nickname}</th><th>${fn:substring(list.enrollDate,0,11)}</th>
   			<th><c:if test="${list.water eq 'Y'}"><i class="fa-solid fa-droplet"></i></c:if>
   				<c:if test="${list.supplement eq 'Y'}"> <i class="fa-solid fa-prescription-bottle-medical"></i> </c:if>
   				<c:if test="${list.repotting eq 'Y'}"> <i class="fa-solid fa-seedling"></i> </c:if></th></tr>
  		 </c:forEach>
   	</table>
   	<h6 style="color:gray" align="right">물주기는 <i class="fa-solid fa-droplet"></i>, 영양제는 <i class="fa-solid fa-prescription-bottle-medical"></i>, 분갈이는 <i class="fa-solid fa-seedling"></i>로 표시됩니다.</h6>
   </c:if>
   
   <c:if test="${empty list}">
   <table>
   <tr><td>등록된 식물 관리내역이 없어요 <i class="fa-solid fa-face-sad-tear"></i> <br>
   		관리내역을 등록하면 캘린더에서 한눈에 관리내역을 볼 수 있어요</td></tr>
   </table>
   </c:if>
   <br>
  <div style="float:left; padding-left:10px;"><input type="checkbox" name="event" onclick="check_window();" />하루동안 이 창 띄우지 않음</div>
  <div style="padding-right:10px;" align="right"><a href="javascript:self.close();">닫기</a></div>
  </form>
<!-- i태그 이미지 cdn -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />

</body>
</html>