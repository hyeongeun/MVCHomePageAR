<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/xhr/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40c8cd411b115bf2afe9292bb6b6e429"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			var addr=$("#addr").val();
			var params = "query="+addr;
			//alert(params);
			
			$.ajax({
				url:"https://dapi.kakao.com/v2/local/search/address.json?"+params,
				type:"get",
				dataType:"json",
				//xhr.setRequestHeader("Authorization","KakaoAK f4f06a76630a9276ef8234f756b62177");
				headers:{"Authorization":"KakaoAK f4f06a76630a9276ef8234f756b62177"},
				success:processJson
			})
		});
		function processJson(obj){
			var y = obj.documents[0].y;
			var x = obj.documents[0].x;
			
			//alert(y+" , "+x);
		
			 var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(y,x),
				level: 3
			};
			
			map = new kakao.maps.Map(container, options);
			
			
		}
	});

	
	</script>
</head>
<body>
	<h3>주소</h3>
	<input type="text" id="addr"/>
	<input type="button" value="주소검색" id="btn"/><br><br>

	<div id="map" style="width: 800px; height: 400px;"></div>
	<script>
				
			
	</script>
	<div></div>
</body>
</html>