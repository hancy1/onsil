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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.uni.spring.board.BoardPagination;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.board.model.dto.Reply;
import com.uni.spring.board.model.service.AdminBoardService;
import com.uni.spring.board.model.service.BoardService;
import com.uni.spring.common.exception.CommException;

@Controller
public class AdminBoardController {
	
	@Autowired
	public AdminBoardService adminBoardService;
	
	// 게시판 목록
	@GetMapping("adminBList.do")									// 파라미터 값 필수 아님
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
	      
	    return "board/adminBListView";
	}
	
	// 신고된 게시글 상태값 변경
	@RequestMapping("bReport.do")
	public String bReport() {
		return null;
	}

}
