package com.uni.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder; // 암호화
	
	// 로그인 페이지
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/login";
	}
	
	// 암호화 전 로그인
	/*@RequestMapping(value="login.do", method=RequestMethod.POST)
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
		
	}*/
	
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
				
		// 솔팅(salting)기법
		// 평문 + 랜덤값(솔트값) --> 암호화
		System.out.println("암호화전 : " + m.getUserPwd());
		
		// 암호화 작업
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		
		System.out.println("암호화후 : " + encPwd);
		
		m.setUserPwd(encPwd); // 암호화된 비밀번호를 Member 객체에 세팅
		
		memberService.insertMember(m); // 암호화 작업 한 비밀번호를 세팅한 객체를 보냄
		session.setAttribute("msg", "회원가입 성공");
		return "redirect:/";	
		
	}
	
	
	// 암호화 처리 후 로그인 부분
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMember(Member m, Model model) {
				
		Member loginUser;
			
				System.out.println("ID : " + m.getUserId());
				System.out.println("PWD : " + m.getUserPwd());
				String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd()); // 원래 비밀번호를 암호화 하여 encPwd 에 담는다.
				System.out.println("암호화 후 : " + encPwd);
				
				loginUser = memberService.loginMember(bCryptPasswordEncoder, m);
				System.out.println(loginUser);
				model.addAttribute("loginUser", loginUser);
				
		        
				return "redirect:/";			
		
	}
	
	// 마이페이지 이동
	@RequestMapping("myPage.do")
	public String mypage() {
		return "member/myPage";
	}
	
	// 마이페이지 수정으로 이동	
	@RequestMapping("myPageModify.do")
	public String myPageModify() {
		return "member/myPageModify";
	}	
}
