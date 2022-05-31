package com.uni.spring.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductsController {
	
	
	
	@RequestMapping("listProducts.do")
	public String toMain() {
		
		return "shop/shopMain";
	}
	
	
	
		
		
	@RequestMapping("CartList.do")
	public String selectCartList() {
		
		return "shop/cart";
	}

}
