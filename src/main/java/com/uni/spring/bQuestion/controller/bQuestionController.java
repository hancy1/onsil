package com.uni.spring.bQuestion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class bQuestionController {

	@RequestMapping("bQuestionList.do")
	public String boardList() {
		
		return "bQuestion/bQuestionListView";
	}
}
