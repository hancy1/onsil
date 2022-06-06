package com.uni.spring.shop.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.common.exception.CommException;
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
	
	
	//메인 숍 페이지연결(DB아직)
	@RequestMapping("listProducts.do")
	public String selectShopList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		
		
		int listCount = shopService.productListCount();
		
		
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Product> list = shopService.selectShopList(pi);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		
		
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
		
		//System.out.println("디테일 reviewNo : " + reviewNo);
		ProReview r = shopService.selectReview(reviewNo);
		
		mv.addObject("r", r).setViewName("shop/ReviewDetail");
		
		return mv;
	}
	
	
	//리뷰 수정 폼 연결
	@RequestMapping("updateFormReview.do")
	public ModelAndView updateFormReview(int reviewNo, ModelAndView mv) {
		
		//System.out.println("리뷰번호 넘어오니? " + reviewNo);
		
		mv.addObject("r", shopService.selectReview(reviewNo))
		.setViewName("shop/reviewUpdateForm");
		
		return mv;
	}
	
	
	
	//전달받은 파일을 업로드시키고 수정된 파일명 리턴함
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		
		
		String savePath = resources+"\\pro_upload_files\\";
		System.out.println("파일저장 경로 : " + savePath);
		
		String originName = file.getOriginalFilename();
		//업로드시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//확장자 잘라오기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//시스템파일명생성
		String changeName = currentTime+ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			throw new CommException("파일 업로드 에러");
		}
		
		return changeName;
	}

	
	
	//파일지우기
	private void deleteFile(String fileName, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		String resources = request.getSession().getServletContext().getRealPath("resources");		
		String savePath = resources+"\\pro_upload_files\\";
		
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
		
	}
	
	
	//리뷰 수정
	
	@RequestMapping("updateReview.do")
	public ModelAndView updateReview(ProReview r, ModelAndView mv, HttpServletRequest request,
								@RequestParam(name = "reUploadFile", required = false) MultipartFile file ) {
		
	
		String orgChangeName = r.getChangeName();
		
		//새로 넘어온 파일이 있는(O) 경우
		if(!file.getOriginalFilename().equals("")) {			
			
			
			//새로넘어온 파일 O , 기존 파일도 O
			//-->서버에 업로드 된 기존 파일 삭제해야됨!
			if( orgChangeName!= null) {
				
				deleteFile(orgChangeName, request);
			}			
			
			//다시 세팅해주기! 기존파일 없는 경우도 세팅해야됨! 있는경우는 삭제해주고 세팅!
			String changeName = saveFile(file, request);
		
						
			
			r.setOriginName(file.getOriginalFilename());
			r.setChangeName(changeName);
		}		
	
		
		shopService.updateReview(r);		
		
		
		
		int reviewNo = r.getReviewNo();
		
		
		mv.addObject("reviewNo",reviewNo).setViewName("redirect:detailReview.do");
		
		return mv;
	}
	
	
	//리뷰 삭제(n으로 업데이트)		
	@RequestMapping("deleteReview.do")
	public String deleteReview(int reviewNo, String fileName, HttpServletRequest request, HttpSession session ) {
		
		System.out.println("삭제 시 컨트롤러 reviewNo : " + reviewNo);
		
		shopService.deleteReview(reviewNo);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		
		return "redirect:myReviewList.do";
	}
	
	
}
