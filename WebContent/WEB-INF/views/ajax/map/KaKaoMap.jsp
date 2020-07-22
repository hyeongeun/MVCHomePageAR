<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- json키:  	f4f06a76630a9276ef8234f756b62177-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40c8cd411b115bf2afe9292bb6b6e429"></script>
	<script type="text/javascript">
		function setCenter() {            
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
		    
		    // 지도 중심을 이동 시킵니다
		    map.setCenter(moveLatLon);
		}
	
		function panTo() {
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		}      
		
		function zoomIn() {        
		    // 현재 지도의 레벨을 얻어옵니다
		    var level = map.getLevel();
		    
		    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
		    map.setLevel(level - 1);
		    
		    // 지도 레벨을 표시합니다
		    displayLevel();
		}    

		function zoomOut() {    
		    // 현재 지도의 레벨을 얻어옵니다
		    var level = map.getLevel(); 
		    
		    // 지도를 1레벨 올립니다 (지도가 축소됩니다)
		    map.setLevel(level + 1);
		    
		    // 지도 레벨을 표시합니다
		    displayLevel(); 
		}
		
		function displayLevel(){
		    var levelEl = document.getElementById('maplevel');
		    levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
		}
	</script>
</head>
<body>
	<div id="map" style="width:800px;height:400px;"></div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);
		
		displayLevel();
	</script>
	
	<p>
    <button onclick="setCenter()">지도 중심좌표 이동시키기</button> 
    <button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button> 
	</p>
	<p>
    <button onclick="zoomIn()">지도레벨 - 1</button>
    <button onclick="zoomOut()">지도레벨 + 1</button>
    <span id="maplevel"></span>
	</p>
</body>
</html>