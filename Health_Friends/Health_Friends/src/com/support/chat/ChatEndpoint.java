package com.support.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(
		value = "/echo/{name}", // name은 채팅참여 유저이름
		decoders = MessageDecoder.class, 
		encoders = MessageEncoder.class)
public class ChatEndpoint {
	
	private static List<Session> sessionList = new ArrayList<>();
	private static Map<String, String> nameMap = new HashMap<>();
	
	// 클라이언트와 연결된 이후 호출되는 메소드
	@OnOpen
	public void onOpen(Session session, @PathParam("name") String name) throws IOException {
	    System.out.println(name + "(" + session.getId() + ")님이 접속했습니다.");
	    
		sessionList.add(session);
		nameMap.put(session.getId(), name);
		
		Message message = new Message();
		message.setFromName(name);
		message.setFromId(session.getId());
		message.setContent("님이 채팅방에 참여하였습니다.");
		
		broadcast(session, message);
	}
	
	// 서버가 클라이언트로부터 메시지를 받았을때 호출되는 메소드
	@OnMessage
	public void onMessage(Session session, Message message) throws IOException {
	    String name = nameMap.get(session.getId());
	    System.out.println(name + "(" + session.getId() + ")로부터 " + message.getContent());
		
	    message.setFromName(name);
	    message.setFromId(session.getId());
	    
		broadcast(session, message);
	}
	
	// 클라이언트와 연결이 끊어졌을때 호출되는 메소드
	@OnClose
	public void onClose(Session session) throws IOException {
	    String name = nameMap.get(session.getId());
	    System.out.println(name + "(" + session.getId() + ")와 연결이 끊어졌습니다.");
		
		Message message = new Message();
		message.setFromName(name);
		message.setFromId(session.getId());
		message.setContent("님이 채팅방에서 나갔습니다.");
		
		broadcast(session, message);
		
		sessionList.remove(session);
		nameMap.remove(session.getId());
	}
	
	@OnError
	public void onError(Session session, Throwable throwable) {
		// Do error handling here
	}
	
	// 모두에게 메시지 전송
	private synchronized static void broadcast(Session selfSession, Message message) {
	    
		for (Session session : sessionList) {
		    if (selfSession.getId().equals(session.getId())) {
		        continue; // 메시지 보낸 당사자에게는 전송 제외하기
		    }
		    
		    if (message.getToId() == null || message.getToId().equals("")) {
                // 귓속말 상대 toId 값이 없으면 모두에게 메시지 전송
                Basic basic = session.getBasicRemote();
                try {
                    basic.sendObject(message);
                } catch (IOException | EncodeException e) {
                    e.printStackTrace();
                }
		    } else {
                // 귓속말 상대인 toId 값이 있으면 해당 세션에만 메시지를 전송하고 빠져나옴
                if (message.getToId().equals(session.getId())) {
                    Basic basic = session.getBasicRemote();
                    try {
                        basic.sendObject(message);
                    } catch (IOException | EncodeException e) {
                        e.printStackTrace();
                    }
                    break; // for문 빠져나옴
                }
		    }
		} // for
	}
}









