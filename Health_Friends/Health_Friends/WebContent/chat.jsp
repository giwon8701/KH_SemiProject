<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var sock;

function openSocket() {
	if (sock != null && sock !== undefined && sock.readyState !== WebSocket.CLOSED) {
		$('#messages').append('웹소켓이 이미 연결되었습니다.<br>');
		scroll();
		return;
	}
	
	// 채팅에 사용할 이름 가져오기
	var name = $('#name').val();
	
	// 웹소켓 객체 생성하여 소켓서버에 연결 요청하기. 채팅에 사용할 이름도 함께 보냄.
	sock = new WebSocket('ws://localhost:8787/echo/' + name);
	
	// 서버와 연결이 완료된후 자동호출됨
	sock.onopen = function (event) {
		$('#messages').append('연결되었습니다.<br>');
		scroll();
	}
	
	// onmessage는 서버로부터 메시지를 받았을때 호출됨
	sock.onmessage = function (event) {
		console.log('event.data : ' + event.data);
		var message = JSON.parse(event.data);
		console.log('message : ' + message);
		
		var str = message.fromName + '(' + message.fromId + ') ▶ ' + message.content  + '<br>';
		
		$('#messages').append(str);
		scroll();
	};
	
	sock.onclose = function (event) {
		$('#messages').append('연결이 끊어졌습니다.<br>');
		scroll();
	}
	
}

function closeSocket() {
	sock.close();
	sock = null;
}

function send() {
	var inputMessage = $('#message-input').val();
	if (inputMessage == '') {
		return;
	}
	
	var message = {};
	message.fromName = $('#name').val();
	message.fromId = '';
	message.toId = '';
	message.content = inputMessage;
	
	var toId = $('#toId').val();
	if (toId != '') {
		message.toId = toId;
	}
	
	console.log('message : ' + message);
	sock.send(JSON.stringify(message));
	
	var str = '<span style="color: red;">' + message.fromName + ' ▶ ' + message.content  + '</span><br>';
	$('#messages').append(str);
	scroll();
	
	$('#message-input').val('');
}

function scroll() {
	var top = $('#messages').prop('scrollHeight');
	$('#messages').scrollTop(top);
}


$(document).ready(function () {
	
	$('#btnOpen').on('click', function (event) {
		openSocket();
	});
	
	$('#btnClose').on('click', function (event) {
		closeSocket();
	});
	
	$('#btnSend').on('click', function (event) {
		send();
	});
	
	$('#message-input').on('keydown', function (event) {
		if (event.keyCode == 13) { // 엔터키
			send();
		}
	});
	
});
</script>
</head>
<body>

<h3>채팅 페이지</h3>
나의 이름: <input type="text" id="name"><br>
귓속말할 상대 아이디: <input type="text" id="toId"><br>
메시지: <input type="text" id="message-input"><br>

<div>
	<button type="button" id="btnOpen">입장</button>
	<button type="button" id="btnSend">전송</button>
	<button type="button" id="btnClose">나가기</button>
</div>

<div id="messages" style="overflow: auto; width: 500px; height: 500px; border: 1px solid black;"></div>

</body>
</html>






