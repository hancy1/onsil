package com.uni.spring.garden.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uni.spring.garden.model.service.GardenService;

@Controller
public class GardenController {

	@Autowired
	public GardenService gardenService;
	
	
	@RequestMapping("gardenMain.do")
	public String toMain() {
		
		return "garden/gardenMain";
	}
	
}
