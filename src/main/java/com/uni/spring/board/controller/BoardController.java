package com.uni.spring.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.board.BoardPagination;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.board.model.service.BoardService;

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
	    //System.out.println(list.get(0));	//확인
	      
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

}
