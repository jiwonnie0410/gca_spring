<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- json-serializeObject js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
		
<title>운동하자!</title>
<script>

	var webSocket;
	var mstatus = "<sec:authentication property='principal.m_id'/>";

	$(function(){
		msg = {
				cmd : "alertCnt",
				id : mstatus
		}
		webSocket.send(  JSON.stringify( msg )   );
	});
	
	if(mstatus != null && mstatus != ''){
		webSocket = new WebSocket('ws://localhost/gca/broadcast.do'); 
		
		webSocket.onerror = function(event) { onError(event) };
		webSocket.onopen = function(event) { onOpen(event) };
		webSocket.onmessage = function(event) { onMessage(event) };
	}
	
	function onError(event) { 
		console.log(event); 
		 alert(event.data); 
	}
	
	function onOpen(event) {
		
	}
	
	function onMessage(event){
		var result = JSON.parse(event.data);
		console.log(result + "ㅁㄴㅇㄻㄴㅇㄹ");
		if(result.cmd == "alertCnt"){
			$('#alertcnt').text(result.msg);
		} else {
			onMessageChat(event);
		}
	}

</script>
</head>
<body>
	<div style="padding-bottom: 80px;">
		<tiles:insertAttribute name="user-content" />
	</div>
	
		<tiles:insertAttribute name="footer-menubar" />
</body>
</html>