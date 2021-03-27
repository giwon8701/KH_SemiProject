<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%-- 안녕2 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function openChat() {
		document.getElementById("chat").style.display = "block";
	}
	function closeChat() {
		document.getElementById("mychat").style.display = "none";
	}
</script>
</head>
<body>
	<!-- 채팅 영역 -->
	<form>
		<!-- 텍스트 박스에 채팅의 내용을 작성한다 -->
		<input id="textMessage" type="text" onkeydown="return enter()">
		<!-- 서버로 메시지를 전송하는 버튼 -->
		<input onclick="sendMeessage()" value="Send" type="button">
	</form>
	<br>
	<!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->
	<textarea id="messageTextArea" rows="10" cols="50" disabled="disabled"></textarea>
	<script type="text/javascript">
		/// 서버의 broadsocket의 서블릿으로 웹 소켓을 한다.
		var webSocket = new WebSocket("ws://localhost:8080/ChatExample/broadsocket");
		// 콘솔 텍스트 영역
		var messageTextArea = document.getElementById("messageTextArea");
		
		// 접속이 완료되면
		webSocket.onopen = function(message) {
			// 콘솔에 메시지를 남긴다.
			messageTextArea.value += "Server connect...\n";
		};
		// 접속이 끝기는 경우는 브라우저를 닫는 경우이기 떄문에 이 이벤트는 의미가 없음.
		webSocket.onclose = function(message) {};
		// 에러가 발생하면
		webSocket.onerror = function(message) {
			messageTextArea.value += "error...\n";// 콘솔에 메시지를 남긴다.
		};
		// 서버로부터 메시지가 도착하면 콘솔 화면에 메시지를 남긴다.
		webSocket.onmessage = function(message) {
			messageTextArea.value += "(operator) => " + message.data + "\n";
		};
		
		// 서버로 메시지를 발송하는 함수
		// Send 버튼을 누르거나 텍스트 박스에서 엔터를 치면 실행
		function sendMessage() {
			// 텍스트 박스의 객체를 가져옴
			let message = document.getElementById("textMessage");
			// 콘솔에 메세지를 남긴다.
			messageTextArea.value += "(me) => " + message.value + "\n";
			// 소켓으로 보낸다.
			webSocket.send(message.value);
			// 텍스트 박스 추기화
			message.value = "";
		}
		
		// 텍스트 박스에서 엔터를 누르면
		function enter() {
			// keyCode 13은 엔터이다.
			if (event.keyCode === 13) {
				// 서버로 메시지 전송
				sendMessage();
				// form에 의해 자동 submit을 막는다.
				return false;
			}
			return true;
		}
	</script>

</body>
</html>
