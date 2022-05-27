package com.uni.spring.garden.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.garden.GardenPagination;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;
import com.uni.spring.garden.model.service.GardenService;
import com.uni.spring.member.model.dto.Member;

@Controller
public class GardenController {

	@Autowired
	public GardenService gardenService;
	
	
	@RequestMapping("gardenMain.do")
		public String toMain(@RequestParam(value="hostUser", required=false)String hostUser, HttpSession session, Model model) {
		
		System.out.println("hostUser 널 체크 전 확인" + hostUser);
		
		//방명록 주인 회원번호
		if(hostUser == null) {
			hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
		}
		//호스트 유저 값은 다른 곳에서도 쓰이니까 세션에 값을 저장
		session.setAttribute("hostUser", hostUser);
		
		System.out.println("hostUser확인" + hostUser);
				
		
		//방문한 페이지의 방명록 3개 가져오기
		ArrayList<VisitorBoard> list = gardenService.getBoardList(hostUser);
		
		model.addAttribute("board", list);
		
		return "garden/gardenMain";
	}
	
	@RequestMapping("visitorBoard.do")
	public String visitorBoardList(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage, Model model, HttpSession session){
			//@RequestParam(value="currentPage") int currentPage --> 값이 넘어오지 않아서 에러가 발생
			
			//@RequestParam(value="currentPage" , required=false) int currentPage --> 
			//required : 해당 파라미터가 필수인지 여부를 나타냄 (true:필수)
			//required=false : 값이 필수가 아니다. 그래서 null이 들어올 수 있는데 null은 기본형 int에 들어갈 수 없어서 에러가 발생
			
			//@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage -->
			//defaultValue : 넘어오는 값이 null인 경우에 해당 파라미터 기본 값을 지정함
			
			//방명록 주인 회원번호
			//String hostUser = ((Member) session.getAttribute("loginUser")).getUserNo();
			String hostUser = (String) session.getAttribute("hostUser");
			
			System.out.println("hostUser 널 체크 전 " + hostUser);
			
			if(hostUser == null) {
				hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
				session.setAttribute("hostUser", hostUser);
			}
			
			System.out.println("hostUser 널 체크 후 " + hostUser);
			
			int listCount = gardenService.selectListCount(hostUser);

			//PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit)
			PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 5);
			
			//hostUser의 게시물 가져오기
			ArrayList<Board> list = gardenService.selectList(pi, hostUser);
			
			//hostUser 게시물에 달린 댓글 가져오기
			int commentCount = gardenService.selectCommentCount(hostUser);
			
			System.out.println("commentCount 확인 " + commentCount);
			
			PageInfo cPi = GardenPagination.getPageInfo(commentCount, currentPage, 10, 5);
			
			ArrayList<Board> comment = gardenService.selectCommentList(cPi, hostUser);
			
			System.out.println("comment리스트 확인 " + comment);
			 
			model.addAttribute("board", list);
			model.addAttribute("pi", pi);
			model.addAttribute("comment", comment);

			return "garden/visitorBoardList";
		}

	@RequestMapping("vBoardEnroll.do")
	public String boardEnroll(HttpSession session, String content, String writer, Model model) {
		
		System.out.println("content" + content);
		System.out.println("writer" + writer);
		//String hostUser = ((Member) session.getAttribute("loginUser")).getUserNo();
		String hostUser = (String) session.getAttribute("hostUser");
		
		Map map = new HashMap<String, String>();
		map.put("content", content);
		map.put("writer", writer);
		map.put("hostUser", hostUser);
		
		gardenService.insertBoard(map);

		return "redirect:visitorBoard.do";
		
	}
	
	@RequestMapping("deleteVBoard.do")
	public String boardDelete(HttpSession session, String boardNo, Model model) {
		
		gardenService.deleteBoard(boardNo);

		return "redirect:visitorBoard.do";
		
	}

	
	//이웃관리
	@RequestMapping("neighborList.do")
	public String neighborList(HttpSession session, Model model) {
		
		//로그인한 회원 번호
		String userNo = ((Member) session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Neighbor> list = gardenService.getNeighborList(userNo);
		
		model.addAttribute("list", list);
		
		System.out.println("list확인 " + list);
		
		return "garden/neighborList";	
	}
	
	@RequestMapping("deleteNeighbor.do")
	public String deleteNeighbor(String neighborNo) {
		
		gardenService.deleteNeighbor(neighborNo);
		
		return "redirect:neighborList.do";			
	}
	
	@RequestMapping("insertNeighbor.do")
	public String insertNeighbor(String nUserId, String userNo) {
		
		System.out.println("nUserId" + nUserId);
		System.out.println("userNo" + userNo);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("nUserId", nUserId); //추가하고 싶은 이웃의 아이디
		map.put("userNo", userNo); //로그인한 회원 번호		
		
		gardenService.insertNeighbor(map);
		return "redirect:neighborList.do";
	}
	
	@RequestMapping("insertComment.do")
	public String insertComment(String content, String boardNo, HttpSession session) {
		
		System.out.println("content확인" + content);
		System.out.println("boardNo확인" + boardNo);
		
		//작성자 회원번호 세션에서 가져오기
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("boardNo", boardNo);
		map.put("content", content);
		
		gardenService.insertComment(map);
		
		
		
		return "redirect:visitorBoard.do";
	}
}

