package com.finals.fogams.controller;

import java.io.BufferedReader;
import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
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
import com.finals.fogams.model.biz.PlanBiz;
import com.finals.fogams.model.dto.BookmarkDto;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.Company_PriceDto;
import com.finals.fogams.model.dto.MemberDto;
import com.finals.fogams.model.dto.PlanDto;
import com.finals.fogams.model.dto.PlanListDto;
import com.finals.fogams.model.dto.TestBean;
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
	@Autowired
	private PlanBiz planbiz;
	

	private String recommendServerURL = "http://localhost:8585";
	
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

			addRecommendData(dto.getCompany_no(), dto.getCompany_city(), dto.getCompany_sort(), dto.getCompany_img());
			
			
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
		List<PlanListDto> planlist = planbiz.selectplan(member_no);
		model.addAttribute("member_no", member_no);
		model.addAttribute("list", list);
		model.addAttribute("booklist", booklist);
		model.addAttribute("planlist", planlist);
		
		
		return "mypage";
	}
	@RequestMapping("index.do")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("alllist.do")
	@ResponseBody public List<HashMap<String, String>> alllist() {
		
		List<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		
		List<CompanyDto> list = infobiz.selectList();
		
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, String> data = new HashMap<String, String>();
			
			data.put("id", list.get(i).getCompany_no() + "");
			data.put("city", list.get(i).getCompany_city());
			data.put("sort", list.get(i).getCompany_sort());
			data.put("url", list.get(i).getCompany_img());
			
			result.add(data);
		}
		
		return result;
	}
	
	private void addRecommendData(int no, String city, String sort, String imageURL) {
		try {
			URL url = new URL(recommendServerURL + "/add");

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestProperty("Accept", "application/json");
			con.setRequestMethod("POST");
			
			JSONObject params = new JSONObject();
			
			params.put("id", no);
			params.put("city", city);
			params.put("sort", sort);
			params.put("url", imageURL);

			OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
			wr.write(params.toString());
			wr.flush();
			
			StringBuilder sb = new StringBuilder();  
			int HttpResult = con.getResponseCode(); 
			if (HttpResult == HttpURLConnection.HTTP_OK) {
			    BufferedReader br = new BufferedReader(
			            new InputStreamReader(con.getInputStream(), "utf-8"));
			    String line = null;  
			    while ((line = br.readLine()) != null) {  
			        sb.append(line + "\n");  
			    }
			    br.close();
			    System.out.println("" + sb.toString());  
			} else {
			    System.out.println(con.getResponseMessage());  
			}  
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("plandetail.do")
	public String plandetail(HttpServletRequest request,int plan_no, int member_no, PlanDto dto, Model model) {
		MemberDto session = (MemberDto) request.getSession().getAttribute("memberDto");
		
		TestBean list = planbiz.testBean(plan_no);
		
		model.addAttribute("list", list);
		
		
		return "plandetail";
	}
	
	
	
	

}
