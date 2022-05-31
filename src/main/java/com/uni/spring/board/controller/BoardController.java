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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.board.BoardPagination;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.board.model.service.BoardService;
import com.uni.spring.common.exception.CommException;

@Controller
public class BoardController {
	
	@Autowired
	public BoardService boardService;
	
	// 게시판 목록
	@RequestMapping("boardList.do")
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		// @RequestParam(value="currentPage") int currentPage --> 값이 넘어오지 않아서(값을 주입할 수 없기 때문에) 에러
	    // @RequestParam(value="currentPage", required = false) int currentPage
	      
	    // required : 해당 파라미터가 필수인지 여부 (true 면 필수)
	    // required = false 값을 꼭 받아줄 필요가 없다고 선언. 그래서 null 이 들어올 수 있다.
	    // --> null 은 기본형 int 에 들어갈 수 없기 때문에 에러발생
	       
	    // @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage
	    // defaultValue : 넘어오는 값이 null 인 경우에 해당 파라미터 기본 값 지정
	      
	    int listCount = boardService.selectListCount();
	      
	    PageInfo pi = BoardPagination.getPageInfo(listCount, currentPage, 10, 5);
	      
	    ArrayList<Board> list = boardService.selectList(pi);
	    //System.out.println(list.get(0));	//게시판 목록 넘어오는지 확인
	      
	    model.addAttribute("list", list);
	    model.addAttribute("pi", pi);
	      
	    return "board/boardListView";
	}
	
	// 게시판 상세보기
	@RequestMapping("detailBoard.do")
	public ModelAndView selectboard(int bno, ModelAndView mv) {
		   
		Board b =  boardService.selectBoard(bno);
		   
		mv.addObject("b", b).setViewName("board/boardDetail");
		   
		return mv;		   
	}
	
	// 게시판 작성하기 폼으로 이동
	@RequestMapping("enrollBoard.do")
	public String enrollForm() {
		   
		return "board/boardEnroll";
	}
	
	// 게시글 작성하기
	@RequestMapping("insertBoard.do")
	public String insertBoard(Board b, HttpServletRequest request, @RequestParam(name="uploadFile", required = false) MultipartFile file) {
		
	   System.out.println(b);
	   System.out.println(file.getOriginalFilename());		//안넘어오네...?
	   
	   if(!file.getOriginalFilename().equals("")) {			//전달받은 파일이 없으면 빈 문자열
	   
	   String changeName = saveFile(file, request);		//메소드 생성해 줌
	   
	   if(changeName != null) {
	        b.setBOriginName(file.getOriginalFilename());
	        b.setBChangeName(changeName);
	     }
	  } 
	  
	  boardService.insertBoard(b);   
	  
	  return "redirect:listBoard.do"; //글 작성하면 게시글 목록으로
		   
	}

	//전달받은 파일을 업로드 시킨 후 수정된 파일명 리턴하는 역할
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");	
		System.out.println(resources);					//웹컨테이너에서의 resources 폴더 경로 추출
   
		String savePath = resources + "\\upload_files\\"; //uplaod_files 안에 넣겠다

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

}
