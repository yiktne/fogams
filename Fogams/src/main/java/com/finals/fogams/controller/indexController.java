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
import com.finals.fogams.model.dto.Company_join_Company_infoDto;

@Controller
public class indexController {

	@Autowired
	private City_DetailBiz biz;

	@RequestMapping("/company_info.do")
	public String moveToCityDetail(Model model, String city) {
		List<Company_join_Company_infoDto> list = biz.selectlist(city);
		System.out.println("selectlist");
		model.addAttribute("list", list);

		System.out.println(list.size());

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

		}
		input.close();
	}

}
