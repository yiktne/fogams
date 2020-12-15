package com.finals.fogams.controller;

import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finals.fogams.model.biz.MemberBiz;
import com.finals.fogams.model.dto.MemberDto;

@Controller
public class LoginController {

	@Autowired
	private MemberBiz biz;
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("loginform.do")
	public String loginForm() {
		return "login";
	}

	@RequestMapping("/registerform.do")
	public String registerForm() {
		return "register";
	}
	
	@RequestMapping("/checkIdOverlap.do")
	@ResponseBody
	public HashMap<String, Boolean> checkIdOverlap(String id) {
		HashMap<String, Boolean> result = new HashMap<String, Boolean>();
		
		if(biz.checkID(id)) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		
		return result;
	}
	
	@RequestMapping(path="/sendCert.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> sendCertMail(@RequestBody HashMap<String, String> body) {
		HashMap<String, String> result = new HashMap<String, String>();
		
		String cert = "";
		
		Random rand = new Random();
		
		for(int i = 0; i < 6; i++) {
			cert += rand.nextInt(10);
		}
		
		// 이메일 전송 코드, 사용되는 것은 확인하였으나 귀찮음으로 인해 막아둠
		// 다시 사용할 때에는 비동기도 추가하기
		/*
		String setfrom = "Fogams";
		String tomail = body.get("mail");
		String title = "[Fogams] 이메일 인증 번호입니다.";
		String content = "인증번호는 " + cert + " 입니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			mailSender.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		*/
		
		result.put("cert", cert);
		
		return result;
	}
	
	@RequestMapping(path="/register.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> register(@RequestBody HashMap<String, String> body) {
		
		HashMap<String, Boolean> result = new HashMap<String, Boolean>();
		
		// Spring Security 이용해서 비밀번호 암호화
		String password = passwordEncoder.encode(body.get("member_pw"));
		
		// DB 적용
		MemberDto dto = new MemberDto();
		
		dto.setMember_id(body.get("member_id"));
		dto.setMember_pw(password);
		dto.setMember_name(body.get("member_name"));
		dto.setMember_email(body.get("member_email"));
		dto.setMember_grade(1);
		
		if(biz.register(dto) > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}
	
	@RequestMapping(path="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> login(@RequestBody HashMap<String, String> body, HttpServletRequest request) {
		
		HashMap<String, Boolean> result = new HashMap<String, Boolean>();
		
		// DB 가져오기
		MemberDto dto = biz.login(body.get("member_id"));
		
		// 비밀번호 체크
		if(dto != null) {

			if(passwordEncoder.matches(body.get("member_pw"), dto.getMember_pw())) {
				// session 적용
				HttpSession session = request.getSession();
				session.setAttribute("memberDto", dto);
				
				result.put("result", true);
			}
		}
		
		if(!result.containsKey("result")) {
			result.put("result", false);
		}
		
		return result;
	}
	
	@RequestMapping(path="/logout.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> logout(HttpServletRequest request) {
		
		HashMap<String, Boolean> result = new HashMap<String, Boolean>();
		
		HttpSession session = request.getSession();
		session.setAttribute("memberDto", null);
		
		result.put("result", true);
		return result;
	}
	
}
