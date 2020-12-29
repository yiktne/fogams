package com.finals.fogams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
	
	@RequestMapping("reviewinsert.do")
	public String reviewList() {
		
		
		return "reviewInsert";
	}

	@RequestMapping("reviewOne.do")
	public String reviewOne() {
		
		
		return "reviewOne";
	}
}
