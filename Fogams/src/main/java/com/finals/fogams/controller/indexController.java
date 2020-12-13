package com.finals.fogams.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finals.fogams.model.biz.City_DetailBiz;
import com.finals.fogams.model.dto.Company_InfoDto;

@Controller
public class indexController {
	
	//company_info 테이블에서 정보 가져오기
	
	@Autowired
	private City_DetailBiz biz;
	
	@RequestMapping("/company_info.do")
	public String moveToCityDetail(Model model) {
		System.out.println("selectlist");
		model.addAttribute("list", biz.selectlist());
		System.out.println(biz.selectlist().toString());
		return "city_detail";
	}

	
	
}
