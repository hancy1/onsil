package com.uni.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	// 회원가입 폼
	@RequestMapping("enrollForm.do")
	public String enrollForm() {
		return "member/enrollForm";
	}
		
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		
		int count = memberService.idCheck(id);
		
		return String.valueOf(count);
	}
		
	// 회원가입
	@RequestMapping("insertMember.do")
	public String insertMember(@ModelAttribute Member m, HttpSession session) {
		
		memberService.insertMember(m);
		System.out.println(m);
		session.setAttribute("msg", "회원가입 성공");
		return "redirect:/";	
		
	}
}
