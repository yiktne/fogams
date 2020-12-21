package com.finals.fogams.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.finals.fogams.common.util.FileValidator;
import com.finals.fogams.model.biz.CompanyBiz;
import com.finals.fogams.model.biz.CompanyBizImpl;
import com.finals.fogams.model.biz.Company_InfoBiz;
import com.finals.fogams.model.biz.Company_InfoBizImpl;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.MemberDto;

@Controller
public class CompanyInfoController {

	@Autowired
	private CompanyBiz companybiz;
	@Autowired
	private Company_InfoBiz infobiz;
	@Autowired
	private FileValidator fileValidator;
	
	
	@RequestMapping("/form.do")
	public String list(HttpServletRequest request, Model model) {
		MemberDto session = (MemberDto) request.getSession();
		//int member_no = session.getMember_no();
		//model.addAttribute("member_no", member_no);
		System.out.println(session.getMember_id());
		return "upload";
	}
	

	@RequestMapping("/upload.do")
	public String insertres(Model model, HttpServletRequest request, int member_no, CompanyDto dto, BindingResult result) {

		System.out.println("Company insertres.do");
		System.out.println(dto.getCompany_city());
		System.out.println(dto.getCompany_addr());
		
		MemberDto member = new MemberDto();
		//int member_no = session.getMember_no();
		dto.setMember_no(member_no);
		
		//업체 등급변경
		int updateGrade = infobiz.updateMemberGrade(member_no);
		if(updateGrade > 0) {
			System.out.println("멤버 등급이 업체(2)로 변경되었습니다. 멤버등급 : " + member.getMember_grade());
		}
		
		//업체 정보 등록
		int res = infobiz.insert(dto);
		if (res > 0) {
			MultipartFile file = dto.getUploadfile();
			String company_img = file.getOriginalFilename();

			CompanyDto infoObj = new CompanyDto();
			infoObj.setCompany_img(company_img);

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

			model.addAttribute("infoObj", infoObj);

			return "redirect:company_list.do";
		} else
			return "redirect:company_insertform";


	}

}

