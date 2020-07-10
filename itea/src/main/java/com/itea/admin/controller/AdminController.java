package com.itea.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itea.admin.service.AdminService;
import com.itea.dto.MemberDTO;
import com.itea.util.Criteria;
import com.itea.util.PageMaker;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService adminSV;
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception{
		logger.info("listPage");
		List<MemberDTO> list = adminSV.listPage(cri); 
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = adminSV.totalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("LIST",list); 
		model.addAttribute("pageMaker", pageMaker);
	}
	
	


	
}
