package com.uni.spring.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.member.model.dto.Member;
import com.uni.spring.shop.ShopPagination;
import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;
import com.uni.spring.shop.model.service.ShopService;


@Controller
public class ShopController {
	
	@Autowired
	public ShopService shopService;
	
	
	//메인페이지연결(DB아직)
	@RequestMapping("listProducts.do")
	public String toMain() {
		
		return "shop/shopMain";
	}
	
	
	//장바구니 연결(DB아직)	
	@RequestMapping("CartList.do")
	public String selectCartList() {
		
		return "shop/cart";
	}
	
	
	//마이 포인트 List 연결
	@RequestMapping("myPointList.do")
	public String selectMyPointList(Model model, HttpSession session ) {
				
		String userNo = ((Member) session.getAttribute("loginUser")).getUserNo();
		
		//System.out.println("회원번호 : " + userNo);
		ArrayList<Point> list = shopService.selectMyPoint(userNo);
		
		
		PointInfo point = shopService.selectPointTotal(userNo);
		
		model.addAttribute("list", list);
		model.addAttribute("point", point);
		
		
		return "shop/myPointList";
	}
	
	
	
	//마이 리뷰 List 연결
	@RequestMapping("myReviewList.do")
	public String selectMyReviewList(Model model, HttpSession session, @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) {
				
		String userNoS= ((Member) session.getAttribute("loginUser")).getUserNo();		
		int userNo = Integer.parseInt(userNoS);
		
		int listCount = shopService.myReviewListCount(userNo);
		
		
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<ProReview> list = shopService.selectMyReviewList(pi,userNo);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		
		return "shop/myReviewList";
	}
	
	
	//리뷰 디테일페이지	
	@RequestMapping("detailReview.do")
	public ModelAndView selectReview(int reviewNo, ModelAndView mv) {
		
		System.out.println("디테일 reviewNo : " + reviewNo);
		ProReview r = shopService.selectReview(reviewNo);
		
		mv.addObject("r", r).setViewName("shop/ReviewDetail");
		
		return mv;
	}

}
