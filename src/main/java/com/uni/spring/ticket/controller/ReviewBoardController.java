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
import com.uni.spring.ticket.model.dto.RBoard;
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
	
	//후기게시판 등록하기
		@RequestMapping("inserRBoard.do")
		public String inserRBoard(RBoard rb,HttpServletRequest request,@RequestParam(name="uploadFile",required=false)MultipartFile file) {
			if(!file.getOriginalFilename().equals("")) {//전달받은 파일이 없으면 빈문자열
		         
		         String changeName = saveFile(file,request);
		         
		         if(changeName != null) {
		            rb.setOriginName(file.getOriginalFilename());
		            rb.setChangeName(changeName);
		         }
		      }
			
			reviewBoard.insertRBoard(rb);
			
			return "redirect:reviewBoard.do";
		}

		//전달 받은 파일을 업로드 시킨후 수정된 파일명을 리턴하는 역할
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources"); 
			
			System.out.println(resources);
			String savePath =resources+"\\RB_upload_files\\";
			
			
			
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
		
		//후기게시판 디테일페이지 연결
		@RequestMapping("detailRBoard.do")
		public ModelAndView selectBoard(int bno,ModelAndView mv) {
			
		
			RBoard rb = reviewBoard.selectRBoard(bno);
			
			mv.addObject("rb",rb).setViewName("Ticket/rboardDetailView");
			
			return mv;
			
		}
		
	
}
