package com.finals.fogams.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finals.fogams.model.biz.SearchBiz;
import com.finals.fogams.model.dto.CompanyDto;

@Controller
public class SearchController {
	
	@Autowired
	private SearchBiz biz;
	
	@RequestMapping("searchList.do")
	public String searchList(@RequestParam(defaultValue = "title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, Model model)throws Exception{
		
		System.out.println("searchList");
		
		List<CompanyDto> list = biz.searchList(searchOption, keyword);
		int count = biz.countList(searchOption, keyword);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		//mav.addObject("map", map);

		model.addAttribute("map", map);
		
		return "search_result";
	}
	

}
