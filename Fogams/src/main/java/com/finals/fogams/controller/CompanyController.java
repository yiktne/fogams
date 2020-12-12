//package com.finals.fogams.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.finals.fogams.model.biz.CompanyBiz;
//import com.finals.fogams.model.biz.CompanyBizImpl;
//import com.finals.fogams.model.dto.CompanyDto;
//
//@Controller
//public class CompanyController {
//	
//	private CompanyBiz biz = new CompanyBizImpl();
//	
//	
//	@RequestMapping("")
//	public String list(Model model) {
//		
//		System.out.println("Company list.do");
//		
//		model.addAttribute("list", biz.selectList());
//		return "company_list";
//	}
//	
//	@RequestMapping("")
//	public String detail(Model model, int company_no) {
//		
//		System.out.println("Company detai.do");
//		model.addAttribute("dto", biz.selectOne(company_no));
//		
//		return "company_detail";
//	}
//	
//	@RequestMapping("")
//	public String insertform() {
//		
//		System.out.println("Company insertform.do");
//		
//		return "company_insertform";
//	}
//	
//	@RequestMapping("")
//	public String insertres(Model model, CompanyDto dto) {
//		
//		System.out.println("Company insertres.do");
//		
//		int res = biz.insert(dto);
//		if(res > 0) {
//			return "redirect:list.do";
//		}else {
//			return "redirect:insertform.do";
//		}
//		
//	}
//	
//	
//	
//
//}
