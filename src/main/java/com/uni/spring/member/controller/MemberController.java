package com.uni.spring.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.help.HelpPagination;
import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.Notice;
import com.uni.spring.help.model.dto.PageInfo;
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
	public String logout(SessionStatus status, HttpSession session) {
		status.setComplete();
		
		//by 채영 ---------------------------
		session.removeAttribute("hostUser");
		//----------------------------------	
		
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
	
	// 마이페이지 회원정보 수정
	@RequestMapping("updateMember.do")
	public String updateMember(@ModelAttribute Member m, Model model) throws Exception {
		
		// 솔팅(salting)기법
		// 평문 + 랜덤값(솔트값) --> 암호화
		System.out.println("암호화전 : " + m.getUserPwd());
		
		// 암호화 작업
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		
		System.out.println("암호화후 : " + encPwd);
		
		m.setUserPwd(encPwd); // 암호화된 비밀번호를 Member 객체에 세팅
		
		Member userInfo = memberService.updateMember(m);
		model.addAttribute("loginUser", userInfo);
		
		return "member/myPage";
	}
	
	// 탈퇴페이지로 이동	
	@RequestMapping("leavePage.do")
	public String leavePage() {
		return "member/leavePage";
	}	
	
	// 탈퇴 전 비밀번호 일치 여부 확인 ajax 
	@ResponseBody
	@RequestMapping("checkPwd.do")
	public boolean checkPwd(HttpSession session, @RequestParam("inputPwd") String inputPwd) {
		
		Member m = (Member) session.getAttribute("loginUser");		
		String userPwd = m.getUserPwd();
		
		if(bCryptPasswordEncoder.matches(inputPwd, userPwd)) {
			return true;
		}else {
			return false;
		}	
	}
	
	// 탈퇴하기
	@RequestMapping("deleteMember.do")
	public String deleteMember(HttpSession session) {
		
		Member m = (Member) session.getAttribute("loginUser");		
		String userId = m.getUserId();
		
		memberService.deleteMember(userId);	
		session.setAttribute("msg", "다음에 또 만나요!");
		return "redirect:logout.do";		
		
	}
	
	// 관리자 - 회원관리
	@RequestMapping("adminMember.do")
	public String selectAdminMemberList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = memberService.selectAdminMemberListCount(); // 상태 Y,N 상관없이 다 구하기
		
		
		PageInfo pi = HelpPagination.getPageInfo(listCount, currentPage, 10, 10); // 페이지 갯수 : 10 개, 한 페이지에 게시물 갯수 : 5개
		
		ArrayList<Member> list = memberService.selectAdminMemberList(pi); // 페이지 정보를 가지고 넘어가기
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		
		return "member/adminMemberListView";
	}
	
	// 관리자 - 회원관리 디테일 뷰
	@RequestMapping("adminMemberDetail.do")
	public ModelAndView selectAdminMember(int mno, ModelAndView mv) {
						
		mv.addObject("m", memberService.selectAdminMember(mno)).setViewName("member/adminMemberDetailView");		
		
		return mv;		
	}
	
	// 관리자 - 회원관리 강퇴
	@RequestMapping("deleteAdminMember.do")
	public String deleteAdminMember(int mno) {		
		
		memberService.deleteAdminMember(mno);
		
		return "redirect:adminMember.do";
	}
		
	// 관리자 - 회원관리 복구
	@RequestMapping("updateAdminMember.do")
	public ModelAndView updateAdminMember(int mno, ModelAndView mv) {	
		
		memberService.updateAdminMember(mno);
		
		mv.addObject("mno", mno).setViewName("redirect:adminMemberDetail.do");
		return mv;
	}
}
