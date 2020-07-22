<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/xhr/xhr.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40c8cd411b115bf2afe9292bb6b6e429"></script>
<script type="text/javascript">
		var arr = new Array();
	
		function toServer(){
			var addr =document.getElementById("addr").value;
			arr.push(addr);
			alert(arr);
			
			var url = "https://dapi.kakao.com/v2/local/search/address.json";
			var params = "query="+addr;
			
			
			sendRequest("GET", url, params, fromServer);
		}
		
		function fromServer(){
			//arr.push(xhr.readyState+","+xhr.status);
			//alert(arr);
			if(xhr.readyState==4 && xhr.status==200){
				//arr.push(xhr.responseText);
				processJson();
			}
			//alert(arr);
		}
		var map;
		function processJson(){
			var obj = JSON.parse(xhr.responseText);
			var y = obj.documents[0].y;
			var x = obj.documents[0].x;
			//arr.push(y+" , "+x);
			//alert(arr);
		
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(y,x),
				level: 3
			};
			
			map = new kakao.maps.Map(container, options);
			service();
			
		}
		
		function service(){
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
			
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			
			// 아래와 같이 옵션을 입력하지 않아도 된다
			var zoomControl = new kakao.maps.ZoomControl();

			// 지도 오른쪽에 줌 컨트롤이 표시되도록 지도에 컨트롤을 추가한다.
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
		}
	</script>
</head>
<body>
	<h3>주소</h3>
	<input type="text" id="addr" />
	<input type="button" value="주소검색" onclick="toServer()" /><br><br>

	<div id="map" style="width: 800px; height: 400px;"></div>
	<script>
				var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
			
			var map = new kakao.maps.Map(container, options);
			service();
			
	</script>
	<div></div>
</body>
</html>