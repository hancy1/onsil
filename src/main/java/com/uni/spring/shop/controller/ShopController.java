package com.uni.spring.shop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.shop.ShopPagination;
import com.uni.spring.shop.model.dto.Cart;
import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ReviewLike;
import com.uni.spring.shop.model.dto.ShopPageInfo;
import com.uni.spring.shop.model.service.ShopService;


@Controller
public class ShopController {
	
	@Autowired
	public ShopService shopService;
	
	
	//메인 숍 페이지연결 (DB완)
	@RequestMapping("listProducts.do")
	public String selectShopList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		
		
		int listCount = shopService.productListCount();
		
		
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Product> list = shopService.selectShopList(pi);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		
		
		return "shop/shopMain";
	}
	
	//검색 페이지연결
	@RequestMapping("productSearch.do")
	public String searchShopList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
								 Model model, String searchKeyword) {
		
		
		
		int listCount = shopService.productListCount();
		
		
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Product> list = shopService.searchShopList(pi,searchKeyword);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		
		
		return "shop/shopMain";
	}
	
	
	
	//tree카테
	@RequestMapping("treeListProducts.do")
	public String selectShopTreeList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
				
		int listCount = shopService.productTreeListCount();
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Product> list = shopService.selectShopTreeList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "shop/shopMain";
	}
	
	//edible카테
	@RequestMapping("edibleListProducts.do")
	public String selectShopEdibleList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
				
		int listCount = shopService.productEdibleListCount();
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Product> list = shopService.selectShopEdibleList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "shop/shopMain";
	}
	
	//꽃카테
	@RequestMapping("flowerListProducts.do")
	public String selectShopFlowerList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
				
		int listCount = shopService.productFlowerListCount();
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Product> list = shopService.selectShopFlowerList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "shop/shopMain";
	}
	
	//기타카테
	@RequestMapping("ectListProducts.do")
	public String selectShopEctList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
				
		int listCount = shopService.productEctListCount();
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Product> list = shopService.selectShopEctList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "shop/shopMain";
	}
	
	
	//장바구니 연결  (DB완)
	@RequestMapping("CartList.do")
	public String selectCartList(Model model, HttpSession session) {
		
		String userNoS = ((Member) session.getAttribute("loginUser")).getUserNo();
		int userNo = Integer.parseInt(userNoS);
		
		ArrayList<Cart> list = shopService.selectCartList(userNo);
		
		model.addAttribute("list", list);
		
		
		return "shop/cart";
	}
	
	

	//제품 디테일페이지 연결
	@RequestMapping("detailShop.do")
	public ModelAndView selectShop(String proCode, ModelAndView mv) {
		
		//하나의 제품 조회(상세페이지를 위해서)
		Product shop = shopService.selectShop(proCode);
		
		//해당하는 제품의 "리뷰" 리스트 조회
		ArrayList<ProReview> list = shopService.selectProReviewList(proCode);
		
		//System.out.println("컨트롤러에서 리뷰리스트 잘 불러와졌니? " + list);
		
		//리뷰 개수 표시하기 위해서 리뷰 개수 조회
		int rCount = shopService.proReviewListCount(proCode);
		
		System.out.println("리뷰갯수? " + rCount);
		
		mv.addObject("list", list);
		mv.addObject("rCount", rCount);
		mv.addObject("shop", shop).setViewName("shop/shopDetails");
		
		
		
		return mv;
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
	public ModelAndView selectReview(int reviewNo, ModelAndView mv, HttpSession session) {
		
		//리뷰 불러오기
		ProReview r = shopService.selectReview(reviewNo);
		
		//로그인 멤버 정보 불러오기
		String userNoS= ((Member) session.getAttribute("loginUser")).getUserNo();		
		int userNo = Integer.parseInt(userNoS);
		
		//도움됐어요 기능		
		ReviewLike goodHelp = new ReviewLike();
		
		goodHelp = shopService.selectLike(reviewNo,userNo);
		
		System.out.println("컨트롤러 리뷰라이크 DTO조회 " + goodHelp);
		
		mv.addObject("goodHelp", goodHelp);
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
	public ModelAndView deleteReview(int reviewNo, String fileName, ModelAndView mv, HttpServletRequest request, HttpSession session ) {
		
		System.out.println("삭제 시 컨트롤러 reviewNo : " + reviewNo);
		
		shopService.deleteReview(reviewNo);
		
		//if(!fileName.equals("")) {
		//	deleteFile(fileName, request);
		//}
		
		
		String userNoS= ((Member) session.getAttribute("loginUser")).getUserNo();		
		int userNo = Integer.parseInt(userNoS);
		
		System.out.println("삭제 컨트롤러 유저번호.....: "+userNo);
		
		mv.addObject("userNo",userNo).setViewName("redirect:myReviewList.do");
		
		
		return mv;
	}
	
	
	
	

	//내 주문 List 연결
	@RequestMapping("myOrderList.do")
	public String selectOrderList(Model model, HttpSession session) {
		
		String userNoS = ((Member) session.getAttribute("loginUser")).getUserNo();
		int userNo = Integer.parseInt(userNoS);
		
		ArrayList<ProOrder> list = shopService.selectOrderList(userNo);
		
		model.addAttribute("list", list);
		
		
		return "shop/myOrderList";
	}
	
	
	//내 주문 취소 List 연결
	@RequestMapping("myOrderCancelList.do")
	public String selectOrderCancelList(Model model, HttpSession session) {
		
		String userNoS = ((Member) session.getAttribute("loginUser")).getUserNo();
		int userNo = Integer.parseInt(userNoS);
		
		ArrayList<ProOrder> list = shopService.selectOrderCancelList(userNo);
		
		model.addAttribute("list", list);
		
		
		return "shop/myOrderCancelList";
	}
	
	
	
	
	//장바구니 삭제
	
	@RequestMapping("deleteCart.do")
	public String deleteCart(int cartNo, HttpServletRequest request ) {
		
		
		//int cartNo1 = Integer.parseInt(cartNo);
		
		System.out.println("컨트롤러 cartNo : " + cartNo);
		shopService.deleteCart(cartNo);		
	
		
		return "redirect:CartList.do";
	}
	
	
	//장바구니추가
	@RequestMapping("insertCart.do")
	public String insertCart(String proCode, int userNo, int amount, HttpServletRequest request) {
				
		System.out.println("proCode 컨트롤러에 뭘로 가져오니? : " + proCode);
		
		//이거 차트객체에 셋해주는걸로 바꾸기~~!!
		
		Map cartMap = new HashMap<String, String>();
		cartMap.put("proCode", proCode);
		cartMap.put("userNo", userNo);
		cartMap.put("amount", amount);
		
		shopService.insertCart(cartMap);
		

		
		return "redirect:CartList.do";
	}
	
	//주문 취소요청(R으로 업데이트!)		
	@RequestMapping("OrderCancelRequest.do")
	public String cancelRequestOrder(int orderNo, HttpServletRequest request ) {
		
		//System.out.println("컨트롤러로 오더넘버 넘어오니? "+orderNo);
		shopService.cancelRequestOrder(orderNo);
	
		
		return "redirect:myOrderList.do";
	}
	
	
	//주문최종확정 (C로 업데이트!)		
	@RequestMapping("OrderOk.do")
	public String OkOrder(int orderNo, HttpServletRequest request ) {
		
		//System.out.println("컨트롤러로 오더넘버 넘어오니? "+orderNo);
		shopService.OkOrder(orderNo);
	
		
		return "redirect:myOrderList.do";
	}
	
	
	//리뷰 추가폼 연결
	@RequestMapping("reviewEnrollForm.do")
	public String enrollFormFreebie(int orderNo, Model model) {
				
		model.addAttribute("orderNo", orderNo);
				
		return "shop/reviewEnrollForm";
	
	}
	
	//리뷰 추가	
	@RequestMapping("insertReview.do")
	public String insertReview(ProReview r, int userNo, int orderNo, HttpServletRequest request, @RequestParam(name="uploadFile", required=false) MultipartFile file) {
				
		//System.out.println("orderNo 컨트롤러에 뭘로 가져오니? : " + orderNo);
		//System.out.println("userNo 컨트롤러에 뭘로 가져오니? : " + userNo);
				
		//오더넘버로 proCode조회해오기
		String proCode = shopService.selectProductCode(orderNo);		
		System.out.println("제대로 proCode가져왔니? : " + proCode);
		
		
		//전달되는 파일이 없을 때 빈문자열이 넘어온다. 빈문자열이 아닐때(=파일이 있을때)
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			
			if(changeName != null) {			
				
				r.setOriginName(file.getOriginalFilename());
				r.setChangeName(changeName);
			}			
		}
		
		//가져온 값들 set
		
		r.setRefOderNo(orderNo);
		r.setProCode(proCode);
		r.setReviewWriter(userNo);
		
		//System.out.println("ProReview 다 잘 가져왔니?- 파일명도?  : " + r);
		
		shopService.insertReview(r);
		
		
		//리뷰 작성 시 100포인트적립 하는 메소드
		insertPoint(userNo,100,"적립");
		
		
		//오더 테이블에 리뷰 작성 여부 Y로 업데이트
		shopService.updateOTableReviewOk(orderNo);
		
		return "redirect:myReviewList.do";
	}

	
	//포인트 적립,사용 하는 메소드
	private void insertPoint(int userNo, int pointVal, String pointType) {
		// TODO Auto-generated method stub
		
		Point p = new Point();
		
		p.setUserNo(userNo);
		p.setPointVal(pointVal);
		p.setPointType(pointType);
		
		shopService.insertPoint(p);
		
		System.out.println("안내 : (유저번호)"+userNo+"님 에게 "+pointVal+"포인트 "+pointType+"완료!");
		
	}
	
	//오더 디테일페이지	
	@RequestMapping("detailOrder.do")
	public ModelAndView selectOrder(int orderNo, ModelAndView mv) {
		
		
		ProOrder o = shopService.selectOrder(orderNo);
		
		mv.addObject("o", o).setViewName("shop/myOrderDetail");
		
		return mv;
	}
	
	
	//주문 Form 연결
	@RequestMapping("orderForm.do")
	public String formOrder(String proCode, int amount, Model model, HttpSession session) {
		
		Product p = shopService.selectShop(proCode);
		Member m = (Member) session.getAttribute("loginUser");			
		ArrayList<Freebie> fList = shopService.selectFreebieList();
		

		model.addAttribute("p", p);
		model.addAttribute("m", m);
		model.addAttribute("amount", amount);
		model.addAttribute("fList", fList);
				
		return "shop/orderForm";
	
	}
	
	
	//결제페이지 연결, 주문 insert
	@RequestMapping("orderPay.do")
	public String insertOrder (ProOrder o, String proCode, String address,String addressDetail,
							   String orderPhone, String orderName, int amount,
							   Model model, HttpSession session) {
		
		Product p = shopService.selectShop(proCode);
		Member m = (Member) session.getAttribute("loginUser");		
		int userNo = Integer.parseInt(m.getUserNo());
		
		
		//토탈가격이랑 포인트 가격 계산
		int price = p.getPrice();
		int totalPrice = amount*price;
		int point = (int) (totalPrice * 0.1);
		
	
		o.setAddress(address);
		o.setAddressDetail(addressDetail);
		o.setOrderPhone(orderPhone);
		o.setOrderName(orderName);
		o.setAmount(amount);
		o.setProCode(proCode);
		o.setUserNo(userNo);
		o.setFreeNo(3);		
		o.setPayCode("card");
		
		shopService.insertOrder(o);
		insertPoint(userNo, point, "적립");
		
		model.addAttribute("point", point);
				
		return "shop/orderResult";
	
	}
	
	@ResponseBody
	@RequestMapping("selectBestSeller.do")
	public ArrayList<Product> selectBestSeller() {

		ArrayList<Product> list = shopService.selectBestSeller();
				
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "insertLike.do", produces="application/json; charset=utf-8")
	public int insertLike (ReviewLike rLike) {
		
		int result = shopService.insertLike(rLike);
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "likeCount.do", produces="application/json; charset=utf-8")
	public int likeCount (int reviewNo) {
		
		int count = shopService.likeCount(reviewNo);
		return count;
	}
	

}
