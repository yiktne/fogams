package com.finals.fogams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.MemberDto;

@Controller
public class MypageController {

	
//	@RequestMapping("mylist.do")
//	public String mylist(HttpServletRequest request, Model model, int member_no) {
//		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
//
//		CompanyDto dto = new CompanyDto();
//		dto.setMember_no(member_no);
//		
//		
//		
//		
////		System.out.println("member_no : " + member_no );
//		model.addAttribute("member_no", member_no);
//		model.addAttribute("dto", dto);
//		
//		return "mypage";
//	}
}
