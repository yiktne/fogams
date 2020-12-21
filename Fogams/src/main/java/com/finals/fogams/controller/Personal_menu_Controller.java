package com.finals.fogams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finals.fogams.model.biz.Personal_menu_Biz;
import com.finals.fogams.model.dto.BookmarkDto;
import com.finals.fogams.model.dto.MemberDto;

@Controller
public class Personal_menu_Controller {

	@Autowired
	private Personal_menu_Biz biz;

	// 북마크 추가.
	@ResponseBody
	@RequestMapping(value = "/bookmark.do", method = RequestMethod.POST)
	public int bookMark(HttpServletRequest request, @RequestBody BookmarkDto dto) {
		System.out.println("bookmark Controller");
		// 세션 가져오기
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		
		//세션이 존재하지 않으면 jsp에 2 리턴.
		if(session == null) {
			return 2;
		}else {
			//존재한다면 북마크 되어있는지 여부 체크.
			dto.setMember_no(session.getMember_no());
			// 북마크 되어있는지 여부 체크
			int isBookmarked = biz.bookmarkValidityCheck(dto);
			System.out.println("북마크 결과 : " + isBookmarked);
			//안 되어 있다면 북마크 insert
			if (isBookmarked == 0) {
				int res = biz.bookMarkInsert(dto);
				if (res > 0) {
					System.out.println("북마크 추가 성공");
					return 0;
				} 
			}
			
		}
		
		return 1;
	}
	
	//북마크 리스트보기
	@RequestMapping("/bookmarklist.do")
	public String bookMarkList(HttpServletRequest request, Model model) {
		System.out.println("bookMarkList");
		
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		int member_no = session.getMember_no();
		System.out.println("멤버번호 : " + member_no);
		List<BookmarkDto> list = biz.bookMarkList(member_no);
		model.addAttribute("list", list);
		
		return "myBookmark";
	}
	
	//북마크 삭제
	@ResponseBody
	@RequestMapping("/bookmarkDelete.do")
	public int bookMarkDelete(@RequestBody BookmarkDto dto) {
		System.out.println("bookMarkDelete");
		int bookmark_no = dto.getBookmark_no();
		System.out.println("bookmark_no : " + bookmark_no);
		int res = biz.bookMarkDelete(bookmark_no);
		if(res>0) {
			System.out.println("북마크 삭제 성공");
			return 1;
		}
		
		return 0;
	}

}
