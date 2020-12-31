package com.finals.fogams.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

@Controller
public class ReviewController {

	@RequestMapping("reviewone.do")
	public String ReviewOne() {
		
		return "reviewOne";
	}
	// 다중파일업로드
	@RequestMapping("image.do")
	public String requestupload(MultipartHttpServletRequest mtfRequest) throws FileNotFoundException {
		
	List<MultipartFile> fileList = mtfRequest.getFiles("file");
	String src = mtfRequest.getParameter("src");
	System.out.println("src value : " + src);
	
	String path = WebUtils.getRealPath(mtfRequest.getSession().getServletContext(), "/resources/storage");
	
	for(MultipartFile mf : fileList) {
		String originFileName = mf.getOriginalFilename();
		long fileSize = mf.getSize();
		
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);
		
		String safeFile = path + System.currentTimeMillis() + originFileName;
		
		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}
		return "redirect:asdasd.do";
	}
	
}
