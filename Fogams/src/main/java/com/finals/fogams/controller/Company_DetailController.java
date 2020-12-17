package com.finals.fogams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finals.fogams.model.biz.Company_InfoBiz;
import com.finals.fogams.model.dto.MemberDto;

@Controller
public class Company_DetailController {
	
	@Autowired
	private Company_InfoBiz biz;
	
	@RequestMapping("bookmark.do")
	public void bookMark(HttpServletRequest request) {
		
		MemberDto session = (MemberDto)request.getSession();
		String id = session.getMember_id();
		
		//MemberDto login = (MemberDto) request.getSession().getAttribute("login");
	}

}
