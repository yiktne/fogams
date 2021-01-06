package com.finals.fogams.controller;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.finals.fogams.common.util.FileValidator;
import com.finals.fogams.model.biz.Company_InfoBiz;
import com.finals.fogams.model.biz.Personal_menu_Biz;
import com.finals.fogams.model.dto.BookmarkDto;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.Company_PriceDto;
import com.finals.fogams.model.dto.MemberDto;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class CompanyInfoController {

	@Autowired
	private Company_InfoBiz infobiz;
	@Autowired
	private FileValidator fileValidator;
	@Autowired
	private Personal_menu_Biz biz;

	@RequestMapping("/form.do")
	public String list(HttpServletRequest request, Model model, int member_no) throws IOException {
		
//		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
//		int member_no =  session.getMember_no();
//		System.out.println("멤버번호 : "+member_no);
		model.addAttribute("member_no", member_no);
		return "upload";
	}

	
	// 업체정보 등록 + 업체이미지 등록
	@RequestMapping("/upload.do")
	public String insertres(Model model, HttpServletRequest request, String member_no, CompanyDto dto,
			BindingResult result) {

		System.out.println("Company insertres.do");

		// int member_no = session.getMember_no();
		dto.setMember_no(Integer.parseInt(member_no));

		// 업체 등급변경
		int updateGrade = infobiz.updateMemberGrade(Integer.parseInt(member_no));
		if (updateGrade > 0) {
			System.out.println("멤버 등급이 업체(2)로 변경되었습니다.");
		}

		// 업체 정보 등록
		int res = infobiz.insert(dto);
		if (res > 0) {
			MultipartFile file = dto.getUploadfile();
			String company_img = file.getOriginalFilename();

			//CompanyDto infoObj = new CompanyDto();
			dto.setCompany_img(company_img);

			InputStream inputStream = null;
			OutputStream outputStream = null;

			try {
				inputStream = file.getInputStream();
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");
				System.out.println("업로드 실제 경로 : " + path);

				File storage = new File(path);

				if (!storage.exists()) {
					storage.mkdir();
				}

				File newFile = new File(path + "/" + company_img);
				if (!newFile.exists()) {
					newFile.createNewFile();
				}
				outputStream = new FileOutputStream(newFile);

				int read = 0;
				byte[] b = new byte[(int) file.getSize()];

				while ((read = inputStream.read(b)) != -1) {
					outputStream.write(b, 0, read);
				}

			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					inputStream.close();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			
			int company_no = dto.getCompany_no();
			System.out.println("회사번호 : " + company_no);
			model.addAttribute("company_no", company_no);

			return "addCompany_menu";
		} else
			return "redirect:company_insertform";
	}
	
	//업체 메뉴, 가격 정보 등록
	@RequestMapping("/addCompany_menu.do")
	@ResponseBody
	public int addMenu(@RequestBody List<Company_PriceDto> list) {
		System.out.println("addMenu");
		
	    int res = infobiz.insertCom_menu(list);
	    
	    if(res>0) {
	    	System.out.println("insert com menu 성공");
	    	return 0;
	    }else {
	    	System.out.println("insert com menu 실패");
	    }
		
		return 3;
	}
	
	@RequestMapping("mylist.do")
	public String mylist(HttpServletRequest request, Model model, int member_no) {
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");

		List<CompanyDto> list = infobiz.myList(member_no);
		List<BookmarkDto> booklist = biz.bookMarkList(member_no);

		model.addAttribute("member_no", member_no);
		model.addAttribute("list", list);
		model.addAttribute("booklist", booklist);
		return "mypage";
	}
	@RequestMapping("index.do")
	public String index() {
		
		return "index";
	}
	

}
