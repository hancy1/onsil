package com.uni.spring.ticket.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.help.model.dto.Answer;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.ticket.ticketPagination;
import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.RBLike;
import com.uni.spring.ticket.model.dto.RBReply;
import com.uni.spring.ticket.model.dto.RBoard;
import com.uni.spring.ticket.model.dto.Ticket;
import com.uni.spring.ticket.model.service.ReviewBoardService;

@Controller
public class ReviewBoardController {

	@Autowired
	public ReviewBoardService reviewBoard;

	// 후기게시판게시판
	@RequestMapping("reviewBoard.do")
	public String selectRBList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		int listCount = reviewBoard.selectRBListCount();
		System.out.println(listCount);

		PageInfo pi = ticketPagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Ticket> list = reviewBoard.selectListCount(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "Ticket/rboardListView";
	}

	// 후기글쓰기화면
	@RequestMapping("enrollRBoard.do")
	public String enrollForm() {
		return "Ticket/rboardEnrollForm";

	}

	// 후기게시판 등록하기
	@RequestMapping("inserRBoard.do")
	public String inserRBoard(RBoard rb, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {
		if (!file.getOriginalFilename().equals("")) {// 전달받은 파일이 없으면 빈문자열

			String changeName = saveFile(file, request);

			if (changeName != null) {
				rb.setOriginName(file.getOriginalFilename());
				rb.setChangeName(changeName);
			}
		}

		reviewBoard.insertRBoard(rb);

		return "redirect:reviewBoard.do";
	}

	// 전달 받은 파일을 업로드 시킨후 수정된 파일명을 리턴하는 역할
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");

		System.out.println(resources);
		String savePath = resources + "\\RB_upload_files\\";

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 년월일시분초

		// 확장자 잘라오기
		String ext = originName.substring(originName.lastIndexOf("."));

		System.out.println(savePath);

		// 시스템파일명생성
		String chageName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + chageName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file Upload error");
		}

		return chageName;
	}

	// 후기게시판 디테일페이지 연결
	@RequestMapping("detailRBoard.do")
	public ModelAndView selectBoard(int bno, ModelAndView mv, HttpSession session, Model model) {

		RBoard rb = reviewBoard.selectRBoard(bno);

		int userNo = Integer.parseInt(((Member) session.getAttribute("loginUser")).getUserNo());

		mv.addObject("rb", rb).setViewName("Ticket/rboardDetailView");

		RBLike heart = new RBLike();
		// 좋아요가 되있는지 게시글번호와 회원번호를 보냄.
		heart = reviewBoard.findHeart(bno, userNo);

		// 찾은 정보를 heart로 담아서 보냄
		model.addAttribute("heart", heart);
		// ((Model) mv).addAttribute("heart",heart);

		return mv;

	}

	// 게시판 수정 연결
	@RequestMapping("updateFormRBoard.do")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		mv.addObject("rb", reviewBoard.selectRborad(bno)).setViewName("Ticket/rboardUpdateForm");

		return mv;
	}

	// 후기게시판 수정
	@RequestMapping("updateRBoard.do")
	public ModelAndView updateBoard(RBoard rb, ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "reUploadFile", required = false) MultipartFile file) {

		/*
		 * 1. 기존의 첨부파일 X, 새로 첨부된 파일 X --> originName : null, changeName : null
		 * 
		 * 2. 기존의 첨부파일 X, 새로 첨부된 파일 O --> 서버에 업로드 후 --> originName : 새로첨부된파일원본명,
		 * changeName : 새로첨부된파일수정명
		 * 
		 * 3. 기존의 첨부파일 O, 새로 첨부된 파일 X --> originName : 기존첨부파일원본명, changeName : 기존첨부파일수정명
		 * 
		 * 4. 기존의 첨부파일 O, 새로 첨부된 파일 O --> 서버에 업로드 후 --> originName : 새로첨부된파일원본명,
		 * changeName : 새로첨부된파일수정명
		 */

		String orgChangeName = rb.getChangeName();
		if (!file.getOriginalFilename().equals("")) {
			/*
			 * if(b.getChangeName() != null) {
			 * 
			 * deleteFile(orgChangeName,request); }
			 */

			// 다시 세팅해주기! 기존파일 없는 경우도 세팅해야됨!
			String chageName = saveFile(file, request);

			rb.setOriginName(file.getOriginalFilename());
			rb.setChangeName(chageName);
		}
		reviewBoard.updateRBoard(rb);

		if (orgChangeName != null) {// 기존의 파일이 있는 경우 --- >서버에 업로드 된 기존 파일 삭제
			deleteFile(orgChangeName, request);
		}
		mv.addObject("bno", rb.getRbNo()).setViewName("redirect:detailRBoard.do");
		return mv;
	}

	// 티켓첨부파일 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");// 웹 컨테이너 에서의
																								// RESOURCES폴더까지의 경로

		String savePath = resources + "\\RB_upload_files\\";

		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();

	}
	
	
    //게시글 삭제하기
	@RequestMapping("deleteRBoard.do")
	public String deleteRBoard(int bno, String fileName, HttpServletRequest request) {

		reviewBoard.deleteRBoard(bno);

		if (!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		return "redirect:reviewBoard.do";

	}

	// 좋아요
	@RequestMapping(value = "heart", method = RequestMethod.POST)
	public @ResponseBody int heart(@ModelAttribute RBLike heart) {
		int result = reviewBoard.insertHeart(heart);
		return result;
	}

	// 후기게시판 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "rblist.do", produces = "application/json; charset=utf-8")
	public String selectReplyList(int bno) {

		ArrayList<RBReply> list = reviewBoard.selectReplyList(bno);

		System.out.println(list);

		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	//후기게시판 댓글 등록
	@ResponseBody 
	@RequestMapping(value = "rbinsert.do")
	public String insertReply(RBReply r) {
		
		int result = reviewBoard.insertReply(r);
		
		return String.valueOf(result);
	}
	

}
