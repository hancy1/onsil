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
import com.uni.spring.ticket.model.service.TicketService;

@Controller
public class TicketController {
	
	@Autowired
	public TicketService ticketService;
	
	
	@RequestMapping("listTicket.do")
	public String selectList(@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,Model model) {
		
		int listCount = ticketService.selectListCount();
         System.out.println(listCount);
		
		PageInfo pi = ticketPagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Ticket> list = ticketService.selectListCount(pi);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "Ticket/ticket2";
	}

}
