package com.finals.fogams.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.finals.fogams.model.biz.City_DetailBiz;
import com.finals.fogams.model.biz.ReplyBiz;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.ReplyDto;

@Controller
public class indexController {

	@Autowired
	private City_DetailBiz biz;
	@Autowired
	private ReplyBiz replybiz;

	//도시별 업체 정보 리스트 조회
	@RequestMapping("/company_info.do")
	public String moveToCityDetail(Model model, String company_city) {
		System.out.println("selectlist");
		System.out.println(company_city);
		List<CompanyDto> list = biz.selectlist(company_city);
		model.addAttribute("list", list);
				
		return "city_detail";
	}	

	//이미지 뿌리기
	@RequestMapping("/img.do")
	public void getImg(HttpServletRequest req, HttpServletResponse res, String img) throws IOException {
		ServletOutputStream imgout = res.getOutputStream();
		String imgpath = WebUtils.getRealPath(req.getSession().getServletContext(), "/resources/storage");

		String imgName = req.getParameter("img");

		File file = new File(imgpath + File.separator + imgName);
		System.out.println(file);
		FileInputStream input = null;

		if (file.exists()) {
			imgpath = imgpath + File.separator + imgName;
			input = new FileInputStream(imgpath);
			int length;

			byte[] buffer = new byte[10];
			while ((length = input.read(buffer)) != -1) {
				imgout.write(buffer, 0, length);
			}
			input.close();
		}
		
	}
	
	//업체 상세페이지 이동
	@RequestMapping("company_detail.do")
	public String company_selectOne(HttpServletRequest request, int company_no, Model model) {
		
		//MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		//int member_no = session.getMember_no();
		System.out.println("company_selectOne");
		CompanyDto dto = biz.selectOne(company_no);
		
		//model.addAttribute("member_no", member_no);
		model.addAttribute("dto", dto);
		
		List<ReplyDto> replyList = replybiz.selectList(company_no);
		model.addAttribute("replyList", replyList);
		
		return "company_detail";
	}
	
	@RequestMapping("company_updateform.do")
	public String company_updateform(Model model, int company_no) {
		model.addAttribute("dto", biz.selectOne(company_no));
		
		return "company_updateform";
	}
	
	@RequestMapping("company_updateres.do")
	public String company_updateres(CompanyDto dto, int company_no) {
		int res = biz.update(dto);
		if(res > 0) {
			return "redirect:company_detail.do?company_no="+company_no;
		}else {
			return "redirect:company_updateform.do?company_no="+company_no;
		}
		
	}
	
	@RequestMapping("company_delete.do")
	public String company_delete(int company_no) {
		
		int res = biz.delete(company_no);
		if(res > 0) {
			return "redirect:company_info.do";
		}else {
			return "redirect:company_delete.do";
		}
		
	}
	
	

}
