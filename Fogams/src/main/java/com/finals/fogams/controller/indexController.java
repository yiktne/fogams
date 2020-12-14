package com.finals.fogams.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finals.fogams.model.biz.City_DetailBiz;

import com.finals.fogams.model.dto.Company_join_Company_infoDto;

@Controller
public class indexController {
	
	
	@Autowired
	private City_DetailBiz biz;
	
	@RequestMapping("/company_info.do")
	public String moveToCityDetail(Model model, String city) {
		List<Company_join_Company_infoDto> list = biz.selectlist(city);
		System.out.println("selectlist");
		model.addAttribute("list", list);
		
		System.out.println(list.size());
		
		return "city_detail";
	}

	
	
}
