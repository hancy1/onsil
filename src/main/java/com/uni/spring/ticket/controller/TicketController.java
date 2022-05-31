package com.uni.spring.ticket.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.common.exception.CommException;
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
	
	@RequestMapping("enrollTicket.do")
	public String enrollForm() {
		return "Ticket/TicketEnrollForm";
		
	}
	
	@RequestMapping("ticketAddress.do")
	public String Address() {
		return "Ticket/TicketAddress";
		
	}
	
	@RequestMapping("insertTicket.do")
	public String insertTicket(Ticket t,HttpServletRequest request,@RequestParam(name="uploadFile",required=false)MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {//전달받은 파일이 없으면 빈문자열
	         
	         String changeName = saveFile(file,request);
	         
	         if(changeName != null) {
	            t.setOriginName(file.getOriginalFilename());
	            t.setChangeName(changeName);
	         }
	      }
		
		ticketService.insertTicket(t);
		
		return "redirect:listTicket.do";
	}

	//전달 받은 파일을 업로드 시킨후 수정된 파일명을 리턴하는 역할
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		
		System.out.println(resources);
		String savePath =resources+"\\T_upload_files\\";
		
		
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //년월일시분초
		
		//확장자 잘라오기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		
		
		System.out.println(savePath);

		//시스템파일명생성
		String chageName = currentTime +ext;
		
		try {
			file.transferTo(new File(savePath + chageName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file Upload error");
		}
		
		return chageName;
	}
	

	@RequestMapping("detailTicket.do")
	public ModelAndView selectBoard(int bno,ModelAndView mv) {
		
		Ticket t = ticketService.selectTicket(bno);
		
		mv.addObject("t",t).setViewName("Ticket/ticketDetailView");
		
		return mv;
		
	}
}
