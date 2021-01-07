package com.finals.fogams.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.finals.fogams.model.biz.ReplyBiz;
import com.finals.fogams.model.biz.ReplyBizImpl;

@Controller
public class ReplyController {

	@Autowired
	private ReplyBiz biz = new ReplyBizImpl();
	
	
}
