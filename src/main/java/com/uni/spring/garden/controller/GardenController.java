package com.uni.spring.garden.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uni.spring.garden.model.dto.VisitorBoard;
import com.uni.spring.garden.model.service.GardenService;
import com.uni.spring.member.model.dto.Member;

@Controller
public class GardenController {

	@Autowired
	public GardenService gardenService;
	
	
	@RequestMapping("gardenMain.do")
	public String toMain(HttpSession session, Model model) {
		
		//작성자 회원번호
		//String writer = ((Member) session.getAttribute("loginUser")).getUserNo();
		
		//방명록 주인 회원번호
		String hostUser = ((Member) session.getAttribute("loginUser")).getUserNo();
		
		
		System.out.println("hostUser 확인 " + hostUser);
		
		ArrayList<VisitorBoard> list = gardenService.getBoardList(hostUser);
		
		System.out.println("list 확인" + list);
		
		model.addAttribute("board", list);
		
		return "garden/gardenMain";
	}
	
}
