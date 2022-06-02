package com.uni.spring.shop.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

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
public class ProStock {

	
	
	/*
	 * 
	STOCK_NO
	PRO_CODE
	STOCK_STATUS
	AMOUNT
	STOCK_DATE
	 */
	
	private int stockNo; 			//재고등록번호
	private String proCode; 		//판매상품코드
	private String stockStatus;	    //구분(입/출고)
	private int amount; 			//수량
	//private Date stockDate;		//등록날짜
	private Timestamp stockDate;	//등록날짜
}
