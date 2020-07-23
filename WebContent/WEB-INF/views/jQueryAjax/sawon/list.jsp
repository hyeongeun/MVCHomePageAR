<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${root}/xhr/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="${root}/css/sawon/listCss.css">
	<script type="text/javascript">
		$(function(){
			$("#departmentName").change(function(){
				var departmentName = $(this).val();
				var param = "departmentName="+departmentName;
				var url = "${root}/sawon/listOk.do?"+param;
				alert(url);
				
				$.ajax({
					url:url,
					type:"get",
					dataType:"text",
					success: resultProcess
				});
			});
			function resultProcess(data){
				//alert(data);
				var obj = $.parseJSON(data);
				$(obj).each(function(i){
					var div = "<table border='1'>";
					
					div+="<tr>";
					div+='<td align="center" width="100">'+obj[i].employee_id+'</td>';
					div+='<td align="center" width="100">'+obj[i].first_name+'</td>';
					div+='<td align="center" width="100">'+obj[i].job_id+'</td>';
					div+='<td align="center" width="100">'+obj[i].department_id+'</td>';
					div+='<td align="center" width="100">'+obj[i].department_name+'</td>';
					div+="</tr>";
					div+="</table>";
					
					$("#resultDisp").append(div);
				});
			}
		});
	</script>
</head>
<body>
	<form id="sawonForm">
		<select name="departmentName" id="departmentName">
			<option>부서를 선택하세요.</option>
			<option value="Marketing">Marketing</option>
			<option value="IT">IT</option>
			<option value="Sales">Sales</option>
		</select>
	</form>
	
	<div id="resultDisp" >
	
	</div>
</body>
</html>