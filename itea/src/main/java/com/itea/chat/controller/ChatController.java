package com.itea.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itea.dto.ChatDTO;

@Controller
public class ChatController {
	private List<ChatDTO> messages;
	
	ChatController(){
		messages = new ArrayList<>();
	}
	
	@RequestMapping("chat/main")
	public String showMain() {
		return "chat/main";
	}
	
	@RequestMapping("chat/addMessage")
	@ResponseBody
	public Map addMessage(String writer, String body) {
		long id = messages.size();
		ChatDTO chatMessage = new ChatDTO(id,writer,body);		
		
		messages.add(chatMessage);
		
		Map<String, Object> rs = new HashMap<>();
		
		rs.put("msg","메세지가 추가되었습니다.");
		
		return rs;
	}
	
	@RequestMapping("/chat/getMessages")
	@ResponseBody
	public List getMessages(int from) {
		return messages.subList(from,messages.size());
	}
	
	
	@RequestMapping("chat/getAllMessage")
	@ResponseBody
	public List<ChatDTO> getAllMessage(){
		return messages;
	}
	
	@RequestMapping("/chat/clear")
	@ResponseBody
	public String clear() {
		messages.clear();
		return "메세지 전체 삭제";
	}
	
}
