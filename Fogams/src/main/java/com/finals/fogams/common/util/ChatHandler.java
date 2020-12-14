package com.finals.fogams.common.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler{

	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		list.add(session);
		
		System.out.println("하나의 클라이언트가 연결");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		String msg = message.getPayload();
		
		for(WebSocketSession s : list) {
			s.sendMessage(new TextMessage(session.getAcceptedProtocol() + ":" + msg));
		}
		
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		
		System.out.println("클라이언트와 연결 해제");
		
		list.remove(session);
	}
	
}
