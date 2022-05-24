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
public class Product {	

	
	
	/*	PRO_CODE
		CATE_CODE
		PRO_NAME
		PRICE
		DETAIL_ORI
		DETAIL_CHA
		PRO_AMOUNT
		PRO_STATUS
	*/
	
	private int proCode; //제품코드
	private int cateCode; //카테코드
	private String proName; //제품네임
	private int price; //가격
	private String detailOri; //제품사진원본명
	private String detailCha; //제품사진수정명
	private int proAmount; //재고
	private String proStatus; //판매상태

}
