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
public class Pay {

	/*
	PAY_CODE
	PAY_NAME
	*/
	
	private String payCode;//결제코드
	private String payName;//결제방식
}
