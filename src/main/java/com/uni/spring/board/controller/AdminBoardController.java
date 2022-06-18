package com.uni.spring.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uni.spring.board.BoardPagination;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.board.model.service.AdminBoardService;


@Controller
public class AdminBoardController {
	
	@Autowired
	public AdminBoardService adminBoardService;
	
	// 신고 게시판 목록
	@GetMapping("adminBList.do")									// 파라미터 값 필수 아님
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
	      
	    int listCount = adminBoardService.selectListCount(); // 조회수
	      
	    PageInfo pi = BoardPagination.getPageInfo(listCount, currentPage, 10, 10); // 페이지 번호 10개씩, 게시글 10개씩 출력
	      
	    ArrayList<Board> list = adminBoardService.selectList(pi);
	      
	    model.addAttribute("list", list);
	    model.addAttribute("pi", pi);
	    
	    return "board/adminBoardListView";
	}


}
