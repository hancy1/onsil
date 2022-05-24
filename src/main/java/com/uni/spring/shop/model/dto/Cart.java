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
public class Cart {
	
	/*
	CART_NO
	USER_NO
	PRO_CODE
	AMOUNT
     */
	
	private int cartNo; //카트번호
	private int userNo; //유저번호
	private String proCode; //제품코드
	private int amount; //수량
	
}
