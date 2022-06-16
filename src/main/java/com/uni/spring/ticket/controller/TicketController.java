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
	
	//티켓리스트화면
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
	
	//티켓등록화면
	@RequestMapping("enrollTicket.do")
	public String enrollForm() {
		return "Ticket/TicketEnrollForm";
		
	}
	
	//주소검색
	@RequestMapping("ticketAddress.do")
	public String Address() {
		return "Ticket/TicketAddress";
		
	}
	
	//티켓등록하기
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
	

	//제품 디테일페이지 연결
	@RequestMapping("detailTicket.do")
	public ModelAndView selectBoard(int bno,ModelAndView mv) {
		
		//System.out.println("디테일 ticketNo : " + bno);
		Ticket t = ticketService.selectTicket(bno);
		
		mv.addObject("t",t).setViewName("Ticket/ticketDetailView");
		
		return mv;
		
	}
	
	//티켓 수정 연결
	@RequestMapping("updateFormTicket.do")
	public ModelAndView updateForm(int bno,ModelAndView mv) {
		mv.addObject("t",ticketService.selectTicket(bno))
		.setViewName("Ticket/ticketUpdateForm");
		
		return mv;
	}
	
	//티켓 수정
	@RequestMapping("updateTicket.do")
	public ModelAndView updateBoard(Ticket t,ModelAndView mv,HttpServletRequest request,
			                          @RequestParam(name = "reUploadFile",required=false)MultipartFile file) {
										
		/*
		 * 1. 기존의 첨부파일 X, 새로 첨부된 파일 X 	
		 * 	  --> originName : null, changeName : null
		 * 
		 * 2. 기존의 첨부파일 X, 새로 첨부된 파일 O		
		 * 	  --> 서버에 업로드 후 
		 * 	  --> originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
		 * 
		 * 3. 기존의 첨부파일 O, 새로 첨부된 파일 X		
		 * 	  --> originName : 기존첨부파일원본명, changeName : 기존첨부파일수정명
		 * 
		 * 4. 기존의 첨부파일 O, 새로 첨부된 파일 O  
		 * 	  --> 서버에 업로드 후	
		 * 	  --> originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
		 */
		
		String orgChangeName =t.getChangeName();
		if(!file.getOriginalFilename().equals("")) {
			/*if(b.getChangeName() != null) {
				
				deleteFile(orgChangeName,request);
			}*/
			
			//다시 세팅해주기! 기존파일 없는 경우도 세팅해야됨!
			String chageName = saveFile(file,request);
			
			t.setOriginName(file.getOriginalFilename());
			t.setChangeName(chageName);
		}
		ticketService.updateTicket(t);
		
		if(orgChangeName != null) {//기존의 파일이 있는 경우 --- >서버에 업로드 된 기존 파일 삭제
			deleteFile(orgChangeName,request);
		}
		mv.addObject("bno",t.getTicketNo()).setViewName("redirect:detailTicket.do");
		return mv;
	}

	//티켓첨부파일 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {
		
	String resources = request.getSession().getServletContext().getRealPath("resources");//웹 컨테이너 에서의 RESOURCES폴더까지의 경로
		
		
		String savePath =resources+"\\T_upload_files\\";
		
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();
		
	}
	
	//티켓삭제
	@RequestMapping("deleteTicket.do")
	public String deleteBoard(int bno,String fileName,HttpServletRequest request) {
		
		ticketService.deleteTicket(bno);
		
		if(!fileName.equals("")) {
			deleteFile(fileName,request);
		}
		return "redirect:listTicket.do";
		
	}
	
	
	// 전시회 페이지연결 
		@RequestMapping("exhibition.do")
		public String selectShopList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
			
			
			
			int listCount = ticketService.exhibitionListCount();
			
			
			PageInfo pi = ticketPagination.getPageInfo(listCount, currentPage, 10, 5);
			
			ArrayList<Ticket> list = ticketService.selectExhibitionList(pi);
			
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			
			
			
			return "Ticket/ExhibitionMain";
		}
		
		//티켓 디테일페이지 연결
		@RequestMapping("detailExhibition.do")
		public ModelAndView selectExhibition(int ticketNo,ModelAndView mv) {
			
			
			Ticket t = ticketService.selectExhibition(ticketNo);
			
			mv.addObject("t",t).setViewName("Ticket/ExhibitionDetail");
			
			return mv;
			
		}
			
		
}
