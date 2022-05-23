package com.uni.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.uni.spring.member.model.service.MemberService;
import com.uni.spring.member.model.service.MemberServiceImpl;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
		
	@Autowired 
	private MemberServiceImpl memberServiceImpl;
	
	
	// 로그인 페이지
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/login";
	}
}
