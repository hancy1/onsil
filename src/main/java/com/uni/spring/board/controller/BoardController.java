package com.uni.spring.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("boardList.do")
	public String boardList() {
		return "board/boardListView";
	}
}
