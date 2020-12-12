package com.finals.fogams.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finals.fogams.model.biz.City_DetailBiz;

@Controller
public class indexController {
	
	//company_info 테이블에서 정보 가져오기
	
	@Autowired
	private City_DetailBiz biz;
	
	@RequestMapping("/company_info.do")
	public String moveToCityDetail(String keyword, Model model) {
		System.out.println("selectlist");
		model.addAttribute("list", biz.selectlist(keyword));
		return "city_detail";
	}

	
	
}
