package com.uni.spring.shop.model.dto;

import java.sql.Date;

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

public class ProOrder {

	
	/*
	ORDER_NO
	CART_NO
	PRO_CODE
	FREE_NO
	USER_NO
	PAY_CODE
	AMOUNT
	ORDER_NAME
	ORDER_PHONE
	ADDRESS
	ADDRESS_DETAIL
	ORDER_STATUS
	ORDER_DATE
	*/
	
	
	private int orderNo; //오더번호
	private int cartNo; //카트번호
	private String proCode; //제품코드
	private int freeNo; //사은품번호
	private int userNo; //유저번호
	private String payCode;//결제코드
	private int amount; //수량
	private String orderName;//수령인
	private String orderPhone;//연락처
	private String address;//배송주소
	private String addressDetail;//배송상세주소
	private String orderStatus;//오더상태 디폴트 Y	
	private Date orderDate;//등록날짜


	
}
