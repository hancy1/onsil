package com.uni.spring.help.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.uni.spring.help.model.service.HelpService;
import com.uni.spring.help.model.service.HelpServiceImpl;
import com.uni.spring.member.model.service.MemberService;
import com.uni.spring.member.model.service.MemberServiceImpl;

@Controller
public class HelpController {

	@Autowired
	private HelpService helpService;
		
	@Autowired 
	private HelpServiceImpl helpServiceImpl;
}
