package com.uni.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.uni.spring.member.model.dto.Member;
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
	
	// 암호화 전 로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMember(Member m, Model model) {
		
		Member loginUser;
		
		try {
			loginUser = memberService.loginMember(m);
			System.out.println("loginUser : " + loginUser); // loginUser 확인
			model.addAttribute("loginUser", loginUser);
			return "redirect:/";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "로그인 실패");
			return "common/errorPage";
		}
		
	}
}
