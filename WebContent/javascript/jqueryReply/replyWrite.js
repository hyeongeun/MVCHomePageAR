/**
 * 
 */

var arr=new Array();
var root=null;

function writeToServer(requestRoot) {
	 root=requestRoot;
	
	var writeReply =$("#writeReply").val();
	var params="writeReply="+writeReply;
	var url=root+"/reply/replyWrite.do?"+params;
	//arr.push(url);
	//alert(url);
	
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:writeProcess
	});
	
	
	
}

function writeProcess(data){
	//alert(data);
	var obj = $.parseJSON(data);
	//arr.push(obj.bunho);
	//arr.push(obj.line_reply);
	//alert(arr.join("\n"));
	
	var bunho = obj.bunho;
	var reply = obj.reply;
	alert(reply);
	alert(bunho);
	
	$("#writeReply").val("");
	var newReplyText = "<div class='replyDiv' id='"+bunho+"'>";
	newReplyText += "<span class='cssBunho'>"+bunho+"</span>";
	newReplyText += "<span class='cssReply'>"+reply+"</span>";
	newReplyText += "<span class='cssUpDel'>";
	newReplyText += "<a href='javascript:deleteToServer("+bunho+",\""+root+"\")'>삭제</a> &nbsp";
	newReplyText += "<a href='javascript:selectToServer("+bunho+",\""+root+"\")'>수정</a>";
	newReplyText += "</span>";
	newReplyText+="</div>"
	$("#listAllDiv").prepend(newReplyText);
}


