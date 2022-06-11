package com.uni.spring.shop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProCategory {

	
	
	/*
	 CATE_CODE
	 CATE_NAME
	*/
	
	private String cateCode;//카테코드
	private String cateName;//카테명
}
