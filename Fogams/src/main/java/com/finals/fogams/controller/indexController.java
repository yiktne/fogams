package com.finals.fogams.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finals.fogams.model.biz.City_DetailBiz;

@Controller
public class indexController {
	
	//company_info 테이블에서 정보 가져오기
	
	@Autowired
	private City_DetailBiz biz;
	
	//@RequestMapping("/company_info.do")
	//값을 보낼 땐 model객체가 필요하다.

	
	
}
