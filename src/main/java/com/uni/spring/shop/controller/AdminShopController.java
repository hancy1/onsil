package com.uni.spring.shop.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	
}
