package com.finals.fogams.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.finals.fogams.model.biz.City_DetailBiz;
import com.finals.fogams.model.biz.ReplyBiz;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.MemberDto;
import com.finals.fogams.model.dto.Company_PriceDto;
import com.finals.fogams.model.dto.ReplyDto;

@Controller
public class indexController {

	@Autowired
	private City_DetailBiz biz;
	@Autowired
	private ReplyBiz replybiz;

	private String recommendServerURL = "http://localhost:8585";
	
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
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		
		//MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		//int member_no = session.getMember_no();
		System.out.println("company_selectOne");
		CompanyDto dto = biz.selectOne(company_no);
		//model.addAttribute("member_no", member_no);
		model.addAttribute("dto", dto);
		model.addAttribute("session", session);

		model.addAttribute("recommend", getRecommendList(dto));
		
		//업체 메뉴 정보 보여주기
		List<Company_PriceDto> list = biz.showCom_menu(company_no);
		System.out.println("업체 이름ㅣ"+list.get(0).getCompany_money());
		model.addAttribute("list", list);
		
		return "company_detail";
	}
	
	
	
	@RequestMapping("company_updateform.do")
	public String company_updateform(Model model, int company_no,int member_no , HttpServletRequest request) {
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		
		System.out.println(member_no);
		
		
		if(member_no == session.getMember_no()) {
			model.addAttribute("dto", biz.selectOne(company_no));
			return "company_updateform";
		}else {
			return "redirect:company_info.do";
		}

		
		
		
		
		
	}
	
	
	
	@RequestMapping("company_updateres.do")
	public String company_updateres(HttpServletRequest request, CompanyDto dto, int company_no, int member_no) {
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");

		int res = biz.update(dto);
		if(res > 0 && member_no == session.getMember_no()) {
			return "redirect:company_detail.do?company_no="+company_no;
		}else {
			return "redirect:company_updateform.do?company_no="+company_no;
		}
		
	}
	
	@RequestMapping("company_delete.do")
	public String company_delete(HttpServletRequest request,int company_no, int member_no) {
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		System.out.println("company_no : " + company_no );
		System.out.println("member_no : " + member_no);
		CompanyDto dto = new CompanyDto();
		dto.setCompany_no(company_no);
		dto.setMember_no(member_no);
		int res = biz.delete(dto);
		if(res > 0 && member_no == session.getMember_no()) {
			
			
			return "redirect:company_info.do";
		}else {
			return "redirect:company_delete.do";
		}
		
	}
	
	private List<CompanyDto> getRecommendList(CompanyDto dto) {

		List<CompanyDto> result = new ArrayList<CompanyDto>();
		
		try {
			String path = recommendServerURL + "/get/" + dto.getCompany_no() + "/" + URLEncoder.encode(dto.getCompany_city(), "UTF-8") + "/" + URLEncoder.encode(dto.getCompany_sort(), "UTF-8");
			
			URL url = new URL(path);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			
			int resCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream())); 
			String inputLine; 
			StringBuffer response = new StringBuffer(); 
			
			while ((inputLine = in.readLine()) != null) { 
				response.append(inputLine); 
			} 
			
			in.close(); 
			
			JSONParser parser = new JSONParser();
			
			JSONObject obj = (JSONObject) parser.parse(response.toString());
			
			JSONArray data = (JSONArray) obj.get("id");
			
			for(int i = 0; i < data.size(); i++) {
				result.add(biz.selectOne(Integer.parseInt((String)data.get(i))));
			}
			
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
