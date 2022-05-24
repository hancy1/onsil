package com.uni.spring.garden.controller;

import java.util.ArrayList;

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
		
		String userNo = ((Member) session.getAttribute("loginUser")).getUserNo();

		System.out.println("userNo 확인 " + userNo);

		ArrayList<VisitorBoard> list = gardenService.getBoardList(userNo);
		
		System.out.println("list 확인" + list);
		
		model.addAttribute("board", list);
		
		return "garden/gardenMain";
	}
	
}
