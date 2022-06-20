package com.uni.spring.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.uni.spring")
public class CommonExceptionHandler {

	@ExceptionHandler(value = Exception.class)
	public ModelAndView controllerExceptionHandler(Exception e) {
		
		e.printStackTrace();
		
		if(e.getMessage().equals("아이디와 암호가 올바르지 않습니다.")) {
			return new ModelAndView("member/login").addObject("msg",e.getMessage());
		}
		
		if(e.getMessage().equals("존재하지 않는 아이디 입니다.")) {
			return new ModelAndView("main").addObject("msg",e.getMessage());
		}
		
		return new ModelAndView("common/errorPage").addObject("msg",e.getMessage());
	}
	
}
