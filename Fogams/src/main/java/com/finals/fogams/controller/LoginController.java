package com.finals.fogams.controller;

import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	// biz 추가
	
	@Autowired
	private JavaMailSender mailSender;
	
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
		
		// 현재 biz가 없어 구현 불가능, 천천히 구현
		result.put("result", true);
		
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
		
		result.put("cert", cert);
		
		return result;
	}
}
