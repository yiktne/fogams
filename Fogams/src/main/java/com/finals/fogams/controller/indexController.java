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

import com.finals.fogams.common.util.Criteria;
import com.finals.fogams.common.util.PagingDto;
import com.finals.fogams.model.biz.City_DetailBiz;
import com.finals.fogams.model.dto.CompanyDto;

@Controller
public class indexController {

	@Autowired
	private City_DetailBiz biz;

	@RequestMapping(value={"/company_info.do", "/list.do"})
	public String moveToCityDetail(Model model, String company_city, Criteria cri) {
		cri.setCompany_city(company_city);
		List<CompanyDto> list = biz.selectlist(cri);
		System.out.println("selectlist");
		model.addAttribute("list", list);
		System.out.println("list사이즈 : " + list.size());
		
		PagingDto pagemaker = new PagingDto();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(biz.listCount(company_city));
		
		//페이징 넘버 클릭 시 company_city를 보내줘야 하기 때문에 selectOne메소드로 조회 된 컬럼을 이용해서
		//jsp페이지에서 num.company_city 할 것. 정말 개같은 코드
		CompanyDto num = biz.selectCity(company_city);
		//셀렉원투를 만든다. 에이에스피에서 city를 받고, 해당 시티와 같은 시티를 가진 놈들을 반환한다..
		model.addAttribute("num", num);
		model.addAttribute("pagemaker", pagemaker);
		System.out.println("rowstart : " + cri.getRowStart() + " , rowend : " + cri.getRowEnd());
		
		return "city_detail";
	}

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
	
	@RequestMapping("company_detail.do")
	public String company_selectOne(int company_no, Model model) {
		
		System.out.println("company_selectOne");
		CompanyDto dto = biz.selectOne(company_no);
		model.addAttribute("dto", dto);
		return "company_detail";
	}

	

}
