package com.uni.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.uni.spring.board.BoardPagination;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.board.model.dto.Reply;
import com.uni.spring.board.model.service.BoardService;
import com.uni.spring.common.exception.CommException;

@Controller
public class BoardController {
	
	@Autowired
	public BoardService boardService;
	
	// 게시판 목록
	@GetMapping("boardList.do")
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		// @RequestParam(value="currentPage") int currentPage --> 값이 넘어오지 않아서(값을 주입할 수 없기 때문에) 에러
	    // @RequestParam(value="currentPage", required = false) int currentPage
	      
	    // required : 해당 파라미터가 필수인지 여부 (true 면 필수)
	    // required = false 값을 꼭 받아줄 필요가 없다고 선언. 그래서 null 이 들어올 수 있다.
	    // --> null 은 기본형 int 에 들어갈 수 없기 때문에 에러발생
	       
	    // @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage
	    // defaultValue : 넘어오는 값이 null 인 경우에 해당 파라미터 기본 값 지정
	      
	    int listCount = boardService.selectListCount(); // 조회수
	      
	    PageInfo pi = BoardPagination.getPageInfo(listCount, currentPage, 10, 10); // 페이지 번호 10개씩, 게시글 10개씩 출력
	      
	    ArrayList<Board> list = boardService.selectList(pi);
	    //System.out.println(list.get(0));	게시판 목록 넘어오는지 확인
	      
	    model.addAttribute("list", list);
	    model.addAttribute("pi", pi);
	      
	    return "board/boardListView";
	}
	
	// 게시판 상세보기
	@RequestMapping("detailBoard.do")
	public ModelAndView selectboard(int bno, ModelAndView mv, Board b) {
		   
		b = boardService.selectBoard(bno);
		b.setBNo(bno);		// 객체에 글번호 + 게시글 정보 담기
		
		mv.addObject("b", b).setViewName("board/boardDetail");
		//System.out.println("게시글 상세보기 객체 확인용 : " + b);   
		
		return mv;		   
	}
	
	// 게시판 작성하기 폼으로 이동
	@RequestMapping("enrollBoard.do")
	public String enrollForm() {
		   
		return "board/boardEnroll";
	}
	
	// 게시글 작성하기
	@RequestMapping("insertBoard.do")
	public String insertBoard(@RequestParam(name="uploadFile", required = false) 
								MultipartFile file, Board b, HttpServletRequest request) {

	   //System.out.println(file.getOriginalFilename());	// 저장한 파일 기존 이름
	   
	   if(!file.getOriginalFilename().equals("")) {			// 전달받은 파일이 없으면 빈 문자열
	   
	   String changeName = saveFile(file, request);			// 메소드 생성해 줌
	   
	   if(changeName != null) {
	        b.setBOriginName(file.getOriginalFilename());
	        b.setBChangeName(changeName);
	     }
	  } 
	  
	  boardService.insertBoard(b);   
	  //System.out.println("글 작성후 객체 생성 확인 : " + b);
	  
	  return "redirect:boardList.do"; //글 작성하면 게시글 목록으로
		   
	}

	//전달받은 파일을 업로드 시킨 후 수정된 파일명 리턴하는 역할
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");	
		System.out.println(resources);					//웹컨테이너에서의 resources 폴더 경로 추출
   
		String savePath = resources + "\\b_upload_files\\"; //b_uplaod_files 안에 넣음

		String originName = file.getOriginalFilename();
   
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //년 월 일시 분 초
   
		String ext = originName.substring(originName.lastIndexOf("."));
		System.out.println(savePath);
   
		String changeName = currentTime + ext;
   
		try {	//transferTo : 메소드에서 인풋스트림 아웃품스트림을 사용하는데 그거를 알아서 닫아줘서 전처럼 close처리 안해도 됨
			file.transferTo(new File(savePath + changeName));	
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			throw new CommException("file Upload error");
		}
		
		return changeName;
	}
	
	// 게시글 삭제하기
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(int bno, String fileName, HttpServletRequest request) {
		   
		boardService.deleteBoard(bno);
		//System.out.println("삭제하기 글번호 확인 : " + bno);
		   
		if(!fileName.equals("")) { 				// 파일이 첨부됐다면
			deleteFile(fileName, request); 		// 파일 삭제
		}
		   
		return "redirect:boardList.do";			// 삭제하면 게시글 목록으로 		   
	}

	// 게시글에 같이 첨부된 파일 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");	

		String savePath = resources + "\\b_upload_files\\";
		   
		File deleteFile = new File(savePath + fileName);
		
		deleteFile.delete();	
	}
	
	// 게시글 수정 폼 이동
	@RequestMapping("updateForm.do")		
	public String updateForm(int bno, Model model) {	// bno , model(값을 담아서 이동)
								//새로 조회해야해서 bno만 가져옴 		
		Board b = boardService.selectBoard(bno);
		// System.out.println("수정하기 폼 : "+ bno);

		model.addAttribute("b", b); //객체 b를 model에 추가해서 넘김

		return "board/boardUpdate";
	}

	// 게시글 수정
	@RequestMapping("updateBoard.do")
	public String updateBoard(Board b, HttpServletRequest request, Model model,
							@RequestParam(name = "reUploadFile", required = false) MultipartFile file) {
		
		//System.out.println(b);							// 수정할 정보 넘어가는지 확인
		//System.out.println(b.getBNo());
		String orgfile = b.getBChangeName();				// 기존에 저장된 파일명
		
		// 새로 추가할 첨부 파일이 있는 경우
		if(!file.getOriginalFilename().equals("")) {		
			
			String changeName = saveFile(file, request);	// 저장된 파일 정보를 넘겨서 changeName 변수에 넣음
			
			b.setBOriginName(file.getOriginalFilename());
			b.setBChangeName(changeName);					// 새로운 파일을 저장함 

			// 새로 넘어온 파일이 있을 때만 기존파일 삭제. 파일 추가 안했을시 기존 파일 삭제 안함
			if(orgfile != null) { 							// 기존 파일 있는 경우 --> 서버에 업로드된 기존 파일 삭제
				deleteFile(orgfile, request);				// 기존 파일의 값이 있으면 삭제
			}
		}		
		//System.out.println("수정할 객체 확인 : " + b);

		boardService.updateBoard(b);
		model.addAttribute("msg", "게시글 수정이 완료되었습니다.");
							
		return "redirect:detailBoard.do";				// 게시글 수정 후 상세보기로 이동
	}
	
	// 댓글 목록 (라이브러리 gson 추가)
	@ResponseBody
	@RequestMapping(value = "rListBoard.do", produces = "application/json; charset=utf-8")
	public String selectReplyList(int bno) {
		
		// select 먼저 해서 가져옴
		ArrayList<Reply> list = boardService.selectReplyList(bno);
		
								//DateFormat 설정안하면 원하는대로 출력 안됨
		return new GsonBuilder().setDateFormat("yy-MM-dd HH:mm").create().toJson(list);
	}
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping(value = "rInsert.do", produces = "application/json; charset=utf-8")
	public String insertReply(Reply r) {
		
		int result = boardService.insertReply(r);
		
		return String.valueOf(result);
	}

	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "rDelete.do", produces = "application/json; charset=utf-8")
	public String deleteReply(int reno) {
		
		int result = boardService.deleteReply(reno);
		
		return String.valueOf(result);
	}
	
	
	// 신고된 게시글 상태값 변경, 신고 카테고리 추가하기
	@RequestMapping("bReport.do")
	public String bReport(int bno, int bReport, Model model) {
		
		System.out.println("신고할 글번호 확인 : " + bno);
		System.out.println("카테고리 넘버 : " + bReport);
		
		int brb = boardService.bReportBoard(bno, bReport);
		
		if(brb > 0) {									// 게시글 신고 성공할 경우
			Board b = boardService.selectBoard(bno);
			
			model.addAttribute("b", b);					// model을 이용해 view에 객체 정보 전달	
			//System.out.println("신고후 상세보기로 돌아기기 : " + b);
			model.addAttribute("msg", "신고가 완료되었습니다.");			
		}else {
			model.addAttribute("msg", "신고가 실패되었습니다.");
		}		
		System.out.println("결과 확인용 : " + brb);   
	            
		return "board/boardDetail";
	}

}
