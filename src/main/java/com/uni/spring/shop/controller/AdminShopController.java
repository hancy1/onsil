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
import org.springframework.web.multipart.MultipartFile;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.shop.ShopPagination;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;
import com.uni.spring.shop.model.service.AdminShopService;

@Controller
public class AdminShopController {

	@Autowired
	public AdminShopService aShopService;
	
	
	@RequestMapping("adminProducts.do")
	public String selectProductList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model ) {
		
		
		int listCount = aShopService.selectListCount();
		
		
		ShopPageInfo pi = ShopPagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Product> list = aShopService.selectList(pi);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		
		
		return "shop/adminProduct";
	}
	
	
	
	@RequestMapping("adminEnrollFormProduct.do")
	public String enrollFormProduct() {
		
	  return "shop/adminProductEnrollForm";
	
	}
	
	
	//게시판 글쓰기
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
			System.out.println("등록될 글정보 :" + p);
			
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

	
}
