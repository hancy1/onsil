<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png">

<!-- 부트스트랩아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   width: 70%;
   height: 500px;
   background: gray;
   margin-left: 12%;
   margin-bottom: 3%;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 250px;
   margin: 10px 0 30px 10px;
   overflow-y: auto;
   font-size: 12px;

}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

div[class="sidebar"] {
   width: 500px;
   height: 100%;
   background: white;
   position: fixed;
   top: 0;
   left: -500px;
   transition: all .35s;
   z-index: 1;
}

input[id="sideCheck"] {
   display: none;
}

input[id="sideCheck"]:checked+label+div {
   left: 0;
}

input[id="sideCheck"]+label {
   display: block;
   position: fixed;
   width: 35px;
   height: 80px;
   background: #F2F2F2;
   left: 0;
   top: 35%;
   transition: all .35s;
   z-index: 2;
   border-radius: 0 50% 50% 0;
}

i[id="sideicon"] {
   margin-top: 4px;
   color: black;
}

input[id="sideCheck"]:checked+label {
   left: 500px;
}

</style>



<!-- 다음 주소 검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f5d66dc749c8e9ceaec5ddeacf9e01f&libraries=services,clusterer,drawing"></script>
<script>
   window.onload = function(){
       document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
           new daum.Postcode({
               oncomplete: function(data) {
                   document.getElementById("address_kakao").value = data.address; // 주소 넣기
                   document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
               }
           }).open();
       });
   }
   
   

</script>

<title>주소</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/icon.png"> 
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>


     <!-- ##### Breadcrumb Area Start ##### -->
   <div class="breadcrumb-area">
      <!-- Top Breadcrumb Area -->
      <div
         class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
         style="background-image: url(resources/img/bg-img/admin1.jpg);">
         <h2>위치보기</h2>
      </div>
       <div class="container">
         <div class="row">
            <div class="col-12">
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="#"><i
                           class="fa fa-home"></i> Home</a></li>
                     <li class="breadcrumb-item"><a href="#">예약</a></li>
                     <li class="breadcrumb-item active" aria-current="page">위치</li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </div>

   
   <input type="checkbox" id="sideCheck" style="display: none;">
   <label for="sideCheck">
      <i id="sideicon" class="fa fa-angle-right fa-4x" aria-hidden="true"></i>
   </label>
   
   <div class="sidebar">

    </div>
    
      <form onsubmit="searchPlaces();" style="padding-left:12%;">
         <div class="search_box" id="keyword">
            <input type="text" id="address_kakao" readonly>
            <button type="submit">
               <i class="fa fa-search"></i>
            </button>
         </div>
        </form>

   <br><br>
   
   <div class="map_wrap">
       <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
   </div>
   <hr align="center" style="border-top: 3px double #03cf5d; width: 80%;">
    <div>
     
   </div> 

   
	<!-- kakao API -->
	<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('이태원 맛집', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
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