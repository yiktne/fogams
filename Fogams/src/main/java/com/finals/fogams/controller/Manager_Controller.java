package com.finals.fogams.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finals.fogams.common.util.Criteria;
import com.finals.fogams.common.util.PagingDto;
import com.finals.fogams.model.biz.MemberBiz;
import com.finals.fogams.model.dto.MemberDto;

@Controller
public class Manager_Controller {
	
	@Autowired
	private MemberBiz biz;

	//멤버 리스트 출력

	@RequestMapping(value={"/managing_member.do", "/list.do"})
	public String managingMember(Model model, Criteria cri) {
		
		System.out.println("managingMember");
		List<MemberDto> list = biz.memberList(cri);
		
		
		PagingDto pagemaker = new PagingDto();
		pagemaker.setCri(cri); //현재페이지 index
		pagemaker.setTotalCount(biz.listCount()); //게시글 전체 갯수 구하기
		
		System.out.println("전체회원수 : " + pagemaker.getTotalCount());
		
		model.addAttribute("pagemaker", pagemaker);
		model.addAttribute("list", list);
		
		return "manager_page";
	}
	
	@ResponseBody
	@RequestMapping("/delete_member.do")
	public int deleteMember(@RequestBody MemberDto dto) {
		System.out.println("deleteMember");
		int member_no = dto.getMember_no();
		int res = biz.deleteMember(member_no);
		if(res>0) {
			return 1;
		}else {
			return 0;
		}
	}
}
