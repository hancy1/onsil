package com.uni.spring.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminShopController {

	
	
	
	@RequestMapping("adminProducts.do")
	public String toMain() {
		
		return "shop/adminProduct";
	}
	
}