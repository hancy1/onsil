package com.uni.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.uni.spring.member.model.dto.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(loginUser == null) {
				
			session.setAttribute("msg", "로그인 후 이용하세요");
			response.sendRedirect("/spring");
			return false;
		}
		return true;
	}

	
	
}
