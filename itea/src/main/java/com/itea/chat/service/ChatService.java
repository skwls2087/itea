package com.itea.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itea.dao.ChatDAO;
import com.itea.dto.ChatDTO;

@Service
public class ChatService {

	@Autowired
	ChatDAO chatDAO;

	//채팅 내용 삽입
	public void chatInsert(ChatDTO chatDTO) {
		
		chatDAO.chatInsert(chatDTO);
	}
	
	
}
