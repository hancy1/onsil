package com.uni.spring.ticket.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.uni.spring.ticket.ticketPagination;
import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.Ticket;
import com.uni.spring.ticket.model.service.ReviewBoardService;


@Controller
public class ReviewBoardController {

	
	@Autowired
	public ReviewBoardService reviewBoard;
	
	//후기게시판게시판
	@RequestMapping("reviewBoard.do")
	public String selectRBList(@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,Model model) {
		
		int listCount = reviewBoard.selectRBListCount();
         System.out.println(listCount);
		
		PageInfo pi = ticketPagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Ticket> list = reviewBoard.selectListCount(pi);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "Ticket/rboardListView";
	}
	
	//후기글쓰기화면
	@RequestMapping("enrollRBoard.do")
	public String enrollForm() {
		return "Ticket/rboardEnrollForm";
		
	}
	
}
