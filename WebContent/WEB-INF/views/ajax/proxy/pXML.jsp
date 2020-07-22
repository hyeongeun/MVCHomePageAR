<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${root}/xhr/xhr.js"></script>
	<script type="text/javascript">
		function toServer(root) {
			// 열었던 RSS 파일 주소 복사 붙여넣기.
			//https://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109
			var url=root+"/pXML.do";
			// POST 될 수 없다.
			sendRequest("GET",url,null,fromServer);
		}
		
		function fromServer() {
			// 외부에서 데이터를 가져올 때는 항상 확인하기. 4 / 200 넘어오면 뿌리기.
			//alert(xhr.readyState+" / "+xhr.status);
			if(xhr.readyState == 4 && xhr.status==200){
				//alert(xhr.responseXML);
				processXML();
			}
		}
		
		function processXML(){
			var xmlDoc = xhr.responseXML;
			
			var location = xmlDoc.getElementsByTagName("location");
			alert(location.length);
			
			var titleWf = xmlDoc.getElementsByTagName("wf");
			document.getElementById("titleWf").innerHTML = titleWf[0].childNodes[0].nodeValue;
			
			var city = location[3].getElementsByTagName("city");
			document.getElementById("city").innerText = city[0].firstChild.nodeValue;
			
			var data = location[3].getElementsByTagName("data");
			var wf = data[0].getElementsByTagName("wf");
			document.getElementById("wf").innerText = wf[0].firstChild.nodeValue;
		}
	</script>
</head>
<body>
	<input type="button" value="오늘의 날씨" onclick="toServer('${root}')">
	<div>
		<span id="titleWf" style="color:red;"></span><br><br>
		<span id="city" style="color:blue;"></span><br><br>
		<span id="wf"></span><br><br>
	</div>
</body>
</html>