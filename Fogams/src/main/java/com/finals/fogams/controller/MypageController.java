package com.finals.fogams.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finals.fogams.model.biz.MemberBiz;
import com.finals.fogams.model.biz.MemberBizImpl;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.MemberDto;

@Controller
public class MypageController {

	@Autowired
	private MemberBiz biz = new MemberBizImpl();
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("userdetail.do")
	public String userdetail(HttpServletRequest request, int member_no, Model model) {
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		
		
		
		
		MemberDto dto = new MemberDto();
		
		dto = biz.selectOne(member_no);
	
		
		model.addAttribute("dto", dto);
		model.addAttribute("member_no", member_no);
		
		return "userdetail";
	}
}
