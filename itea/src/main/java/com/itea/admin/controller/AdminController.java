package com.itea.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itea.admin.service.AdminService;
import com.itea.dto.Search;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminSV;
	
	@RequestMapping(value = "/getMemberList",method=RequestMethod.GET)
	public String getMemberList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "mnick") String searchType
			, @RequestParam(required = false) String keyword
			) throws Exception {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		//전체 게시글 수
		int listCnt = adminSV.getMemberListCnt(search);
		search.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", search);
		model.addAttribute("memberList", adminSV.getMemberList(search));
		return "admin/listPage";
	}

	
}
