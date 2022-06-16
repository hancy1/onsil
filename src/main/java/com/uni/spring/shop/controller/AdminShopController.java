package com.uni.spring.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.shop.ShopPagination;
import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.ProStock;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;
import com.uni.spring.shop.model.service.AdminShopService;

@Controller
public class AdminShopController {

	@Autowired
	public AdminShopService aShopService;
	
	
	//제품리스트
	@RequestMapping("adminProducts.do")
	public String selectProductList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model ) {
				
		int listCount = aShopService.selectListCount();
				
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 10);		
		ArrayList<Product> list = aShopService.selectList(pi);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		return "shop/adminProduct";
	}
	
	
	
	//제품추가하는 폼 열기
	@RequestMapping("adminEnrollFormProduct.do")
	public String enrollFormProduct() {
		
	  return "shop/adminProductEnrollForm";
	
	}
	
	
	//제품 insert
	@RequestMapping("insertProduct.do")
	public String insertProduct(Product p , HttpServletRequest request, @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		
		//전달되는 파일이 없을 때 빈문자열이 넘어온다. 빈문자열이 아닐때(=파일이 있을때)
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			
			if(changeName != null) {
			
				p.setDetailOri(file.getOriginalFilename());
				p.setDetailCha(changeName);
			}
			
		}
		
		
		aShopService.insertProduct(p);
		//System.out.println("등록될 제품 정보 :" + p);
		
		return "redirect:adminProducts.do";
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

	
		
		//제품 디테일페이지 연결
		@RequestMapping("detailProduct.do")
		public ModelAndView selectProduct(String proCode, ModelAndView mv) {
			
			//System.out.println("디테일 proCode : " + proCode);
			Product p = aShopService.selectProduct(proCode);
			
			mv.addObject("p", p).setViewName("shop/adminProductDetail");
			
			return mv;
		}
		
		
		
		
		
		//제품 삭제(n으로 업데이트)		
		@RequestMapping("deleteProduct.do")
		public String deleteProduct(String proCode, String fileName, HttpServletRequest request ) {
			
			
			aShopService.deleteProduct(proCode);
			
			if(!fileName.equals("")) {
				deleteFile(fileName, request);
			}
			
			return "redirect:adminProducts.do";
		}
		
		
		//파일지우기
		private void deleteFile(String fileName, HttpServletRequest request) {
			// TODO Auto-generated method stub
			
			
			String resources = request.getSession().getServletContext().getRealPath("resources");		
			String savePath = resources+"\\pro_upload_files\\";
			
			
			File deleteFile = new File(savePath + fileName);
			deleteFile.delete();
			
			
		}
		
		
		//제품 수정폼연결
		
		@RequestMapping("updateFormProduct.do")
		public ModelAndView updateFormProduct(String proCode, ModelAndView mv) {
			
			mv.addObject("p", aShopService.selectProduct(proCode))
			.setViewName("shop/adminProductUpdateForm");
			
			return mv;
		}
		
		//제품 수정
		
		@RequestMapping("updateProduct.do")
		public ModelAndView updateProduct(Product p, ModelAndView mv, HttpServletRequest request,
									@RequestParam(name = "reUploadFile", required = false) MultipartFile file ) {
			
			String orgChangeName = p.getDetailCha();			
			
			//새로 넘어온 파일이 있는(O) 경우
			if(!file.getOriginalFilename().equals("")) {			
				
				
				//새로넘어온 파일 O , 기존 파일도 O
				//-->서버에 업로드 된 기존 파일 삭제해야됨!
				if( orgChangeName!= null) {
					
					deleteFile(orgChangeName, request);
				}			
				
			//다시 세팅해주기! 기존파일 없는 경우도 세팅해야됨! 있는경우는 삭제해주고 세팅!
			String changeName = saveFile(file, request);
			
							
			p.setDetailOri(file.getOriginalFilename());
			p.setDetailCha(changeName);
				
			}		
		
			
			aShopService.updateProduct(p);		
			
			
			String proCode = p.getProCode();
			System.out.println("디테일 수정 후 proCode : " + proCode);
			
			mv.addObject("proCode",proCode).setViewName("redirect:detailProduct.do");
			
			return mv;
		}
		
		//사은품 리스트
		@RequestMapping("adminFreebieList.do")
		public String adminFreebieList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model ) {
			
			
			int listCount = aShopService.freebieListCount();
			
			
			ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 5);
			
			ArrayList<Freebie> list = aShopService.selectFreebieList(pi);
			
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			
			return "shop/adminFreebieList";
		}
		
		
		
		//사은품 추가하는 폼 열기
		@RequestMapping("adminEnrollFormFreebie.do")
		public String enrollFormFreebie() {
			
		  return "shop/adminFreebieEnrollForm";
		
		}
		
		
		
		//사은품 insert
		@RequestMapping("insertFreebie.do")
		public String insertFreebie(Freebie f , HttpServletRequest request, @RequestParam(name="uploadFile", required=false) MultipartFile file) {
			
			
			//전달되는 파일이 없을 때 빈문자열이 넘어온다. 빈문자열이 아닐때(=파일이 있을때)
			if(!file.getOriginalFilename().equals("")) {
				String changeName = saveFile(file, request);
				
				
				if(changeName != null) {
				
					f.setOriginName(file.getOriginalFilename());
					f.setChangeName(changeName);
				}				
			}
			
			
			aShopService.insertFreebie(f);
			
			
			System.out.println("등록될 사은품 정보 :" + f);
			
			return "redirect:adminFreebieList.do";
		}
		
		
		//사은품 디테일페이지 연결
		@RequestMapping("detailFreebie.do")
		public ModelAndView selectFreebie(int freeNo, ModelAndView mv) {
			
			//System.out.println("디테일 freeNo : " + freeNo);
			Freebie f = aShopService.selectFreebie(freeNo);
			
			mv.addObject("f", f).setViewName("shop/adminFreebieDetail");
			
			return mv;
		}
		
		
		//사은품 삭제		
		@RequestMapping("deleteFreebie.do")
		public String deleteFreebie(int freeNo, String fileName, HttpServletRequest request ) {
			
			
			aShopService.deleteFreebie(freeNo);
			
			if(!fileName.equals("")) {
				deleteFile(fileName, request);
			}
			
			return "redirect:adminFreebieList.do";
		}
		
		
		//사은품 수정폼연결
		
		@RequestMapping("updateFormFreebie.do")
		public ModelAndView updateFormFreebie(int freeNo, ModelAndView mv) {
			
			mv.addObject("f", aShopService.selectFreebie(freeNo))
			.setViewName("shop/adminFreebieUpdateForm");
			
			return mv;
		}
		
		//사은품 수정
		
		@RequestMapping("updateFreebie.do")
		public ModelAndView updateFreebie(Freebie f, ModelAndView mv, HttpServletRequest request,
									@RequestParam(name = "reUploadFile", required = false) MultipartFile file ) {
									
			
			String orgChangeName = f.getChangeName();
			
			//새로 넘어온 파일이 있는(O) 경우
			if(!file.getOriginalFilename().equals("")) {			
				
				
				//새로넘어온 파일 O , 기존 파일도 O
				//-->서버에 업로드 된 기존 파일 삭제해야됨!
				if( orgChangeName!= null) {
					
					deleteFile(orgChangeName, request);
				}			
				
				//다시 세팅해주기! 기존파일 없는 경우도 세팅해야됨! 있는경우는 삭제해주고 세팅!
				String changeName = saveFile(file, request);
			
										
				f.setOriginName(file.getOriginalFilename());
				f.setChangeName(changeName);
			}		
		
			
			aShopService.updateFreebie(f);		
			
			int freeNo = f.getFreeNo();
			
			mv.addObject("freeNo",freeNo).setViewName("redirect:detailFreebie.do");
			
			return mv;
		}

		
		
		//리뷰 리스트
		@RequestMapping("adminReviewList.do")
		public String selectReviewList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model ) {
			
			
			int listCount = aShopService.reviewListCount();
			
			
			ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 10);
			
			ArrayList<ProReview> list = aShopService.selectReviewList(pi);
			
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			
			
			
			return "shop/adminReviewList";
		}
		
		
		
		//리뷰 삭제(n으로 업데이트)		
		@RequestMapping("deleteAdminReview.do")
		public String deleteAdminReview(int reviewNo, String fileName, HttpServletRequest request ) {
			
			System.out.println("컨트롤러로 리뷰넘버 넘어오니? "+reviewNo);
			aShopService.deleteAdminReview(reviewNo);
			
			//if(!fileName.equals("")) {
				//deleteFile(fileName, request);
			//}
			
			return "redirect:adminReviewList.do";
		}
		
		
		//재고List
		@RequestMapping("inventoryList.do")
		public String selectInventoryList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model ) {
			
			
			int listCount = aShopService.inventoryListCount();
			
			
			ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 20);
			
			ArrayList<ProStock> list = aShopService.selectInventoryList(pi);
			
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			
			
			
			return "shop/adminStockList";
		}
		
		
		//재고 추가하는 폼 열기
		@RequestMapping("adminEnrollFormStock.do")
		public String enrollFormInventory(Model model) {
			
			//제품코드 List불러와야됨
			 ArrayList<Product> list = aShopService.selectpCodeList();
			
			 model.addAttribute("list", list);
			 System.out.println("컨트롤러 : " + list);
				
			 return "shop/adminStockEnrollForm";
		
		}
		
		
		//재고관리 insert(출고/입고)

		@RequestMapping("insertInventory.do")
		public String insertInventory(ProStock stock) {
					
			aShopService.insertInventory(stock);
					
			return "redirect:inventoryList.do";
		}
		
		
		
		// 주문관리 페이지 
		@RequestMapping("adminOrderList.do")
		public String selectOrderList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
			
			
			
			int listCount = aShopService.orderListCountAll();
			
			ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 15);			
			
			
			ArrayList<ProOrder> list = aShopService.selectOrderList(pi); 
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);		
			
			return "shop/adminOrderList";
		}
		
		
		// 주문관리 페이지  : 취소요청건!
		@RequestMapping("adminOrderListRequest.do")
		public String selectOrderRequestList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
			
			
			
			int listCount = aShopService.orderListCountRequest();
			
			ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 15);			
			
			
			ArrayList<ProOrder> list = aShopService.selectOrderRequestList(pi); 
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);		
			
			return "shop/adminOrderList";
		}
		
		
		
		// 주문관리 페이지 : 취소완료건
		@RequestMapping("adminOrderListCancel.do")
		public String selectOrderCancelList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
			
			
			
			int listCount = aShopService.orderListCountCancel();
			
			ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 15);			
			
			
			ArrayList<ProOrder> list = aShopService.selectOrderCancelList(pi); 
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);		
			
			return "shop/adminOrderList";
		}
		
		
		
		
		//주문취소(n으로 업데이트)		
		@RequestMapping("cancelOrder.do")
		public String cancelAdminOrder(int orderNo, HttpServletRequest request ) {
			
			System.out.println("컨트롤러로 오더넘버 넘어오니? "+orderNo);
			aShopService.cancelAdminOrder(orderNo);
		
			
			return "redirect:adminOrderListCancel.do";
		}
		
		
		@ResponseBody
		@RequestMapping(value = "selectProductInfo.do", produces="application/json; charset=utf-8")
		public Product selectProductInfo(String proCode) {
			
			Product pInfo = aShopService.selectProduct(proCode);
			return pInfo;
		}
		

		// 주문관리 페이지 
		@RequestMapping("salesList.do")
		public String selectSalesList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
			
			
			
			int listCount = aShopService.orderListCountAll();
			
			ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 15);			
			
			
			ArrayList<ProOrder> list = aShopService.selectOrderList(pi); 
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);		
			
			return "shop/adminSalesList";
		}

		
}
