<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


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
	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	
	var markers = [];
	var map = new kakao.maps.Map(container, options);
	
	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById("address_kakao").value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('주소를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);

	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

	        alert('검색 결과가 존재하지 않습니다.');
	        return;

	    } else if (status === kakao.maps.services.Status.ERROR) {

	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
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
							<li class="breadcrumb-item"><a href="#">관리자페이지</a></li>
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
		<ul id="placesList"></ul>
        <div id="pagination"></div>
	</div> 


	<script>
    $(document).ready(function(){
    	
		var storeAddress = $("#store_address").data("address");
        
    	var storeName = $("#store_name").data("store_name");
    	
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	
    	mapOption = {
    	    center: new kakao.maps.LatLng(33.25110701, 126.570667), // 지도의 중심좌표
    	    level: 3 // 지도의 확대 레벨
    	};  
    	
    	// 지도를 생성합니다    
    	var map = new kakao.maps.Map(mapContainer, mapOption); 
    	
    	// 주소-좌표 변환 객체를 생성합니다	
    	var geocoder = new kakao.maps.services.Geocoder();
    	
    	// 주소로 좌표를 검색합니다
    	geocoder.addressSearch(storeAddress, function(result, status) {
    		
    	    // 정상적으로 검색이 완료됐으면 
    	     if (status === kakao.maps.services.Status.OK) {
    	
    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	        
    	        // 결과값으로 받은 위치를 마커로 표시합니다
    	        var marker = new kakao.maps.Marker({
    	            map: map,
    	            position: coords
    	        });
    	
    	        // 인포윈도우로 장소에 대한 설명을 표시합니다
    	        var infowindow = new kakao.maps.InfoWindow({
    	            content: '<div style="width:150px;text-align:center;padding:3px 0;">' + storeName + '</div>'
    	        });
    	        infowindow.open(map, marker);
    	
    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    	        map.setCenter(coords);
    	        
    	        
    	        $(".storePosition").click(function(){
    	        	map.panTo(coords);  
    	        })
    	        
    	        
    	    } 
    			 
    	});    
    	
    	
    	var userAddress = $("#delevery_address").val();
    	
    	if(userAddress != "" ) {
    		$(".userPosition").css("display" , "inline");
    		
    	  // 주소로 좌표를 검색합니다
    	 	geocoder.addressSearch(userAddress, function(result, status) {
    	 		
    	 	    // 정상적으로 검색이 완료됐으면 
    	 	     if (status === kakao.maps.services.Status.OK) {
    	 	
    	 	        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	 	        
    	 	        // 결과값으로 받은 위치를 마커로 표시합니다
    	 	        var marker = new kakao.maps.Marker({
    	 	            map: map,
    	 	            position: coords
    	 	        });
    	 	        
    	 	        // 인포윈도우로 장소에 대한 설명을 표시합니다
    	 	        var infowindow = new kakao.maps.InfoWindow({
    	 	            content: '<div style="width:150px;text-align:center;padding:3px 0;">' + "배달받을위치" + '</div>'
    	 	        });
    	 	        infowindow.open(map, marker);
    	 	        
    	 	      	$(".userPosition").click(function(){
    		        	map.panTo(coords);  
    		        })
    	 	    } 
    	 	}); 
    		 
    	}
    	
        })
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
	
	
</body>
</html>